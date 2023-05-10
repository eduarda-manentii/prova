import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

import '../componentes/botao_form.dart';

class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {

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


   apiBitcoin() async {
      const String urlBitcoin =  "https://api.hgbrasil.com/finance?key=4f228a35&format=json-cors";
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

    irProximo() {
       Navigator.pushNamed(context, '/moeda');
    }

    
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 95, 35), 
        title: const Text("Finanças de hoje")
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Title(
                  color: const Color.fromARGB(255, 6, 75, 8),
                  child: const Text('Bitcoin')
                ),
                Botao(funcao: apiBitcoin, texto: 'Ver valores'),
              ],
              
            ),

            Column(
              children: [
                   Center(
                  
                  child: Container(
                    width: 500,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),   
                      borderRadius: BorderRadius.circular(10.0),                   
                    ),

                    
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Dólar "),
                          ],
                       ),
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        /*  children: [
                            Text("${dolar} "),
                            Text(" ${variacaoDolar}",
                             style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 76, 99, 175),
                              ),)
                          ], */
                       ),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(" Euro"),
                          ],
                       ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        /*  children: [
                            Text("${euro} "),
                            Text( 
                              "${variacaoEuro}", 
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 76, 99, 175),
                              ),
                            )
                          ],*/
                       ),

                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                             Text("Peso"),
                          ],
                       ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //children: [
                          /*  Text("${peso} "),
                            Text(" ${variacaoPeso}",
                             style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 76, 99, 175),
                              ),)
                          ],*/
                       ),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                             Text("Peso"),
                             Text("Yen"),
                          ],
                       ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //children: [
                           // Text("${yen} "),
                            //Text(" ${variacaoYen}", 
                            /* style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 175, 76, 76),
                              ),
                            )
                          ],*/
                       ),


                      ],   
                    ),

                   
                    
                  ),
                ),

                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Botao(funcao: irProximo, texto: 'Ir para Página Principal' )
                  ],
                )
              ],
            ),
          ],

          
         ),
      ),
    );
  }
}