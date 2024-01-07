class EconomyCalculations {
  static double economiaAnual(double conta, double percentual) {
    double economiaAnual = (percentual * 12) * conta;
    return economiaAnual;
  }

  static double economiaMensal(double conta, double percentual) {
    double economiaMensal = (conta * percentual);
    return economiaMensal;
  }
}
