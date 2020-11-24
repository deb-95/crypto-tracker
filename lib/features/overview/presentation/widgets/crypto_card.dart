import 'package:cryptotracker/app/settings/currencies.dart';
import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:cryptotracker/features/overview/models/crypto_card_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCard extends StatelessWidget {
  final CryptoCardData cardData;

  const CryptoCard({Key key, this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentageSign = cardData.priceChangePercentage24H > 0 ? '+' : '';
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 20,
                        backgroundImage: NetworkImage(cardData.imageUrl),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cardData.name),
                        BlocBuilder<CurrencyBloc, CurrencyState>(
                          builder: (context, state) {
                            return Text(
                                '${cardData.currentPrice} ${kCurrenciesSymbols[state.selectedCurrency]}');
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  tr('highest24'),
                                  style: TextStyle(color: Colors.green[900]),
                                ),
                                Text(
                                  '${cardData.high24H}',
                                  style: TextStyle(color: Colors.green[700]),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  tr('lowest24'),
                                  style: TextStyle(color: Colors.red[900]),
                                ),
                                Text(
                                  '${cardData.low24H}',
                                  style: TextStyle(color: Colors.red[700]),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: cardData.priceChangePercentage24H > 0
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: cardData.priceChangePercentage24H > 0
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              '${percentageSign}${cardData.priceChangePercentage24H.toStringAsPrecision(3)}%'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Text('Last updated: ${cardData.lastUpdated.toString()}'),
          ],
        ),
      ),
    );
  }
}
