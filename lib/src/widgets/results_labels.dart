import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calculadora/src/bloc/calculator/calculator_bloc.dart';

import 'package:calculadora/src/widgets/resultado_principal.dart';
import 'package:calculadora/src/widgets/resultado_secundario.dart';
import 'package:calculadora/src/widgets/separador_calculadora.dart';

// Widget que separa la logica de construccion de lo ejecutado con el bloc
class ResultsLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // El blocBuilder estara pendiente de mi state a redibujar valores
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(
          children: [
            ResultadoSecundario(
              text: state.firstNumber,
            ),
            ResultadoSecundario(
              text: state.operation,
            ),
            ResultadoSecundario(
              text: state.secondNumber,
            ),
            SeparadorCalculadora(),
            ResultadoPrincipal(text: state.mathResult),
          ],
        );
      },
    );
  }
}
