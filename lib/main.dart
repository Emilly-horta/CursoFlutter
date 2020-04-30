import 'package:bytebank/transferencias/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blue[700],
      ),
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}






