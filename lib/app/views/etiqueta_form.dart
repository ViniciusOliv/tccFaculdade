import 'package:dev1/app/views/etiqueta_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EtiquetaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldCodigo(EtiquetaFormBack back) {
    return TextFormField (
        validator: back.validateTitle,
        onSaved: (newValue) => back.etiqueta.codigo = newValue,
        initialValue: back.etiqueta.codigo,
        decoration: InputDecoration (
          labelText: 'Codigo:'
        )
    );
  }

  Widget fieldNome(EtiquetaFormBack back) {
    return TextFormField (
        onSaved: (newValue) => back.etiqueta.nome= newValue,
        initialValue: back.etiqueta.nome,
        decoration: InputDecoration (
            labelText: 'Nome'
        )
    );
  }

  Widget fieldLocal(EtiquetaFormBack back) {
    return TextFormField (
        onSaved: (newValue) => back.etiqueta.local= newValue,
        initialValue: back.etiqueta.local,
        decoration: InputDecoration (
            labelText: 'Local'
        )
    );
  }

  Widget fieldLote(EtiquetaFormBack back) {
    return TextFormField (
        onSaved: (newValue) => back.etiqueta.lote= newValue,
        initialValue: back.etiqueta.lote,
        decoration: InputDecoration (
            labelText: 'Lote'
        )
    );
  }

  Widget fieldQuantidade(EtiquetaFormBack back) {
    return TextFormField (
        onSaved: (newValue) => back.etiqueta.quantidade= newValue,
        initialValue: back.etiqueta.quantidade,
        decoration: InputDecoration (
            labelText: 'Quantidade',
            hintText: 'Número de caixas'
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = EtiquetaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Conferir Etiqueta', style: TextStyle(fontSize: 30),),
        backgroundColor: const Color.fromARGB(255, 17, 15, 65),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                _form.currentState.validate();
                _form.currentState.save();

                if(_back.isValid){
                  _back.save(context);
                }

              })
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child:  Column (
            children: [
              fieldCodigo(_back),
              fieldNome(_back),
              fieldLocal(_back),
              fieldLote(_back),
              fieldQuantidade(_back)


            ],
          ),
        ),
      ),

    );
  }
}

