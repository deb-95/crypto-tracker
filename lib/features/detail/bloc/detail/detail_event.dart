part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailGetMainData extends DetailEvent {
  final String currency;
  final String coin;

  DetailGetMainData({this.currency, this.coin});
}
