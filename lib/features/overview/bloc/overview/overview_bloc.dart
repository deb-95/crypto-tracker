import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptotracker/features/overview/models/crypto_card_data.dart';
import 'package:cryptotracker/features/overview/service/overview_service.dart';
import 'package:equatable/equatable.dart';

part 'overview_event.dart';
part 'overview_state.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  OverviewBloc() : super(OverviewInitial());

  @override
  Stream<OverviewState> mapEventToState(
    OverviewEvent event,
  ) async* {
    if (event is OverviewGetData) {
      print('Added event with ${event.currency}');
      final service = OverviewService();
      yield OverviewLoading();
      try {
        final results = await service.getOverviewList(event.currency);
        yield OverviewLoaded(results);
      } on Exception catch (e) {
        yield OverviewError(e.toString());
      }
    }
  }
}
