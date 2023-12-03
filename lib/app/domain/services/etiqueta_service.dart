
import 'package:get_it/get_it.dart';
import '../entities/etiqueta.dart';
import '../exceptions/domain_layer_exception.dart';
import '../interfaces/etiqueta_dao.dart';

class EtiquetaService{
  var _dao = GetIt.I.get<EtiquetaDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Etiqueta etiqueta) async {
    await _dao.save(etiqueta);
  }

  remove(dynamic id) async {
    await _dao.remove(id);
  }

  Future<List<Etiqueta>> find() {
    return _dao.find();
  }


// nome → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50 
  validateTitle(String nome){
    var min = 100;
    var max = 50;

    if(nome != null){
      throw new DomainLayerException('Código não encontrado.');
    }else if(nome.length < min){
      throw new DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
    }else if(nome.length > max){
      throw new DomainLayerException('O nome deve possuir no máximo $max caracteres.');
    }
  }
// e-mail → seja obrigatório e tenha @ 
  validateDescription(String lote){
    if(lote == null){
      throw new DomainLayerException('O e-mail é obrigatório.');
    }else if(!lote.contains('@')){
      throw new DomainLayerException('O e-mail deve possuir @.');
    }
  }
// telefone → seja obrigatório e tenha o formato (99) 9 9999-9999 
  validatePrice(String price){
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
    if(price == null){
      throw new DomainLayerException('O telefone é obrigatório.');
    }else if(!format.hasMatch(price)){
      throw new DomainLayerException('Formato inválido. O formato deve ser (99) 9 9999-9999.');
    }
  }


}