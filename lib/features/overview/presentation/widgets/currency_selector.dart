import 'package:cryptotracker/app/settings/currencies.dart';
import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:cryptotracker/features/overview/bloc/overview/overview_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currencyBloc = BlocProvider.of<CurrencyBloc>(context);
    final overviewBloc = BlocProvider.of<OverviewBloc>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView.builder(
        itemCount: kCurrencies.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(tr(kCurrencies[index])),
          selected: currencyBloc.state.selectedCurrency == kCurrencies[index],
          onTap: () {
            currencyBloc
                .add(CurrencyChangeEvent(newCurrency: kCurrencies[index]));
            overviewBloc.add(OverviewGetData(currency: kCurrencies[index]));
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
