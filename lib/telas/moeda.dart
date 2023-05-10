import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

import '../componentes/botao_form.dart';
import '../componentes/caixa_texto.dart';

class Moeda extends StatefulWidget {
  const Moeda({super.key});

  @override
  State<Moeda> createState() => _MoedaState();
}

class _MoedaState extends State<Moeda> {

  //variaveis para a url de moeda
  String dolar = "";
  String variacaoDolar = "";

  String euro = "";
  String variacaoEuro = "";

  String peso = "";
  String variacaoPeso = "";

  String yen = "";
  String variacaoYen = "";


  @override
  Widget build(BuildContext context) {

     apiMoedas() async {
      const String urlMoeda =  "https://api.hgbrasil.com/finance?key=4f228a35&format=json-cors";
      Response respostaMoeda = await get(Uri.parse(urlMoeda));
      Map moeda = json.decode(respostaMoeda.body);
      setState(() {
        dolar =  "${moeda['results']['currencies']['USD']['buy']}";
        variacaoDolar =  "${moeda['results']['currencies']['USD']['variation']}";

        euro =  "${moeda['results']['currencies']['EUR']['buy']}";
        variacaoEuro =  "${moeda['results']['currencies']['EUR']['variation']}";

        peso = "${moeda['results']['currencies']['ARS']['buy']}";
        variacaoPeso = "${moeda['results']['currencies']['ARS']['variation']}";

        yen = "${moeda['results']['currencies']['JPY']['buy']}";
        variacaoYen = "${moeda['results']['currencies']['JPY']['variation']}";
      });
   }

    irProximo() {
       Navigator.pushNamed(context, '/acoes');
    }
   
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
                  child: const Text('Moedas')
                ),
                Botao(funcao: apiMoedas, texto: 'Ver valores'),
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
                          children: [
                            Text("${dolar} "),
                            Text(" ${variacaoDolar}",
                             style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 76, 99, 175),
                              ),)
                          ],
                       ),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(" Euro"),
                          ],
                       ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${euro} "),
                            Text( 
                              "${variacaoEuro}", 
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
                             Text("Peso"),
                          ],
                       ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${peso} "),
                            Text(" ${variacaoPeso}",
                             style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 76, 99, 175),
                              ),)
                          ],
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
                          children: [
                            Text("${yen} "),
                            Text(" ${variacaoYen}", 
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
                    Botao(funcao: irProximo, texto: 'Ir para Ações' )
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