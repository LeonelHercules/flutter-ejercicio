import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _numero1EditControler = TextEditingController();
  final TextEditingController _numero2EditControler = TextEditingController();
  String resultado = '0';

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
            TextField(
              keyboardType: TextInputType.number,
              controller: _numero1EditControler,
              decoration: const InputDecoration(labelText: 'Numero 1'),
            ),
            espacio(),
            TextField(
              keyboardType: TextInputType.number,
              controller: _numero2EditControler,
              decoration: const InputDecoration(labelText: 'Numero 2'),
            ),
            _botones(),
            espacio(),
            _otrosbotones(),
            espacio(),
            Text(
              resultado,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  void _sumar() {
    double numero1 = double.tryParse(_numero1EditControler.text) ?? 0;
    double numero2 = double.tryParse(_numero2EditControler.text) ?? 0;

    setState(() {
      resultado = 'Resultado : ${numero1 + numero2}';
    });
  }

  void _restar() {
    double numero1 = double.tryParse(_numero1EditControler.text) ?? 0;
    double numero2 = double.tryParse(_numero2EditControler.text) ?? 0;

    setState(() {
      resultado = 'Resultado : ${numero1 - numero2}';
    });
  }

  void _multiplicar() {
    double numero1 = double.tryParse(_numero1EditControler.text) ?? 0;
    double numero2 = double.tryParse(_numero2EditControler.text) ?? 0;

    setState(() {
      resultado = 'Resultado : ${numero1 * numero2}';
    });
  }

  Widget espacio() {
    return const SizedBox(
      height: 25,
    );
  }

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: _sumar, child: const Text('Sumar')),
        const SizedBox(
          width: 25,
        ),
        ElevatedButton(onPressed: _restar, child: const Text('Restar')),
      ],
    );
  }

  Widget _otrosbotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: _multiplicar, child: const Text('Multiplicar')),
        const SizedBox(
          width: 25,
        ),
        ElevatedButton(onPressed: _restar, child: const Text('Dividir')),
      ],
    );
  }
}
