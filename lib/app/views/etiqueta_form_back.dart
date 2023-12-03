
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../domain/entities/etiqueta.dart';
import '../domain/services/etiqueta_service.dart';



class EtiquetaFormBack {
  Etiqueta etiqueta;
  var _service = GetIt.I.get<EtiquetaService>();
  bool _titleIsValid;
  bool _descriptionIsValid;
  bool _priceIsValid;

  bool get isValid => _titleIsValid && _descriptionIsValid && _priceIsValid;

  // diferenciar novo com alteração 
  EtiquetaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
   etiqueta = (parameter == null) ? Etiqueta() : parameter;
  }

  //salvar 
  save(BuildContext context) async {
    await _service.save(etiqueta);
    Navigator.of(context).pop();
  }

  //validações  
  String validateTitle(String title){
    try{
      _service.validateTitle(title);
      _titleIsValid = true;
      return null;
    }catch(e){
      _titleIsValid = false;
      return e.toString();
    }
  }

  String validateDescription(String description){
    try{
      _service.validateDescription(description);
      _descriptionIsValid = true;
      return null;
    }catch(e){
      _descriptionIsValid = false;
      return e.toString();
    }
  }

  String validatePrice(String price){
    try{
      _service.validatePrice(price);
      _priceIsValid = true;
      return null;
    }catch(e){
      _priceIsValid = false;
      return e.toString();
    }
  }


}