import 'package:flutter/material.dart';

import '../models/moeda.dart';

class MoedasDetalhesPages extends StatelessWidget {
  Moeda moeda;
  MoedasDetalhesPages({super.key, required this.moeda});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(moeda.nome),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(width: 150, child: Image.asset(moeda.icone)),
          )
        ],
      ),
    );
  }
}
