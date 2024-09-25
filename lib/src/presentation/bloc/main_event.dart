import 'package:kdigital_test/src/data/models/character.dart';
import 'package:equatable/equatable.dart';

sealed class MainPageEvent extends Equatable {
  const MainPageEvent();

  @override
  List<Object?> get props => [];
}

class GetTestDataOnMainPageEvent extends MainPageEvent {
  const GetTestDataOnMainPageEvent();

  @override
  List<Object?> get props => [];
}

class LoadDataOnMainPageEvent extends MainPageEvent {
  final List<Character>? characters;

  const LoadDataOnMainPageEvent(this.characters);

  @override
  List<Object?> get props => [characters];
}
