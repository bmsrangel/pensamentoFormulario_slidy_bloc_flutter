import 'package:flutter/material.dart';
import 'package:pensamentoformulario/src/sentimento/sentimento_bloc.dart';
import 'package:pensamentoformulario/src/sentimento/sentimento_module.dart';
import 'package:pensamentoformulario/src/shared/widgets/smille.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  double valueRange = 0;
  _getFeeling(valueRange) {
    if (valueRange == 0) {
      return "Feliz";
    } else if (valueRange > 0 && valueRange < 0.3) {
      return "Normal";
    } else if (valueRange < 0.51) {
      return "Indiferente";
    } else if (valueRange < 0.75) {
      return "Triste";
    } else {
      return "Raiva";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Como está se sentindo agora?"),
          Container(
            height: 20,
          ),
          Container(
              height: 200,
              width: 200,
              child: Smiley(
                range: valueRange,
              )),
          Container(
            height: 20,
          ),
          Text(_getFeeling(valueRange),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.lerp(Colors.blue, Colors.red, valueRange))),
          Container(
            height: 10,
          ),
          Slider(
            onChanged: (double value) {
              setState(() {
                valueRange = value;
              });
            },
            value: valueRange,
            min: 0,
            max: 1,
          ),
          OutlineButton(
            onPressed: () {
              var model = SentimentoModule.to.bloc<SentimentoBloc>().model;
              model.sentimento = valueRange;
              model.title = _getFeeling(valueRange);
              SentimentoModule.to.bloc<SentimentoBloc>().pageController.jumpToPage(1);
            },
            child: Text(
              "Próximo",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }
}
