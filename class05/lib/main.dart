import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Name List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'People'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final List<String> arrNames = [
    'Abdullah',
    'Irfan',
    'Faizan',
    'Maaz',
    'Usman',
    'Amaan',
    'Furqan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: arrNames.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          String name = arrNames[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.teal.shade400,
                child: Text(
                  name[0],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              title: Text(
                name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("Active now", style: TextStyle(color: Colors.grey)),
              trailing: const Icon(Icons.chat_bubble_outline, color: Colors.teal),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$name tapped')));
              },
            ),
          );
        },
      ),

    );
  }
}
