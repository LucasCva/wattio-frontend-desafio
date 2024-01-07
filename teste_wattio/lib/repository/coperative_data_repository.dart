import 'package:teste_wattio/repository/energy_plans_repository.dart';

// função assincrona para filtrar as cooperativas com base no valor do slider
class CoperativeDataRepository {
  Future<List<dynamic>?> filtraAsCorporacoes(double sliderValue) async {
    await Future.delayed(const Duration(seconds: 1));
    List<dynamic> corporativasFiltradas = coperativas
        .where((coperativas) =>
            coperativas['minimo'] <= sliderValue &&
            sliderValue <= coperativas['maximo'])
        .toList();

    return corporativasFiltradas.isNotEmpty ? corporativasFiltradas : null;
  }
}
