
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _appBarText = 'Criando Transferencia';

const _labelTextValor = 'Valor';
const _dicaTextValor = '100.00';

const _dicaTextConta = '0551';
const _labelTextConta = 'Conta';

const _confirm = 'Confirmar';


class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

// alteração: Mantem o estado dos inputs
class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarText),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controlador: _controladorCampoConta, dica: _dicaTextConta, rotulo: _labelTextConta,),
            Editor(controlador: _controladorCampoValor, rotulo: _labelTextValor, dica: _dicaTextValor, icon: Icons.monetization_on,),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_confirm),
            )
          ],
        ),
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
