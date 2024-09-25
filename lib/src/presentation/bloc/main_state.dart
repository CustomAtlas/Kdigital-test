import 'package:equatable/equatable.dart';

sealed class MainPageState extends Equatable {}

class InitialMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class LoadingMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class UnSuccessfulMainPageState extends MainPageState {
  final Object error;

  UnSuccessfulMainPageState(this.error);

  @override
  List<Object> get props => [error];
}

class SuccessfulMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}
