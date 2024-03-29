import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/provider/todo_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TodoProvider>(create: (_) => TodoProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
