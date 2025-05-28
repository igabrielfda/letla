import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAomes = TextEditingController();
  TextEditingController _controllerPorsemana = TextEditingController();
  String _resultado = '';
  //método para calcular o melhor preço
  void _calcular() {
    //pega o valor do alcool e gasolina
    double? precoAomes = double.tryParse(_controllerAomes.text);
    double? precoPorsemana = double.tryParse(_controllerPorsemana.text);

    if (precoAomes == null || precoPorsemana == null) {
      setState(() {
        _resultado = 'Digite um valor válido!';
      });
      return;
    } else {
      setState(() {
        // double valorComparacao = precoAomes / (precoPorsemana * 4);

        if (precoAomes == (precoPorsemana * 4)) {
          _resultado = 'Dá no mesmo';
        } else if (precoAomes > (precoPorsemana * 4)) {
          _resultado = 'Por semana é melhor';
        } else if (precoAomes < (precoPorsemana * 4)){
          _resultado = 'Ao mês é melhor';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compras: Ao mês ou Por semana?'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.network('https://www.financasforever.com.br/assets/images/dicas-para-economizar-dinheiro-nas-hora-de-fazer-comprasjpg-20240703104143-jpg.jpg?_cchid=690a620828cf6801b897808c7dfcdc16'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Descubra a melhor opção de compra',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Gastos Ao Mês',
                  labelStyle: TextStyle(fontSize: 22),
                ),
                controller: _controllerAomes,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Gastos Por Semana',
                  labelStyle: TextStyle(fontSize: 22),
                ),
                controller: _controllerPorsemana,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  ),
                  onPressed: _calcular,
                  child: Text('Calcular'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
