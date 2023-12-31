import 'package:flutter_timer/core/resources/data_state/data_state.dart';
import 'package:flutter_timer/core/usecases/use_case.dart';
import 'package:flutter_timer/features/main/domain/repositories/ticker_repository.dart';

class TickerUseCase implements UseCase<DataState<int>, int?> {
  final TickerRepository _tickerRepository;
  const TickerUseCase(this._tickerRepository);

  @override
  Stream<DataState<int>> call({int? params}) {
    return _tickerRepository.tick(ticks: params);
  }

}