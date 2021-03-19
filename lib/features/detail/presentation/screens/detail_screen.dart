import 'package:cryptotracker/features/detail/bloc/detail/detail_bloc.dart';
import 'package:cryptotracker/features/detail/presentation/widgets/line_chart.dart';
import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final String coin;
  final String name;

  const DetailScreen({Key key, this.coin, this.name}) : super(key: key);

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
        title: Text('${widget.name}'),
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
                    child: AspectRatio(
                      aspectRatio: 1.70,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            color: Color(0xff232d37)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 18.0, left: 12.0, top: 24, bottom: 12),
                          child: LineChartWidget(graphData: state.data.prices),
                        ),
                      ),
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
