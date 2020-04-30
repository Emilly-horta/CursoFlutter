import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';


class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferencia'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNumConta,
            dica: '0000',
            rotulo: 'Numero da Conta',
          ),
          Editor(
            controlador: _controladorCampoValor,
            dica: '0.00',
            rotulo: 'valor',
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            onPressed: () {
              _criaTransferencia(context);
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ]),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Confirmar',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      debugPrint('$transferencia');
      Navigator.pop(context, transferencia);
    }
  }
}