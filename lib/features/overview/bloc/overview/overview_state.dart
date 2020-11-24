part of 'overview_bloc.dart';

abstract class OverviewState extends Equatable {
  const OverviewState();

  @override
  List<Object> get props => [];
}

class OverviewInitial extends OverviewState {}

class OverviewLoading extends OverviewState {}

class OverviewLoaded extends OverviewState {
  final List<CryptoCardData> data;

  OverviewLoaded(this.data);
}

class OverviewError extends OverviewState {
  final String error;

  OverviewError(this.error);
}
