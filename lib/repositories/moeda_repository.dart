import '../models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/bitcoin.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 16463.00,
    ),
    Moeda(
      icone: 'images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETC',
      preco: 20.00,
    ),
    Moeda(
      icone: 'images/xrp.png',
      nome: 'XRP',
      sigla: 'XRP',
      preco: 5.00,
    ),
    Moeda(
      icone: 'images/cardano.png',
      nome: 'Cardano',
      sigla: 'ADA',
      preco: 3.00,
    ),
    Moeda(
      icone: 'images/litecoin.png',
      nome: 'Litecoin',
      sigla: 'LTC',
      preco: 7.00,
    ),
    Moeda(
      icone: 'images/usdcoin.png',
      nome: 'Usdcoin',
      sigla: 'USD',
      preco: 4.00,
    ),
  ];
}
