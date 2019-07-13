import 'package:flutter/material.dart';
import 'package:pensamentoformulario/src/app_module.dart';
import 'package:pensamentoformulario/src/sentimento/sentimento_module.dart';
import 'package:pensamentoformulario/src/shared/blocs/shared_bloc.dart';
import 'package:pensamentoformulario/src/shared/models/sentimento_model.dart';
import 'package:pensamentoformulario/src/shared/widgets/smille.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _blocSentimento = AppModule.to.getBloc<SharedBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pensamentos"),
      ),
      body: StreamBuilder<List<SentimentoModel>>(
        stream: _blocSentimento.listOut,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<SentimentoModel> models = snapshot.data;
          if (models.length == 0) {
            return Container(
              color: Colors.grey[300],
              child: Center(
                child: Text("Não há nenhum pensamento cadastrado"),
              ),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 100,
                  width: 100,
                  child: Smiley(
                    range: models[index].sentimento,
                  ),
                ),
                title: Text(models[index].title),
                subtitle: Text(models[index].subtitle),
              );
            },
            itemCount: models.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        },
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: AppModule.to.bloc<SharedBloc>().expulgar,
        child: Text(
          "Expulgar",
          style: TextStyle(color: Colors.white),
        ),
        color: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => SentimentoModule()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
