library resultados_tjse;
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final String tituloUm;
  final String tituloDois;
  final String dados;
  final String dadosExpandidos;

  const Resultado(
      this.tituloUm, this.tituloDois, this.dados, this.dadosExpandidos,
      {super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  bool expandedValidator = false;

  Icon iconeAbrir =
  const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black, size: 40);

  Icon iconeFechar = const Icon(Icons.keyboard_arrow_up_rounded,
      color: Colors.black, size: 40);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8,),
      child: Column(
        children: [
          Container(
            width: 400,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${widget.tituloUm}\n${widget.tituloDois}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  )
                ]),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            child: ExpansionTile(
              onExpansionChanged: (expanded) {
                setState(() {
                  expandedValidator = expanded;
                });
              },
              expandedAlignment: Alignment.center,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.dados,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Container(
                margin: const EdgeInsets.only(top: 50),
                child: expandedValidator ? iconeFechar : iconeAbrir,
              ),
              children: <Widget>[
                Text(widget.dadosExpandidos,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

