import '../entities/etiqueta.dart';

abstract class EtiquetaDAO{

  save(Etiqueta etiqueta);

  remove(dynamic id);

  Future<List<Etiqueta>> find();



}