import 'package:flutter/material.dart';
import 'app/injection.dart';
import 'app/my_app.dart';

void main() async {
  await setupInjection();
  runApp(MyApp());
}