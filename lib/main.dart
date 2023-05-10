import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova/telas/acoes.dart';
import 'package:prova/telas/bitcoin.dart';
import 'package:prova/telas/moeda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //variaveis para a url ações 
  String ibovespa = "";
  String variacaoIbovespa = "";

  String nasdaq = "";
  String variacaoNasdaq = "";

  String cac = "";
  String variacaoCac = "";

  String ifix = "";
  String variacaoIfix = "";

  String donwjones = "";
  String variacaoDonwjones = "";

  String nikkei = "";
  String variacaoNikkei = "";

  //variaveis para a url bitcoin 
  String blockchaininfo = "";
  String variacaoBlockchaininfo = "";

  String bitstamp = "";
  String variacaoBitstamp = "";

  String mercadoBitcoin = "";
  String variacaoMercadoBitcoin = "";

  String coinBase = "";
  String variacaoCoinBase = "";

  String foxbit = "";
  String variacaoFoxbit = "";

  @override
  Widget build(BuildContext context) {

   apiAcoes() async {
      final String urlAcoes =  "https://api.hgbrasil.com/finance?key=4f228a35&format=json-cors";
      Response respostaAcoes = await get(Uri.parse(urlAcoes));
      Map acoes = json.decode(respostaAcoes.body);
      setState(() {
        ibovespa =  "${acoes['results']['stocks']['IBOVESPA']['points']}";
        variacaoIbovespa =  "${acoes['results']['stocks']['IBOVESPA']['variation']}";

        nasdaq =  "${acoes['results']['stocks']['NASDAQ']['points']}";
        variacaoNasdaq =  "${acoes['results']['stocks']['NASDAQ']['variation']}";

        cac = "${acoes['results']['stocks']['CAC']['points']}";
        variacaoCac = "${acoes['results']['stocks']['CAC']['variation']}";

        ifix = "${acoes['results']['stocks']['IFIX']['points']}";
        variacaoIfix = "${acoes['results']['stocks']['IFIX']['variation']}";

        donwjones = "${acoes['results']['stocks']['DOWJONES']['points']}";
        variacaoDonwjones = "${acoes['results']['stocks']['DOWJONES']['variation']}";

        nikkei = "${acoes['results']['stocks']['NIKKEI']['points']}";
        variacaoNikkei = "${acoes['results']['stocks']['NIKKEI']['variation']}";
      });
   }

   apiBitcoin() async {
      final String urlBitcoin =  "https://api.hgbrasil.com/finance?key=4f228a35&format=json-cors";
      Response respostBitcoin = await get(Uri.parse(urlBitcoin));
      Map bitcoin = json.decode(respostBitcoin.body);
      setState(() {
        blockchaininfo =  "${bitcoin['results']['bitcoin']['blockchain_info']['last']}";
        variacaoBlockchaininfo =  "${bitcoin['results']['bitcoin']['blockchain_info']['variation']}";

        bitstamp =  "${bitcoin['results']['bitcoin']['bitstamp']['last']}";
        variacaoBitstamp = "${bitcoin['results']['bitcoin']['bitstamp']['variation']}";

        mercadoBitcoin = "${bitcoin['results']['bitcoin']['mercadobitcoin']['last']}";
        variacaoMercadoBitcoin = "${bitcoin['results']['bitcoin']['mercadobitcoin']['variation']}";

        coinBase = "${bitcoin['results']['bitcoin']['coinbase']['last']}";
        variacaoCoinBase = "${bitcoin['results']['bitcoin']['coinbase']['variation']}";

        foxbit = "${bitcoin['results']['bitcoin']['foxbit']['last']}";
        variacaoFoxbit = "${bitcoin['results']['bitcoin']['foxbit']['variation']}";
      });
   }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/moeda',
      routes: {
        '/moeda' : (context) => const Moeda(),
        '/bitcoin' : (context) => const Bitcoin(),
        '/acoes' : (context) => const Acoes(),
      },
    );

  }
}