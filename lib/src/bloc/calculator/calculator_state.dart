part of 'calculator_bloc.dart';

// Se almacena la informacion que no se quiere cambiar, tendremos en este caso diferentes estados

class CalculatorState {
  // Propiedades final que no van a cambiar
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;
  // Constructor con las propiedades de la calculadora, si fuera null safety se tiene que indicar si las propiedades son obligatorias o opcionales
  CalculatorState({
    this.mathResult = '0', 
    this.firstNumber = '0', 
    this.secondNumber = '0', 
    this.operation = '+'
  });
}
