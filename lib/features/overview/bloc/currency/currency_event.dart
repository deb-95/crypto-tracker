part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class CurrencyChangeEvent extends CurrencyEvent {
  final String newCurrency;
  CurrencyChangeEvent({this.newCurrency});

  @override
  List<Object> get props => [newCurrency];
}
