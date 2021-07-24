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
    if (event is ResetAC) {
      // Ejecucion del evento con el estado inicial
      yield CalculatorState(
        firstNumber: '0',
        mathResult: '0',
        operation: 'none',
        secondNumber: '0'
      );
    } else if ( event is AddNumber ) {
      yield CalculatorState(
        firstNumber: '0',
        operation: 'none',
        secondNumber: '0',
        mathResult: (state.mathResult == '0')
                      ? event.number
                      : state.mathResult + event.number,
      );
    }
  }
}
