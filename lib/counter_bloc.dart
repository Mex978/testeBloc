import 'package:bloc_pattern/bloc_pattern.dart';
import 'dart:async';

class CounterBloc extends BlocBase {
  StreamController<int> _streamController = StreamController<int>.broadcast();

  /* Estado ============================================================= */
  int _counter = 0;
  /* ==================================================================== */

  /* Saídas ============================================================= */
  Stream<int> get valueCounter => _streamController.stream;
  Stream<String> get adaptativeText => _streamController.stream.map((value) {
        if (value < 20)
          return "Esse é o numero de vezes que você apertou:";
        else if (value >= 20 && value < 30)
          return "Aperte um pouco menos";
        else if (value >= 30 && value < 50)
          return "Está indo rápido demais";
        else if (value >= 50 && value < 70)
          return "FIQUE CALMO!";
        else
          return "Eu desisto :/";
      });
  /* ==================================================================== */

  /* Ações ============================================================== */
  void incrementCounter() => _streamController.add(++_counter);
  /* ==================================================================== */

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
