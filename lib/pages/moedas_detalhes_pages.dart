import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../models/moeda.dart';

class MoedasDetalhesPages extends StatefulWidget {
  Moeda moeda;
  MoedasDetalhesPages({super.key, required this.moeda});

  @override
  State<MoedasDetalhesPages> createState() => _MoedasDetalhesPagesState();
}

class _MoedasDetalhesPagesState extends State<MoedasDetalhesPages> {
  NumberFormat real = NumberFormat.currency(locale: 'pt-BR', name: 'R\$');

  final _form = GlobalKey<FormState>();

  final _valor = TextEditingController();

  double quatidade = 0;

  comprar() {
    if (_form.currentState!.validate()) {
      //salvar a compra

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Compra realizada com sucesso')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          widget.moeda.nome,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 50, child: Image.asset(widget.moeda.icone)),
                  Container(
                    width: 10,
                  ),
                  Text(
                    real.format(widget.moeda.preco),
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1,
                        color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
            (quatidade > 0)
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 24),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(color: Colors.teal.withOpacity(0.05)),
                      child: Text(
                        '$quatidade ${widget.moeda.sigla}',
                        style: TextStyle(fontSize: 20, color: Colors.teal),
                      ),
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 53),
                  ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 22,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                  ),
                  suffix: Text(
                    'reais',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o valor da compra';
                  } else if (double.parse(value) < 50) {
                    return 'Compra minima é R\$ 50,00';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    quatidade = (value.isEmpty)
                        ? 0
                        : double.parse(value) / widget.moeda.preco;
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  iconColor: Colors.white,
                ),
                onPressed: comprar,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Comprar',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
