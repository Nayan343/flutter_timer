import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/core/resources/data_state/data_state.dart';
import 'package:flutter_timer/features/main/domain/use_cases/ticker_use_case.dart';
import 'package:flutter_timer/injection_container.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onTimerPaused);
    on<TimerResumed>(_onTimerResumed);
    on<TimerReset>(_onTimerReset);
    on<_TimerTicked>(_onTimerTicked);
  }

  static const int _duration = 60;
  StreamSubscription<DataState<int>>? _timerSubscription;

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.duration));
    _timerSubscription?.cancel();
    _timerSubscription =
        sl<TickerUseCase>().call(params: event.duration).listen((duration) {
      if (duration is DataSuccess) {
        add(_TimerTicked(duration: duration.data ?? 0));
      }
    });
  }

  void _onTimerPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _timerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _onTimerResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _timerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  void _onTimerReset(TimerReset event, Emitter<TimerState> emit) {
    _timerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }

  void _onTimerTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete(),
    );
  }
}
