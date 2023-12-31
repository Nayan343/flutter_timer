import 'package:flutter_timer/features/main/data/repositories/ticker_repository_impl.dart';
import 'package:flutter_timer/features/main/domain/repositories/ticker_repository.dart';
import 'package:flutter_timer/features/main/domain/use_cases/ticker_use_case.dart';
import 'package:flutter_timer/features/main/presentation/manager/timer/timer_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> injectDependencies() async{
  // Repositories
  sl.registerSingleton<TickerRepository>(TickerRepositoryImpl());

  // UseCases
  sl.registerSingleton<TickerUseCase>(TickerUseCase(sl<TickerRepository>()));

  // bloc
  sl.registerSingleton<TimerBloc>(TimerBloc());
}