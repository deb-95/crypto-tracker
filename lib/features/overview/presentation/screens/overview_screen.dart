import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:cryptotracker/features/overview/bloc/overview/overview_bloc.dart';
import 'package:cryptotracker/features/overview/presentation/widgets/crypto_cards.dart';
import 'package:cryptotracker/features/overview/presentation/widgets/currency_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  void initState() {
    super.initState();
    final curr = BlocProvider.of<CurrencyBloc>(context).state.selectedCurrency;
    BlocProvider.of<OverviewBloc>(context).add(OverviewGetData(currency: curr));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CurrencyTitle(),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<OverviewBloc, OverviewState>(
              builder: (context, state) {
                if (state is OverviewLoaded) {
                  return CryptoCards(cardsData: state.data);
                } else if (state is OverviewLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is OverviewError) {
                  return Center(child: Text(state.error));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
