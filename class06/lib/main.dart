import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'DRAWER APP '),
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
  String selectedPage = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Haris Memon"),
              accountEmail: Text("harismemon422@gmail.com"),
              currentAccountPicture: CircleAvatar(

              ),
              otherAccountsPictures: [
                CircleAvatar(

                ),
                CircleAvatar(

                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.cyan),
              title: const Text("Home"),
              onTap: () {
                setState(() {
                  selectedPage = "Home";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Shop"),
              onTap: () {
                setState(() {
                  selectedPage = "Shop";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favorites"),
              onTap: () {
                setState(() {
                  selectedPage = "Favorites";
                });
                Navigator.pop(context);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text("Labels"),
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text("Red"),
              onTap: () {
                setState(() {
                  selectedPage = "Red Label";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text("Green"),
              onTap: () {
                setState(() {
                  selectedPage = "Green Label";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text("Blue"),
              onTap: () {
                setState(() {
                  selectedPage = "Blue Label";
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Selected Page: $selectedPage',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
