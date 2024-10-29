import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotas_navegacao/repositories/favoritas_repository.dart';

import 'meu_aplicativo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> FavoritasRepository(),
    
    child: MeuAplicativo()),
    );
    
    
  
}
