import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('CurrencyBloc', () {
    CurrencyBloc currencyBloc;

    setUp(() {
      currencyBloc = CurrencyBloc(appLocale: Locale('it'));
    });

    tearDown(() {
      currencyBloc.close();
    });

    test('initial state of CurrencyBloc is CurrencyBloc(selectedCurrency:EUR)',
        () {
      expect(currencyBloc.state, CurrencyState(selectedCurrency: 'EUR'));
    });

    blocTest(
        'the CurrencyBloc should emit a CurrencyState(selectedCurrency: eventCurrency) when the CurrencyChangedEvent is emitted',
        build: () => currencyBloc,
        act: (CurrencyBloc bloc) => bloc.add(CurrencyChangeEvent(newCurrency: 'USD')),
        expect: [CurrencyState(selectedCurrency: 'USD')]);
  });
}
