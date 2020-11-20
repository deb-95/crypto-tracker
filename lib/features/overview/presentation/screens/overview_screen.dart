import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CurrencyBloc, CurrencyState>(
          builder: (context, state) {
            return Text(state.selectedCurrency);
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Text('${tr("hello_world")}'),
        ),
      ),
    );
  }
}
