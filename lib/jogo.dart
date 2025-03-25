import 'package:flutter/material.dart';
import 'dart:math';

// Mudança de estado
class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("images/padrao.png");
  var _resultadoFinal = "Boa sorte!!!";
  var _pontoApp = 0;
  var _pontoUsuario = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imageApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          _imageApp = AssetImage("images/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          _imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _resultadoFinal = "Parabéns! Você ganhou";
        _pontoUsuario += 1;
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _resultadoFinal = "Tente novamente! Você perdeu";
        _pontoApp += 1;
      });
    } else {
      setState(() {
        _resultadoFinal = "Empate! Tente novamente";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Imagem padrão de escolha do app
          Image(image: _imageApp),

          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha uma opção abaixo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('images/pedra.png'),
                        height: 100,
                      ),
                      Text("Pedra",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  )),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('images/papel.png'),
                        height: 100,
                      ),
                      Text("Papel",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  )),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('images/tesoura.png'),
                        height: 100,
                      ),
                      Text("Tesoura",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 16),
            child: Text(
              _resultadoFinal,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 16),
            child: Text(
              "Pontuação",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Usuário: " + _pontoUsuario.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:
                        (_pontoUsuario > _pontoApp ? Colors.green : Colors.red),
                  )),
              Text("Robô: " + _pontoApp.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:
                        (_pontoApp > _pontoUsuario ? Colors.green : Colors.red),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
