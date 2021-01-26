import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptotracker/features/detail/models/crypto_graph_model.dart';
import 'package:cryptotracker/features/detail/service/detail_service.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial());

  @override
  Stream<DetailState> mapEventToState(
    DetailEvent event,
  ) async* {
    if (event is DetailGetMainData) {
      print('Added event with ${event.coin} ${event.currency}');
      final service = DetailService();
      yield DetailLoading();
      try {
        final result = await service.getDetailList(
            coin: event.coin, currency: event.currency);
        final graphData = CryptoGraphVM.fromDTO(result);
        yield DetailLoaded(graphData);
      } on Exception catch (e) {
        yield DetailError(e.toString());
      }
    }
  }
}
