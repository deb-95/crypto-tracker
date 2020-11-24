import 'package:cryptotracker/features/overview/models/crypto_card_data.dart';
import 'package:cryptotracker/features/overview/presentation/widgets/crypto_card.dart';
import 'package:flutter/material.dart';

class CryptoCards extends StatelessWidget {
  final List<CryptoCardData> cardsData;

  const CryptoCards({Key key, this.cardsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, item) => CryptoCard(cardData: cardsData[item]),
      itemCount: cardsData.length,
    );
  }
}
