import 'package:cryptotracker/features/overview/presentation/widgets/crypto_cards.dart';
import 'package:cryptotracker/features/overview/presentation/widgets/currency_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CurrencyTitle(),
      ),
      body: Column(
        children: [
          Expanded(
            child: CryptoCards(),
          ),
        ],
      ),
    );
  }
}
