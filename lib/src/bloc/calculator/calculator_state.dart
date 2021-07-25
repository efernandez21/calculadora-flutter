part of 'calculator_bloc.dart';

// Se almacena la informacion que no se quiere cambiar, tendremos en este caso diferentes estados

class CalculatorState {
  // Propiedades final que no van a cambiar
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;
  // Constructor con las propiedades de la calculadora, si fuera null safety se tiene que indicar si las propiedades son obligatorias o opcionales
  CalculatorState(
      {this.mathResult = '0',
      this.firstNumber = '0',
      this.secondNumber = '0',
      this.operation = '+'});
  // Metodo para copiar el estado y mantener los valores anteriores al regresar un nuevo estado
  CalculatorState copyWith({
    String mathResult,
    String firstNumber,
    String secondNumber,
    String operation,
  }) => CalculatorState(
    mathResult: mathResult ?? this.mathResult,
    firstNumber: firstNumber ?? this.firstNumber,
    secondNumber: secondNumber ?? this.secondNumber,
    operation: operation ?? this.operation
  );
}
