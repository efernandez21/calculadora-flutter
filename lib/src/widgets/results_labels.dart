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
        // Para mostarar el widget condicionado a un state, si no se tienen valores solo mostrar el valor inicial
        if (state.firstNumber == '0' && state.secondNumber == '0') {
          return ResultadoPrincipal(
              text: state.mathResult.endsWith('.0')
                  ? state.mathResult.substring(0, state.mathResult.length - 2)
                  : state.mathResult);
        }
        return Column(
          children: [
            ResultadoSecundario(
              text: state.firstNumber.endsWith('.0')
                  ? state.firstNumber.substring(0, state.firstNumber.length - 2)
                  : state.firstNumber,
            ),
            ResultadoSecundario(
              text: state.operation,
            ),
            ResultadoSecundario(
              text: state.secondNumber.endsWith('.0')
                  ? state.secondNumber.substring(0, state.secondNumber.length - 2)
                  : state.secondNumber,
            ),
            SeparadorCalculadora(),
            // Resultado principal con condicionamiento del resultado final
            ResultadoPrincipal(
                text: state.mathResult.endsWith('.0')
                    ? state.mathResult.substring(0, state.mathResult.length - 2)
                    : state.mathResult),
          ],
        );
      },
    );
  }
}
