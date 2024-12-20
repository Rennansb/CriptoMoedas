import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rotas_navegacao/models/moeda.dart';

class FavoritasRepository extends ChangeNotifier {
  List<Moeda> _lista = [];
  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moedas) {
    moedas.forEach((moeda) {
      if (!_lista.contains(moeda)) _lista.add(moeda);
    });

    notifyListeners();
  }



remove(Moeda moeda) {
  _lista.remove(moeda);
  notifyListeners();
  
}



}


