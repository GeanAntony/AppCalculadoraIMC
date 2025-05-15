import 'package:flutter/material.dart';
import 'package:imcapp/imc.dart';
import 'package:imcapp/resultado.dart';

class HomeIMC extends StatefulWidget {
  @override
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<HomeIMC> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();

  void _limparCampos() {
    _alturaController.text = '';
    _pesoController.text = '';
  }

  void _btnCalcularIMC() {
    double alt = double.parse(_alturaController.text);
    double pes = double.parse(_pesoController.text);

    var myImc = IMC(altura: alt, peso: pes);

    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IMCResultado(imc: myImc),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _limparCampos,
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Icon(
                  Icons.calculate_outlined,
                  color: Colors.yellow,
                  size: 80.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Peso (kg)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Altura (m)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: _btnCalcularIMC,
                  child: Text('Calcular IMC'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}