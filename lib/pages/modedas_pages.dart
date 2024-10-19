import 'package:flutter/material.dart';
import 'package:rotas_navegacao/repositories/moeda_repository.dart';

class MoedasPages extends StatelessWidget {
  const MoedasPages({super.key});

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;
    return Scaffold(
        appBar: AppBar(
          title:const Text('Cripto Moedas'),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              leading: Image.asset(tabela[moeda].icone),
              title: Text(tabela[moeda].nome),
              trailing: Text(tabela[moeda].preco.toString()),
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length,
        ));
  }
}
