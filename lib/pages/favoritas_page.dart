import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotas_navegacao/repositories/favoritas_repository.dart';
import 'package:rotas_navegacao/widgets/moeda_card.dart';

class FavoritasPage extends StatelessWidget {
  const FavoritasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moedas Favoritas'),
        centerTitle: true,
      ),
      body: Container(
          color: Colors.indigo.withOpacity(0.05),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(12),
          child: Consumer<FavoritasRepository>(
              builder: (context, favoritas, child) {
            return favoritas.lista.isEmpty
                ? ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Ainda não há moedas favoritas'),
                  )
                : ListView.builder(
                    itemCount: favoritas.lista.length,
                    itemBuilder: (_, index) {
                      return MoedaCard(moeda: favoritas.lista[index]);
                    });
          })),
    );
  }
}
