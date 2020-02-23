import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Criando Transferencia'),),
        body: ListaTransferencia(),
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
          Editor(controlador: _controladorCampoConta, dica: '021', rotulo: 'Conta',),
          Editor(controlador: _controladorCampoValor, rotulo: 'Valor', dica: '100.00', icon: Icons.monetization_on,),
          RaisedButton(
            onPressed: () => _criaTransferencia(context),
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }
  // FUNCTION
  void _criaTransferencia(BuildContext context) {
    final int conta = int.tryParse(_controladorCampoConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (conta != null && valor != null) {
      final transf = Transferencia(valor, conta);
      debugPrint('$transf');
      Navigator.pop(context, transf);
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icon;

  Editor({this.controlador, this.rotulo, this.dica, this.icon});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: rotulo,
          hintText: dica
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencia = List();

  @override
  State<StatefulWidget> createState() {
    return ListTransferenciasState();
  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView.builder(
//          itemCount: _transferencia.length,
//          itemBuilder: (ctx, index) {
//            final transferencia = _transferencia[index];
//            return ItemTransferencia(transferencia);
//          },
////        children: <Widget>[
////          ItemTransferencia(Transferencia(100.00, 10000)),
////        ],
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {
//          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return FormularioTransferencia();
//          }));
//          future.then((x) {
//            debugPrint('DATA ::: $x');
//            _transferencia.add(x);
//          });
//        },
//      ),
//    );
//  }
}

class ListTransferenciasState extends State<ListaTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencia.length,
        itemBuilder: (ctx, index) {
          final transferencia = widget._transferencia[index];
          return ItemTransferencia(transferencia);
        },
//        children: <Widget>[
//          ItemTransferencia(Transferencia(100.00, 10000)),
//        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((x) {
            debugPrint('DATA ::: $x');
            widget._transferencia.add(x);
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {

  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}