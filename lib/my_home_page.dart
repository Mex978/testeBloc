import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_bloc/counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc counterBloc = BlocProvider.getBloc<CounterBloc>();

  @override
  Widget build(BuildContext context) {
    print(" ====> Tela renderizada <==== ");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: counterBloc.adaptativeText,
              initialData: "Esse é o numero de vezes que você apertou:",
              builder: (context, snapshot) {
                return Text(snapshot.data);
              },
            ),
            StreamBuilder(
              stream: counterBloc.valueCounter,
              initialData: 0,
              builder: (BuildContext context, snapshot) {
                print(snapshot.data);
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterBloc.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
