import 'package:flutter/material.dart';
import 'package:teste_wattio/screens/parabens.dart';
import 'package:teste_wattio/services/economy_calculations.dart';
import 'package:teste_wattio/util/number_format.dart';

class ModalBottomContent extends StatelessWidget {
  final String companyName;
  final double companyDescont;
  final double valorConta;

  const ModalBottomContent({
    super.key,
    required this.companyDescont,
    required this.companyName,
    required this.valorConta,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Color.fromRGBO(22, 21, 53, 1),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 11, 10, 27),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              companyName,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Sua economia anual será de até ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(13, 12, 31, 1),
                  ),
                ),
                Text(
                  NumerFormat.format(
                    EconomyCalculations.economiaAnual(
                      valorConta,
                      companyDescont,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 33, 160, 37),
                  ),
                ),
                Text(
                  'Em média ${NumerFormat.format(EconomyCalculations.economiaMensal(
                    valorConta,
                    companyDescont,
                  ))} por mês*',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 33, 160, 37),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Parabens(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 11, 10, 27),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Contratar",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
