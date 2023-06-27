import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<int> _fruits = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _setFruits() {
    setState(() {
      _fruits.add(_counter);
    });
  }

  bool _isFirstNumber(int number) {
    if (number < 2) {
      return false;
    }

    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ignore: prefer_interpolation_to_compose_strings
        title: Text(
            '$_counter  ${_isFirstNumber(_counter) ? 'Nombre premier' : (_counter % 2 == 0) ? 'Nombre pair' : 'Nombre impair'}'),
      ),
      body: ListView.builder(
          itemCount: _fruits.length,
          itemBuilder: ((context, index) {
            return Stack(children: [
              ListTile(
                title: Text(
                  _fruits[index].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                tileColor:
                    (_fruits[index] % 2 == 0) ? Colors.cyan : Colors.indigo,
                subtitle: Image.asset(
                  (_isFirstNumber(_fruits[index]))
                      ? 'images/ananas.png'
                      : (_fruits[index] % 2 == 0)
                          ? 'images/poire.png'
                          : 'images/pomme.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ]);
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_incrementCounter(), _setFruits()},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
