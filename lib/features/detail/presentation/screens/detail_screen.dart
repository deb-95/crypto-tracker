import 'package:cryptotracker/features/overview/presentation/widgets/currency_title.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String currency;

  const DetailScreen({Key key, this.currency}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.currency}'),
      ),
      body: Container(
        child: Text('${widget.currency}'),
      ),
    );
  }
}
