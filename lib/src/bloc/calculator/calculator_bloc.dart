import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  // Con valores opcionales ya tenemos el estado
  CalculatorBloc() : super(CalculatorState());

  // Metodo que envia el stream o mapea el evento a un estado
  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    // Cambio de estado dependiento del evento ejecutado
    // Borrar Todo
    if (event is ResetAC) {
      // Ejecucion del evento con el estado inicial, el *¨en el yield permite indicar que se emita el valor que el stream va a emitir
      yield* this._resetAC();
      // Agregar Numeros
    } else if (event is AddNumber) {
      yield state.copyWith(
        mathResult: (state.mathResult == '0')
            ? event.number
            : state.mathResult + event.number,
      );
      // Cambiar signo de mas o menos
    } else if (event is ChangeNegativePositive) {
      yield state.copyWith(
        mathResult: (state.mathResult.contains('-'))
            ? state.mathResult.replaceFirst('-', '')
            : '-' + state.mathResult,
      );
      // Borrar ultimo digito
    } else if (event is DeleteLastEntry) {
      yield state.copyWith(
          mathResult: state.mathResult.length > 1
              ? state.mathResult.substring(0, state.mathResult.length - 1)
              : '0');
      // Agregar operacion
    } else if (event is OperationEntry) {
      // Con este evento cambiamos diferentes valores en pantalla, el state representa el anterior estado, accedemos a propiedades anteriores para trabajar con la vista de la calculadora en un nuevo estado
      yield state.copyWith(
          firstNumber: state.mathResult,
          mathResult: '0',
          operation: event.operation,
          secondNumber: '0');
    } else if (event is CalculateResult) {
      yield* _calculateResult();
    }
  }

  // Metodo para resetear, mostrar mas limpio el codigo
  Stream<CalculatorState> _resetAC() async* {
    yield CalculatorState(
        firstNumber: '0', mathResult: '0', operation: '+', secondNumber: '0');
  }

  // Metodo para calcular el resultado, mostrar mas limpio el codigo
  Stream<CalculatorState> _calculateResult() async* {
    // Logica para manejar el resultado de la operacion mostrada en pantalla
    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);
    // switch para manejar el tipo de operacion
    switch (state.operation) {
      case '+':
        yield state.copyWith(secondNumber: state.mathResult, mathResult: '${num1 + num2}', );
        break;
      case '-':
        yield state.copyWith(secondNumber: state.mathResult, mathResult: '${num1 - num2}', );
        break;
      case 'X':
        yield state.copyWith(secondNumber: state.mathResult, mathResult: '${num1 * num2}', );
        break;
      case '/':
        yield state.copyWith(secondNumber: state.mathResult, mathResult: '${num1 / num2}', );
        break;
      default:
        // Mantiene el estado actual
        yield state;
    }
  }
}
