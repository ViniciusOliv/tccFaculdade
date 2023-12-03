
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../domain/entities/etiqueta.dart';
import 'etiqueta_list_back.dart';

class EtiquetaList extends StatelessWidget {
  final _back = EtiquetaListBack();

  CircleAvatar circleAvatar(String url)  {
    return (Uri.tryParse(url).isAbsolute) ?
    CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(Function onPressed){
    return IconButton(icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function remove){
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder:  (context) => AlertDialog(
                title: Text('Excluir'),
                content: Text('Confirma a Exclusão?'),
                actions: [
                  ElevatedButton(
                    child: Text('Não'),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Sim'),
                    onPressed: remove,
                  ),
                ],
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _back.goToForm(context);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Etiqueta> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var etiquetas = lista[i];
                      return ListTile(
                        leading: circleAvatar(etiquetas.urlAvatar),
                        title: Text(etiquetas.codigo),
                        onTap: (){
                          _back.goToDetails(context, etiquetas);
                        },
                        subtitle: Text(etiquetas.local),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton((){
                                _back.goToForm(context, etiquetas);
                              }),
                              iconRemoveButton(context, (){
                                _back.remove(etiquetas.id, context);
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}