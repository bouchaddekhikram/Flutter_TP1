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
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'TP1 App'),
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

enum SingingCharacter { euro, dinar }

class _MyHomePageState extends State<MyHomePage> {
  SingingCharacter? _character = SingingCharacter.euro;
  double res = 0;
  late TextEditingController _controller;
  double mont = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Montant',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            RadioListTile<SingingCharacter>(
              title: const Text('Dinar => Euro'),
              value: SingingCharacter.euro,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Euro => Dinar'),
              value: SingingCharacter.dinar,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            Text(
              "Le résultat est $res dinars ! ",
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 209, 161, 218)),
              ),
              onPressed: () {
                mont = double.tryParse(_controller.text) ?? 0;
                if (_character == SingingCharacter.euro) {
                  setState(() {
                    res = mont * 0.35;
                  });
                } else {
                  setState(() {
                    res = mont / 3.5;
                  });
                }
              },
              child: const Text(
                "CONVERTIR",
                style: TextStyle(
                    color: Colors.black26, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
