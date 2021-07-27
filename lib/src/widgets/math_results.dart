import 'package:calculadora/src/controllers/calculator_controller.dart';
import 'package:calculadora/src/widgets/resultado_principal.dart';
import 'package:calculadora/src/widgets/resultado_secundario.dart';
import 'package:calculadora/src/widgets/separador_calculadora.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MathResults extends StatelessWidget {
  // Buscamos la instancia de mi CalculatorController que afectara o controlara el cambio en los widgets de la vista
  final calculatorCtrl = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    // Widget que cambiara con base en los resultados, teniendo en cuenta el Obx ó el observable
    return Obx(() => Column(
        children: [
          // Widgets constructores de la parte visual de resultados de la calculadora
          ResultadoSecundario(text: '${calculatorCtrl.firstNumber}'),
          ResultadoSecundario(text: '${calculatorCtrl.operation}',),
          ResultadoSecundario(text: '${calculatorCtrl.secondNumber}',),
          SeparadorCalculadora(),
          ResultadoPrincipal(text: '${calculatorCtrl.mathResult}'),
        ],
      
    ));
  }
}