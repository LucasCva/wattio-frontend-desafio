import 'package:flutter/material.dart';

class CardCompany extends StatelessWidget {
  final String companyName;
  final double companyDescont;

  const CardCompany({
    super.key,
    required this.companyName,
    required this.companyDescont,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 11, 10, 27),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.bolt,
                size: 50,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                companyName,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Energy company",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Container(
              height: 40,
              width: 85,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 26, 65),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '${companyDescont * 100}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
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
