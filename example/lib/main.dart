import 'package:flutter/material.dart';
import 'package:just_toast/toast/show_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JUST TOAST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamplePage(title: 'JUST TOAST'),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key, required this.title});

  final String title;

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  void _showToast() {
    showToast(
      context: context,
      text: 'Toast message',
    );
  }

  void _showCustomToast() {
    showToast(
      context: context,
      text: 'Custom Toast message',
      duration: const Duration(milliseconds: 1000),
      alignment: Alignment.center,
      textStyle: const TextStyle(fontSize: 20, color: Colors.amber),
      color: Colors.purple,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _showToast,
              child: const Text(
                'Show Toast',
              ),
            ),
            ElevatedButton(
              onPressed: _showCustomToast,
              child: const Text(
                'Show Custom Toast',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
