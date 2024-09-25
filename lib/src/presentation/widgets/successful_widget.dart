import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/data/models/character.dart';
import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/widgets/character_widget.dart';

class SuccessfulWidget extends StatelessWidget {
  final List<Character> characters;
  const SuccessfulWidget(this.characters);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainPageBloc>();
    return ListView.builder(
      key: PageStorageKey('Scroll'),
      padding: EdgeInsets.symmetric(vertical: 24),
      itemExtent: 200,
      itemCount: characters.length,
      itemBuilder: (_, i) {
        bloc.index = i;
        bloc.add(GetTestDataOnMainPageEvent());
        return CharacterWidget(characters[i]);
      },
    );
  }
}
