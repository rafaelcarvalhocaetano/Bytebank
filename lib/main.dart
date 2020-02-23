import 'package:flutter/material.dart';

<<<<<<< HEAD
void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {


  final TextEditingController _controladorCampoConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferencia'),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoConta,
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '00000'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                  fontSize: 24.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                  labelText: 'Número da conta',
                  hintText: '0.00'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            onPressed: () {
              final int conta = int.tryParse(_controladorCampoConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);

              if (conta != null && valor != null) {
                final transf = Transferencia(valor, conta);
                debugPrint('$transf');
              }
            },
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }
}
=======
void main() => runApp(MaterialApp(
  home: Scaffold(
    body: ListaTransferencia(),
    appBar: AppBar(title: Text('Transferências'),),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
    ),
  ),
));
>>>>>>> Init create App with tree widget

class ListaTransferencia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
<<<<<<< HEAD
    return Scaffold(
      body: Column(
        children: <Widget>[
//          ItemTransferencia(Transferencia(100.00, 10000)),
//          ItemTransferencia(Transferencia(200.00, 20000)),
//          ItemTransferencia(Transferencia(300.00, 30000))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
=======
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.00, 10000)),
        ItemTransferencia(Transferencia(200.00, 20000)),
        ItemTransferencia(Transferencia(300.00, 30000))
      ],
>>>>>>> Init create App with tree widget
    );
  }
}

<<<<<<< HEAD
=======
class ItemTransferencia extends StatelessWidget {


  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

>>>>>>> Init create App with tree widget
class Transferencia {

  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

<<<<<<< HEAD
  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
=======
>>>>>>> Init create App with tree widget
}