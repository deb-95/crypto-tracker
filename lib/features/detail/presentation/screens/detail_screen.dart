import 'package:cryptotracker/features/detail/bloc/detail/detail_bloc.dart';
import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final String coin;

  const DetailScreen({Key key, this.coin}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {
    final curr = BlocProvider.of<CurrencyBloc>(context).state.selectedCurrency;
    BlocProvider.of<DetailBloc>(context)
        .add(DetailGetMainData(coin: widget.coin, currency: curr));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.coin}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<DetailBloc, DetailState>(
              builder: (context, state) {
                if (state is DetailLoaded) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await _getData();
                    },
                    child: ListView.builder(
                      itemBuilder: (_, index) => Text(
                          '${state.data.prices[index].date} ${state.data.prices[index].priceToDate}'),
                      itemCount: state.data.prices.length,
                    ),
                  );
                } else if (state is DetailLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DetailError) {
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
