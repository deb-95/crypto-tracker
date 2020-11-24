import 'package:cryptotracker/features/overview/presentation/widgets/crypto_card.dart';
import 'package:flutter/material.dart';

class CryptoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, item) => CryptoCard(),
      itemCount: 10,
    );
  }
}
