import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "O importante não é vender todos os dias, mas lutar sempre.",
    "Maior que a tristeza de não haver vencido é a vergonha de não ter lutado!",
    "É melhor conquistar a si mesmo do que vencer mil batalhas.",
    "Enquanto houver vontade de lutar haverá esperança de vencer.",
    "Difícil é ganhar um amigo em uma hora; fácil é ofendê-lo em um minuto.",
    "O medo de perder tira a vontade de ganhar.",
    "Aquele que não tem confiança nos outros, não lhes pode inspirar confiança.",
    "Não basta conquistar a sabedoria, é preciso usá-la.",
    "Age como se o que fazes fizesse a diferença. E faz.",
    "A verdadeira arte de viajar... A gente sempre deve sair à revelia. Levar o coração vazio para que impregne, para que pegue tudo.",
    "Cada passo dado hoje constrói o sucesso de amanhã.",
    "Disciplina vence a motivação quando a motivação falha.",
    "Pequenos progressos diários geram grandes resultados.",
    "O impossível só existe até alguém decidir tentar.",
    "Foco no processo, o resultado é consequência.",
    "Evoluir um pouco todos os dias é melhor do que parar.",
    "Persistência transforma esforço em conquista.",
    "Você é mais capaz do que imagina.",
    "O impossível só existe até alguém decidir tentar.",
    "Foco no processo, o resultado é consequência.",
    "Evoluir um pouco todos os dias é melhor do que parar.",
    "Persistência transforma esforço em conquista.",
    "Você é mais capaz do que imagina.",
    "O sucesso começa com a decisão de não desistir.",
    "Quem tem propósito, encontra o caminho",
    "Resultados consistentes nascem de atitudes constantes",
    "Trabalhe duro hoje para colher tranquilo amanhã",
    "Toda jornada começa com a decisão de agir",
    "Seu esforço de hoje será o orgulho de amanhã",
    "A excelência é construída no dia a dia",
    "Erros fazem parte do aprendizado, não da desistência",
    "Continue mesmo quando for difícil — é aí que vale a pena",
    "Grandes conquistas exigem compromisso diário",
    "Seja consistente, não perfeito",
    "O progresso acontece fora da zona de conforto",
    "Cada desafio é uma chance de crescer",
    "A diferença entre quem sonha e quem realiza é a ação",
    "Faça hoje o que outros não fazem para viver o que poucos vivem",
    "Constância é o verdadeiro segredo do sucesso",
    "O esforço silencioso gera resultados visíveis",
    "Acredite no processo, mesmo quando ele for lento",
    "Você está construindo algo maior do que imagina",
    "O sucesso é a soma de boas decisões repetidas",
    "Não pare quando cansar, pare quando terminar",
    "Seu futuro agradece pelo esforço que você faz hoje",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases do Dia'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.jpeg"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: _gerarFrase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
