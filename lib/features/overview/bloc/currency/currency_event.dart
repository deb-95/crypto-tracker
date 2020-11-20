part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent {}

class CurrencyChangeEvent extends CurrencyEvent {
  final String newCurrency;
  CurrencyChangeEvent({this.newCurrency});
}
