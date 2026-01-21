import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // Import for SystemNavigator
import 'dart:math';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<String> _frases = [
    "O importante não é vencer todos os dias, mas lutar sempre.",
    "Maior que a tristeza de não ter vencido é a vergonha de não ter lutado.",
    "É melhor conquistar a si mesmo do que vencer mil batalhas.",
    "Enquanto houver vontade de lutar, haverá esperança de vencer.",
    "Difícil é ganhar um amigo em uma hora; fácil é perdê-lo em um minuto.",
    "O medo de perder tira a vontade de ganhar.",
    "Quem não confia nos outros, não pode inspirar confiança.",
    "Não basta conquistar a sabedoria, é preciso usá-la.",
    "Aja como se o que você faz realmente fizesse diferença. E faz.",
    "Cada passo dado hoje constrói o sucesso de amanhã.",
    "Disciplina vence a motivação quando ela falha.",
    "Pequenos progressos diários geram grandes resultados.",
    "O impossível só existe até alguém tentar.",
    "Foco no processo, o resultado é consequência.",
    "Evoluir um pouco todos os dias é melhor do que parar.",
    "Persistência transforma esforço em conquista.",
    "Você é mais capaz do que imagina.",
    "O sucesso começa com a decisão de não desistir.",
    "Quem tem propósito encontra o caminho.",
    "Resultados consistentes nascem de atitudes constantes.",
    "Trabalhe duro hoje para colher tranquilo amanhã.",
    "Toda jornada começa com a decisão de agir.",
    "Seu esforço de hoje será o orgulho de amanhã.",
    "A excelência é construída no dia a dia.",
    "Erros fazem parte do aprendizado, não da desistência.",
    "Continue mesmo quando for difícil — é aí que vale a pena.",
    "Grandes conquistas exigem compromisso diário.",
    "Seja consistente, não perfeito.",
    "O progresso acontece fora da zona de conforto.",
    "Cada desafio é uma chance de crescer.",
    "A diferença entre quem sonha e quem realiza é a ação.",
    "Faça hoje o que outros não fazem para viver o que poucos vivem.",
    "Constância é o verdadeiro segredo do sucesso.",
    "O esforço silencioso gera resultados visíveis.",
    "Acredite no processo, mesmo quando ele for lento.",
    "Você está construindo algo maior do que imagina.",
    "O sucesso é a soma de boas decisões repetidas.",
    "Não pare quando cansar, pare quando terminar.",
    "Seu futuro agradece pelo esforço que você faz hoje.",
  ];

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  String _fraseGerada =
      "Toque no botão abaixo para gerar uma frase inspiradora!";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);
    _controller.reverse().then((_) {
      setState(() {
        _fraseGerada = _frases[numeroSorteado];
      });
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF43E97B), Color(0xFF38F9D7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            child: Center(
              child: Text(
                'Frases do Dia',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white,
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 32,
                        spreadRadius: 4,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "images/logo.jpeg",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFe0eafc), Color(0xFFcfdef3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Text(
                      _fraseGerada,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF43E97B), Color(0xFF38F9D7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: _gerarFrase,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Nova Frase",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Add some spacing
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFC6076),
                          Color(0xFFFF9A44),
                        ], // A nice red/orange gradient for exit
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop(); // This will close the app
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Sair do Aplicativo",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
