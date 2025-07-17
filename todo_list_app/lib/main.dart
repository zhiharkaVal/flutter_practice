import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/keys.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TODO list'),
        ),
        body: const Keys(),
      ),
    );
  }
}