import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_bloc/counter_bloc.dart';

import 'my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [
          Bloc((i) => CounterBloc()),
        ],
        child: MaterialApp(
          title: 'Teste Bloc',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Teste BLoC'),
        ));
    //     MaterialApp(
    //   title: 'Teste Bloc',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: MyHomePage(title: 'Teste BLoC'),
    // );
  }
}
