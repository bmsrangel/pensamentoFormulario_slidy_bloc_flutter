import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pensamentoformulario/src/shared/models/sentimento_model.dart';

class SentimentoBloc extends BlocBase {
  final PageController pageController = PageController();
  final SentimentoModel model = SentimentoModel();
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
