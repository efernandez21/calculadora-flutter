part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

// Eventos que mi bloc esperara
// Evento al agregar numero, necesito escribir el numero que usaremos en el estado
class AddNumber extends CalculatorEvent {
  final String number;
  // Constructor de la clase
  AddNumber(this.number);
}

// Evento para borrar todo,
class ResetAC extends CalculatorEvent {}

// Evento para cambiar el estado positivo negativo de un numero
class ChangeNegativePositive extends CalculatorEvent {}

// Evento para eliminar la ultima entrada digito a digito
class DeleteLastEntry extends CalculatorEvent {}

// Evento de manejo de operaciones
class OperationEntry extends CalculatorEvent {
  final String operation;
  OperationEntry(this.operation);
}
// Evento para calcular el resultado
class CalculateResult extends CalculatorEvent{}
