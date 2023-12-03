
import 'package:dev1/app/views/etiqueta_details_back.dart';
import 'package:flutter/material.dart';

import '../domain/entities/etiqueta.dart';

class EtiquetaDetails extends StatelessWidget {

  showModalError(BuildContext context){
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alert;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = EtiquetaDetailsBack(context);
    Etiqueta etiqueta = _back.etiqueta;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){

        var width = constraints.biggest.width;
        var radius = width/3;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              Center(
                child: Text('${etiqueta.nome}', style:  TextStyle(fontSize: 30),),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone:'),
                  subtitle: Text('${etiqueta.lote}'),
                  trailing: Container(
                    width: width/4 ,
                    child:  Row(
                        children: [
                          IconButton(
                              color: Colors.blue,
                              icon: Icon(Icons.message),
                              onPressed: (){
                                _back.launchSMS(showModalError);
                              }
                          ),
                          IconButton(
                              color: Colors.blue,
                              icon: Icon(Icons.phone),
                              onPressed: (){
                                _back.launchPhone(showModalError);
                              }
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('E-mail:'),
                  onTap: () {
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text('${etiqueta.codigo}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}