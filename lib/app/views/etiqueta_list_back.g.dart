// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etiqueta_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EtiquetaListBack on _EtiquetaListBack, Store {
  final _$listAtom = Atom(name: '_EtiquetaListBack.list');

  @override
  Future<List<Etiqueta>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Etiqueta>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_EtiquetaListBackActionController =
  ActionController(name: '_EtiquetaListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_EtiquetaListBackActionController.startAction(
        name: '_EtiquetaListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_EtiquetaListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}