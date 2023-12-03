import 'package:dev1/app/views/etiqueta_list.dart';
import 'package:dev1/app/views/etiqueta_form.dart';
import 'package:dev1/app/views/etiqueta_details.dart';
import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class MyApp extends StatelessWidget {
  static const HOME = 'etiqueta-list';
  static const ETIQUETA_FORM =  'etiqueta-form';
  static const ETIQUETA_DETAILS = 'etiqueta-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),

      routes: {
        HOME : (context) => EtiquetaList(),
        ETIQUETA_FORM : (context) => EtiquetaForm(),
        ETIQUETA_DETAILS: (context) => EtiquetaDetails()




      },

      home: Home(),

    );
  }
}