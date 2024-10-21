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

  appBarDinamica() {
    if (selecionada.isEmpty) {
      return AppBar(
        title: const Text('Cripto Moedas'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      );
    } else {
      return AppBar(
        backgroundColor: Colors.blueGrey[100],
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionada = [];
            });
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('${selecionada.length} selecionadas'),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: (selecionada.contains(tabela[moeda]))
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
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
                (selecionada.contains(tabela[moeda]))
                    ? selecionada.remove(tabela[moeda])
                    : selecionada.add(tabela[moeda]);
              });
            },
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionada.isNotEmpty
          ? FloatingActionButton.extended(
              backgroundColor: Colors.indigo,
              onPressed: () {},
              icon: const Icon(
                Icons.star,
                color: Colors.white,
              ),
              label: const Text(
                'FAVORITAR',
                style: TextStyle(
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))
          : null,
    );
  }
}
