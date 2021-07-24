part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

// Eventos que mi bloc esperara
// Metodo al agregar numero, necesito escribir el numero que usaremos en el estado
class AddNumber extends CalculatorEvent {
  final String number;
  // Constructor de la clase
  AddNumber(this.number);
}

// Metodo para borrar todo,
class ResetAC extends CalculatorEvent {}
