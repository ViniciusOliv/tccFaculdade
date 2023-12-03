import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../domain/entities/etiqueta.dart';
import '../domain/services/etiqueta_service.dart';
import '../my_app.dart';

part 'etiqueta_list_back.g.dart';

class EtiquetaListBack = _EtiquetaListBack with _$EtiquetaListBack;

abstract class _EtiquetaListBack with Store{
  var _service = GetIt.I.get<EtiquetaService>();

  //lista de contatos
  @observable
  Future<List<Etiqueta>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  EtiquetaListBack(){
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Etiqueta etiqueta]){
    Navigator.of(context).pushNamed(MyApp.ETIQUETA_FORM, arguments: etiqueta).then(refreshList);
  }

  goToDetails(BuildContext context, Etiqueta etiqueta){
    Navigator.of(context).pushNamed(MyApp.ETIQUETA_DETAILS, arguments: etiqueta);
  }

  //excluir
  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }

}