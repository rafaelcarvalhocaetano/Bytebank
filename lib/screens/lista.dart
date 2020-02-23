import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/formulario_transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const _appBarText = 'Transferências';



class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencia = List();
  @override
  State<StatefulWidget> createState() {
    return ListTransferenciasState();
  }
}

class ListTransferenciasState extends State<ListaTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarText),),
      body: ListView.builder(
        itemCount: widget._transferencia.length,
        itemBuilder: (ctx, index) {
          final transferencia = widget._transferencia[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((x) {
            setState(() {
              if (x != null) {
                widget._transferencia.add(x);
              }
            });
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