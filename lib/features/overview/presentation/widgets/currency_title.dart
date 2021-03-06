import 'package:cryptotracker/features/overview/bloc/currency/currency_bloc.dart';
import 'package:cryptotracker/features/overview/presentation/widgets/currency_selector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyTitle extends StatelessWidget {
  const CurrencyTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Row(
                children: [
                  Text(tr(state.selectedCurrency)),
                  Icon(Icons.swap_vert_outlined),
                ],
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => SimpleDialog(
                    title: Text(tr('pick_currency')),
                    elevation: 5,
                    children: [
                      CurrencySelector(),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
