import 'package:cryptotracker/features/overview/presentation/widgets/currency_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CurrencyTitle(),
      ),
      body: Center(
        child: Container(
          child: Text('${tr("hello_world")}'),
        ),
      ),
    );
  }
}
