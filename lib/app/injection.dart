import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev1/app/database/firestore/etiqueta_dao_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../firebase_options.dart';
import 'domain/interfaces/etiqueta_dao.dart';
import 'domain/services/etiqueta_service.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  print('-- WidgetsFlutterBinding.ensureInitialized');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('-- Conectado ');
  ;
  getIt.registerSingleton<EtiquetaDAO>(EtiquetaDAOFirestore());
  getIt.registerSingleton<EtiquetaService>(EtiquetaService());
}
