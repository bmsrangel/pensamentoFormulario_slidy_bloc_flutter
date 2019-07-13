import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pensamentoformulario/src/app_module.dart';
import 'package:pensamentoformulario/src/sentimento/sentimento_bloc.dart';
import 'package:pensamentoformulario/src/sentimento/sentimento_module.dart';
import 'package:pensamentoformulario/src/shared/blocs/shared_bloc.dart';

class DescreverBloc extends BlocBase {
  //dispose will be called automatically by closing its streams
  addModel() {
    var model = SentimentoModule.to.bloc<SentimentoBloc>().model;
    AppModule.to.bloc<SharedBloc>().addNovoSentimento(model);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
