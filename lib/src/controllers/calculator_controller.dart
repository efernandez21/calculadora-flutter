// Clase de controlador para la calculadora
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  // Propiedades para el control y extension del GetxController, inicializamos valores debido al null safety que en este caso no necesitamos aplicar, es necesario convertir los tipos generales a los tipos del Getx como en este caso RxString o usar el var
  var firstNumber = '0'.obs;
  var secondNumber = '0'.obs;
  var mathResult = '0'.obs;
  var operation = ''.obs;

  // Metodo para limpiar la pantalla de los numeros de la calculadora
  void resetAll() {
    firstNumber.value = '0';
    secondNumber.value = '0';
    mathResult.value = '0';
    operation.value = '';
  }

  // Metodo para cambiar el signo del numero
  changeNegativePositive() {
    if (mathResult.startsWith('-')) {
      // Reemplazamos el negativo por vacio
      mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      // Reemplazamos el vacio por el negativo
      mathResult.value = '-' + mathResult.value;
    }
  }

  // Metodo para añadir un numero en pantalla
  addNumber(String number) {
    // Condicionamos si recibimos algun valor si no se saldra y cambiara el mathResult por el nuevo numero
    if (mathResult.value == '0') return mathResult.value = number;
    // Si el valor es -0 mantendremos el numero negativo
    if (mathResult.value == '-0') {
      return mathResult.value = '-' + number;
    }
    // agregando numeros concatenados
    mathResult.value = mathResult.value + number;
  }

  // Metodo para el punto decimal
  addDecimalPoint() {
    // Si contiene un punto me salgo de la funcion esto para no permitir mas puntos en la vista expresada en el resultado
    if (mathResult.contains('.')) return;
    // Si empieza con el cero permitirlo
    if (mathResult.startsWith('0')) {
      mathResult.value = '0.';
    } else {
      mathResult.value = mathResult.value + '.';
    }
  }

  // Metodo para la seleccion de la operacion
  selectOperation(String newOperation) {
    // Enviamos el valor de la operacion a actualizacion
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    secondNumber.value = '0';
    mathResult.value = '0';
  }

  // Metodo para borrar un caracter
  deleteLastEntry() {
    if (mathResult.value.replaceAll('-', '').length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = '0';
    }
  }

  // Metodo para calcular la operacion
  calculateResult() {
    // Carga de los numeros
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);

    // Reemplazo de los numeros
    secondNumber.value = mathResult.value;
    // Comprobacion atraves del switch
    switch (operation.value) {
      case '+':
        mathResult.value = '${num1 + num2}';
        break;
      case '-':
        mathResult.value = '${num1 - num2}';
        break;
      case 'X':
        mathResult.value = '${num1 * num2}';
        break;
      case '/':
        mathResult.value = '${num1 / num2}';
        break;
      default:
        return;
    }
    // Controlando la salida del mathResult
    if (mathResult.value.endsWith('.0')) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 2);
    }
  }
}
