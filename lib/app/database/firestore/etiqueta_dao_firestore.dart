import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/etiqueta.dart';
import '../../domain/interfaces/etiqueta_dao.dart';

class EtiquetaDAOFirestore implements EtiquetaDAO {
  CollectionReference etiquetaCollection;

  EtiquetaDAOFirestore() {
    etiquetaCollection = FirebaseFirestore.instance.collection('etiqueta');
  }

  @override
  Future<List<Etiqueta>> find() async {
    var result = await etiquetaCollection.get();
    return result.docs
        .map((doc) => Etiqueta(
            id: doc.reference.id.toString(),
            nome: doc['nome'],
            lote: doc['lote'],
            local: doc['local'],
            codigo: doc['codigo'],
            urlAvatar: doc['urlAvatar'],
            quantidade: doc['quantidade']))

        .toList();
  }

  @override
  remove(id) {
    etiquetaCollection.doc(id).delete();
  }

  @override
  save(Etiqueta etiqueta) {
    etiquetaCollection.doc(etiqueta.id).set({
      'nome': etiqueta.nome,
      'lote': etiqueta.lote,
      'local': etiqueta.local,
      'codigo': etiqueta.codigo,
      'quantidade': etiqueta.quantidade,
    });
  }
}
