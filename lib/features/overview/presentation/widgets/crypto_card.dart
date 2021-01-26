import 'package:cryptotracker/app/routes/app_router.dart';
import 'package:cryptotracker/app/settings/colors.dart';
import 'package:cryptotracker/app/settings/currencies.dart';
import 'package:cryptotracker/features/detail/presentation/screens/detail_screen.dart';
import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:cryptotracker/features/overview/models/crypto_card_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCard extends StatelessWidget {
  final CryptoCardVM cardData;

  const CryptoCard({Key key, this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRouter.DETAIL, arguments: cardData.id);
      },
      child: Card(
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
                                    style: TextStyle(color: kGreen),
                                  ),
                                  Text(
                                    '${cardData.high24H}',
                                    style: TextStyle(color: kGreen),
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
                                    style: TextStyle(color: kRed),
                                  ),
                                  Text(
                                    '${cardData.low24H}',
                                    style: TextStyle(color: kRed),
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
                    flex: 3,
                    child: Column(
                      children: [
                        PercentageChangeBox(
                            percentage: cardData.priceChangePercentage24H)
                      ],
                    ),
                  )
                ],
              ),
              Text('Last updated: ${cardData.lastUpdated.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}

class PercentageChangeBox extends StatelessWidget {
  const PercentageChangeBox({
    Key key,
    @required this.percentage,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: percentage > 0 ? Colors.greenAccent : Colors.redAccent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: percentage > 0 ? Colors.green : Colors.red,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
            '${percentage > 0 ? '+' : ''}${percentage.toStringAsPrecision(3)}%'),
      ),
    );
  }
}
