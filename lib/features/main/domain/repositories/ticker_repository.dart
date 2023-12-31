import 'package:flutter_timer/core/resources/data_state/data_state.dart';

abstract class TickerRepository{
  Stream<DataState<int>> tick({int? ticks});
}