class IMC {
  double peso;
  double altura;

  IMC({required this.peso, required this.altura});

  double get imc {
    return peso / (altura * altura);
  }

  FaixaIMC get faixa {
    double valueIMC = imc;

    if (valueIMC < 18.5) {
      return FaixaIMC.AbaixoIdeal;
    } else if (valueIMC >= 18.5 && valueIMC < 24.9) {
      return FaixaIMC.PesoIdeal;
    } else if (valueIMC >= 25 && valueIMC < 29.9) {
      return FaixaIMC.AcimaIdeal;
    } else if (valueIMC >= 30 && valueIMC < 34.9) {
      return FaixaIMC.Obesidade1;
    } else if (valueIMC >= 35 && valueIMC < 39.9) {
      return FaixaIMC.Obesidade2;
    } else {
      return FaixaIMC.Obesidade3;
    }
  }
}

enum FaixaIMC {
  AbaixoIdeal,
  PesoIdeal,
  AcimaIdeal,
  Obesidade1,
  Obesidade2,
  Obesidade3,
}

extension FaixaIMCExtension on FaixaIMC {
  String get descricao {
    switch (this) {
      case FaixaIMC.AbaixoIdeal:
        return 'Abaixo do Peso';
      case FaixaIMC.PesoIdeal:
        return 'Peso Normal';
      case FaixaIMC.AcimaIdeal:
        return 'Sobrepeso';
      case FaixaIMC.Obesidade1:
        return 'Obesidade Grau 1';
      case FaixaIMC.Obesidade2:
        return 'Obesidade Grau 2';
      case FaixaIMC.Obesidade3:
        return 'Obesidade Grau 3';
    }
  }
}