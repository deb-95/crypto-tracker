part of 'currency_bloc.dart';

class CurrencyState extends Equatable {
  final String selectedCurrency;
  CurrencyState({@required this.selectedCurrency});

  @override
  List<Object> get props => [selectedCurrency];
}
