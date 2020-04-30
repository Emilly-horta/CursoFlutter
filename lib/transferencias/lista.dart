import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'formulario.dart';


class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    widget._transferencias.add(Transferencia(100.0, 545455));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
      ),
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
    //future é como se fosse um callback, uma chamada de retorno
    //Future<Transferencia> -> tipo genérico, usando tags e passa o tipo, que no caso é transferencia
    final Future<Transferencia> future = Navigator.push(
    context, MaterialPageRoute(builder: (context) {
    return FormularioTransferencia();
    }
    ));
    future.then((transferencia) {
    debugPrint('chegou no the do future');
    debugPrint('$transferencia');
    widget._transferencias.add(transferencia);
    });
    },
      ));
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
