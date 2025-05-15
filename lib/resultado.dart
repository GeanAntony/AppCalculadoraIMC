import 'package:flutter/material.dart';
import 'package:imcapp/imc.dart';

class IMCResultado extends StatefulWidget {
  final IMC imc;

  IMCResultado({required this.imc});

  @override
  _IMCResultadoState createState() => _IMCResultadoState();
}

class _IMCResultadoState extends State<IMCResultado> {
  late Color _corFaixa;

  @override
  void initState() {
    super.initState();
    switch (widget.imc.faixa) {
      case FaixaIMC.AbaixoIdeal:
        _corFaixa = Colors.red;
        break;
      case FaixaIMC.PesoIdeal:
        _corFaixa = Colors.blue;
        break;
      case FaixaIMC.AcimaIdeal:
        _corFaixa = Colors.orange;
        break;
      case FaixaIMC.Obesidade1:
        _corFaixa = Colors.orangeAccent;
        break;
      case FaixaIMC.Obesidade2:
        _corFaixa = Colors.red;
        break;
      case FaixaIMC.Obesidade3:
        _corFaixa = Colors.deepPurple;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
        backgroundColor: _corFaixa,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _corFaixa,
                    width: 9,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.imc.imc.toStringAsPrecision(3),
                        style: TextStyle(fontSize: 90),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Classificação:',
                        style: TextStyle(fontSize: 16, color: _corFaixa),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.imc.faixa.descricao,
                        style: TextStyle(fontSize: 20, color: _corFaixa),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        'O seu IMC indica o seu estado de saúde. '
                        'O IMC é uma medida que relaciona o peso e a altura de uma pessoa.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}