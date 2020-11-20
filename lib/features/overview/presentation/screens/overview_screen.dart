import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      body: Center(
        child: Container(
          child: Text('${tr("hello_world")}'),
        ),
      ),
    );
  }
}
