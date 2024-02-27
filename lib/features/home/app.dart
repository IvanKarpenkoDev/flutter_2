import 'package:apiapp/dj/service.dart';
import 'package:apiapp/features/home/presentation/controller/home_controller.dart';
import 'package:apiapp/features/home/presentation/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => service<HomeController>()..init(),
        child: const Home(),
      ),
    );
  }
}
