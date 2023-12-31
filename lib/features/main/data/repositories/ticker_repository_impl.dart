import 'package:flutter_timer/core/resources/data_state/data_state.dart';
import 'package:flutter_timer/features/main/domain/repositories/ticker_repository.dart';

class TickerRepositoryImpl extends TickerRepository{
  @override
  Stream<DataState<int>> tick({int? ticks}) {
    ticks ??= 60;
    return Stream.periodic(const Duration(seconds: 1), (x) => DataSuccess(ticks! - x - 1)).take(ticks);
  }
}