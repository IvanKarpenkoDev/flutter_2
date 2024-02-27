import 'package:apiapp/dj/service.dart';
import 'package:apiapp/features/home/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDJ();
  runApp(const App());
}