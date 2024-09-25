import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';

class UnSuccessfulWidget extends StatelessWidget {
  final String error;
  const UnSuccessfulWidget(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error.contains('lookup')
                ? 'It seems like you haven\'t internet connection\nCheck internet connection and tap the button below'
                : error,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          if (!error.contains('lookup')) Text('- or -'),
          TextButton(
            onPressed: () {
              final bloc = context.read<MainPageBloc>();
              bloc.fromError = true;
              bloc.add(GetTestDataOnMainPageEvent());
            },
            child: Text('Tap to refresh'),
          )
        ],
      ),
    );
  }
}
