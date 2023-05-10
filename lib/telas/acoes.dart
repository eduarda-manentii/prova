import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

import '../componentes/botao_form.dart';

class Acoes extends StatefulWidget {
  const Acoes({super.key});

  @override
  State<Acoes> createState() => _AcoesState();
}

class _AcoesState extends State<Acoes> {

  
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

  apiAcoes() async {
    const String urlAcoes =  "https://api.hgbrasil.com/finance?key=4f228a35&format=json-cors";
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

   irProximo() {
       Navigator.pushNamed(context, '/bitcoin');
    }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
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
                  child: const Text('Ações')
                ),
                Botao(funcao: apiAcoes, texto: 'Ver valores'),
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
                          children: const [
                            Text("IBOVESPA"),
                          ],
                        ),
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(ibovespa),
                            Text(
                              variacaoIbovespa,
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 76, 99, 175),
                              ),
                            )
                          ],
                       ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("NASDAQ"),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(nasdaq),
                            Text( 
                              variacaoNasdaq, 
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 76, 99, 175),
                             ),
                           )
                          ],
                       ),

                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                             Text("CAC"),
                          ],
                       ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cac),
                            Text(variacaoCac,
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 76, 99, 175),
                             ),
                            )
                          ],
                       ),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                             Text("IFIX"),
                          ],
                       ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(ifix),
                            Text(variacaoIfix, 
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 175, 76, 76),
                              ),
                            )
                          ],
                       ),
                      ],   
                    ),    
                  ),
                ),

                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Botao(funcao: irProximo, texto: 'Ir para Bitcoin' )
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