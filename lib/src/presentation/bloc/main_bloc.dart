import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:kdigital_test/src/data/models/character.dart';
import 'package:kdigital_test/src/domain/repository/characters_repository.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CharactersRepository _charactersRepository;

  MainPageBloc(this._charactersRepository) : super(InitialMainPageState()) {
    on<MainPageEvent>(
      (event, emit) async {
        switch (event) {
          case GetTestDataOnMainPageEvent():
            await _getDataOnMainPageCasino(event, emit);
          case LoadDataOnMainPageEvent():
            _dataLoadedOnMainPageCasino(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  final List<Character> characters = [];
  int page = 1;
  int index = 0;
  bool isLoading = false;
  bool fromError = false;
  bool connectionError = false;

  Future<void> _getDataOnMainPageCasino(
    GetTestDataOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) async {
    if (state is! UnSuccessfulMainPageState) {
      if (index < characters.length - 2 || isLoading) return;
    }
    isLoading = true;
    emit(LoadingMainPageState());
    try {
      await _charactersRepository.getCharacters(page).then(
            (value) => add(LoadDataOnMainPageEvent(value)),
          );
    } catch (e) {
      isLoading = false;
      fromError = false;
      connectionError = true;
      emit(UnSuccessfulMainPageState(e));
    }
  }

  void _dataLoadedOnMainPageCasino(
    LoadDataOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) {
    connectionError = false;
    if (event.characters != null) {
      characters.addAll(event.characters!);
      page++;
      isLoading = false;
      emit(SuccessfulMainPageState());
    } else {
      isLoading = false;
      emit(UnSuccessfulMainPageState('Something went wrong, try again later'));
    }
    fromError = false;
  }
}
