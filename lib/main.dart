import 'package:bytebank/screens/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[700],
        accentColor: Colors.blue[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[600],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: ListaTransferencia(),
    );
  }
}





