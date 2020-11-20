part of 'overview_bloc.dart';

abstract class OverviewEvent extends Equatable {
  const OverviewEvent();

  @override
  List<Object> get props => [];
}

class OverviewGetData extends OverviewEvent {
  final String currency;
  OverviewGetData({this.currency});
}
