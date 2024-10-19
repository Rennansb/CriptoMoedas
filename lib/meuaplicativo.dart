
import 'package:flutter/material.dart';

import 'pages/modedas_pages.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoedaBase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   
        primarySwatch: Colors.indigo,
 
      ),
      home: MoedasPages(),
    );
  }
}