import 'package:flutter/material.dart';
import 'package:pensamentoformulario/src/sentimento/pages/descrever/descrever_bloc.dart';
import 'package:pensamentoformulario/src/sentimento/sentimento_bloc.dart';
import 'package:pensamentoformulario/src/sentimento/sentimento_module.dart';

class DescreverPage extends StatefulWidget {
  @override
  _DescreverPageState createState() => _DescreverPageState();
}

class _DescreverPageState extends State<DescreverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Escreva seu pensamento:"),
            Container(
              height: 30,
            ),
            TextField(
              maxLines: 5,
              onChanged: (value) {
                var model = SentimentoModule.to.bloc<SentimentoBloc>().model;
                model.subtitle = value;
              },
            ),
            Container(
              height: 30,
            ),
            OutlineButton(
              onPressed: () {
                SentimentoModule.to.bloc<DescreverBloc>().addModel();
                Navigator.pop(context);
              },
              child: Text(
                "Cadastrar",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      ),
    );
  }
}
