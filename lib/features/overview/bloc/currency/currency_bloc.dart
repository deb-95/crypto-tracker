import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cryptotracker/app/settings/currencies.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final Locale appLocale;
  CurrencyBloc({this.appLocale})
      : super(CurrencyState(
            selectedCurrency:
                kDefaultCurrency.containsKey(appLocale.countryCode)
                    ? kDefaultCurrency[appLocale.countryCode]
                    : kDefaultCurrency[appLocale.languageCode]));

  @override
  Stream<CurrencyState> mapEventToState(CurrencyEvent event) async* {
    if (event is CurrencyChangeEvent) {
      yield CurrencyState(selectedCurrency: event.newCurrency);
    }
  }
}
