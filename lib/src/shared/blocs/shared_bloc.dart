import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pensamentoformulario/src/shared/models/sentimento_model.dart';
import 'package:rxdart/rxdart.dart';

class SharedBloc extends BlocBase {
  //dispose will be called automatically by closing its streams
  BehaviorSubject<List<SentimentoModel>> _listController = BehaviorSubject.seeded([]);

  Observable<List<SentimentoModel>> get listOut => _listController.stream;

  expulgar() {
    _listController.add([]);
  }

  addNovoSentimento(SentimentoModel model) {
    _listController.value.add(model);
    _listController.add(_listController.value);
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
