import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const ListDemo(),
    );
  }
}

class ListDemo extends StatefulWidget {
  const ListDemo({super.key});

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  bool showStaticList = true;

  List<String> items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView vs ListView.builder'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => setState(() => showStaticList = true),
                child: const Text("Show Static List"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => setState(() => showStaticList = false),
                child: const Text("Show Dynamic List"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: showStaticList ? _buildStaticList() : _buildDynamicList(),
          ),
        ],
      ),
    );
  }

  // Using ListView (static list)
  Widget _buildStaticList() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        ListTile(title: Text('Apple'), leading: Icon(Icons.apple)),
        ListTile(title: Text('Banana'), leading: Icon(Icons.local_grocery_store)),

        ListTile(title: Text('Grapes'), leading: Icon(Icons.grain)),
        ListTile(title: Text('Mango'), leading: Icon(Icons.masks)),
      ],
    );
  }

  // Using ListView.builder (dynamic list)
  Widget _buildDynamicList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(items[index]),
            subtitle: Text('Dynamic item #${index + 1}'),
          ),
        );
      },
    );
  }
}
