import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kdigital_test/src/data/models/character.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  width: 140,
                  height: 140,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name: ${character.name}'),
                    Text('Status: ${character.status}'),
                    Text('Species: ${character.species}'),
                    Text('Gender: ${character.gender}'),
                    Text('Location: ${character.location.name}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
