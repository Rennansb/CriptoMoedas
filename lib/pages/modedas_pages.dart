import 'package:flutter/material.dart';
import 'package:rotas_navegacao/models/moeda.dart';
import 'package:rotas_navegacao/repositories/moeda_repository.dart';
import 'package:intl/intl.dart';

class MoedasPages extends StatefulWidget {
 const MoedasPages({super.key});

  @override
  State<MoedasPages> createState() => _MoedasPagesState();
}

class _MoedasPagesState extends State<MoedasPages> {
  final tabela = MoedaRepository.tabela;

  NumberFormat real = NumberFormat.currency(locale: 'pt-BR', name: 'R\$');

  List<Moeda> selecionada = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cripto Moedas'),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              leading: 
              
              (selecionada.contains(tabela[moeda]))?
              const CircleAvatar(
                child: Icon(Icons.check),
              ):
              
              SizedBox(
                width: 40,
                child: Image.asset(
                  tabela[moeda].icone,
                ),
              ),
              title: Text(
                tabela[moeda].nome,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(real.format(tabela[moeda].preco)),
              selected: selecionada.contains(tabela[moeda]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: () {
               setState(() {
                  (selecionada.contains(tabela[moeda]))?
                selecionada.remove(tabela[moeda]):
                selecionada.add(tabela[moeda]);
               });
              },
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length,
        ));
  }
}
