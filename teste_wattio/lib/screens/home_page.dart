import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:teste_wattio/repository/coperative_data_repository.dart';
import 'package:teste_wattio/util/number_format.dart';
import 'package:teste_wattio/widgets/card_company.dart';
import 'package:teste_wattio/widgets/modal_bottom_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

// ignore: unused_element
bool _isButton = false;
double _valueConta = 1000.0;
double _valueslide = 1000.0;
double _minValue = 0;
double _maxValue = 100000.0;
CoperativeDataRepository data = CoperativeDataRepository();
TextEditingController _contaMensal =
    TextEditingController(text: NumerFormat.formatReal(_valueslide));

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Title(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Text(
              "Energy Marketplace",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
                fontSize: 25,
                letterSpacing: 1,
              ),
            ),
          ),
          leading: const Icon(
            Icons.bolt,
            size: 45,
            color: Color.fromARGB(255, 255, 240, 80),
          ),
          backgroundColor: const Color.fromRGBO(13, 12, 31, 1),
        ),
        body: Container(
          // Fundo
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(22, 21, 53, 1),
                Color.fromRGBO(29, 28, 70, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 270,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      offset: Offset(0.0, 1),
                    ),
                  ],
                  color: Color.fromRGBO(13, 12, 31, 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                      // Valor da conta mensal
                      child: TextField(
                        controller: _contaMensal,
                        onChanged: (value) {
                          try {
                            String valorSemFormato = _contaMensal.text
                                .replaceAll(RegExp(r'[^\d.]'), '');

                            if (valorSemFormato.isEmpty ||
                                valorSemFormato == "R\$") {
                              setState(() {
                                _valueslide = 10000.0;
                                _valueConta = 10000.0;
                              });
                            } else {
                              setState(() {
                                _valueslide = double.parse(valorSemFormato);
                                _valueConta = double.parse(valorSemFormato);
                              });
                            }
                          } catch (e) {
                            // ignore: avoid_print
                            print(e);
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      "Valor mensal da sua conta",
                      style: TextStyle(
                        fontSize: 23,
                        color: Color.fromRGBO(204, 204, 204, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                      // Slider
                      child: Slider(
                        value: _valueslide,
                        onChanged: (double value) {
                          setState(() {
                            _valueslide = value;
                            _valueConta = value;
                          });
                          try {
                            _contaMensal.text = NumerFormat.formatReal(value);
                          } catch (e) {
                            // ignore: avoid_print
                            print(e);
                          }
                        },
                        min: _minValue,
                        max: _maxValue,
                        activeColor: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: Text(
                      "Companys",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: data.filtraAsCorporacoes(_valueslide),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        _isButton = false;
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Animate(
                                effects: const [
                                  FadeEffect(
                                    begin: 0.0,
                                    end: 1.0,
                                  ),
                                  SlideEffect(
                                    duration: Duration(milliseconds: 500),
                                    begin: Offset(0.0, 1.0),
                                    end: Offset.zero,
                                  ),
                                ],
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ModalBottomContent(
                                                companyDescont: snapshot
                                                    .data![index]['desconto'],
                                                companyName: snapshot
                                                    .data![index]['nome'],
                                                valorConta: _valueConta);
                                          },
                                        );
                                      },
                                      child: CardCompany(
                                          companyName: snapshot.data![index]
                                              ['nome'],
                                          companyDescont: snapshot.data![index]
                                              ['desconto'])),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                            child: Text(
                          'Não há cooperativas disponíveis.',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
