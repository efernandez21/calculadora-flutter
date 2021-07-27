import 'package:calculadora/src/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:calculadora/src/widgets/boton_calculadora.dart';
import 'package:calculadora/src/widgets/math_results.dart';

/// Pantalla principal de la calculadora 
class CalculadoraPage extends StatelessWidget {
  // Inyeccion de la dependencia del Get, por lo general lo colocamos donde sera indispensable usarlo a partir de ese lugar de entrada, ademas de crear la instancia tambien la regresa
  final calculatorCtrl = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Page'),
        centerTitle: true, 
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Container()
              ),
              // Montaje en pantalla de los valores de la calculadora
              MathResults(),
              // Montaje de la primera fila de la calculadora
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Fila de botones de calculadora
                  BotonCalculadora(
                    text: 'AC',
                    bgColor: Color(0xffA5A5A5), 
                    onPressed: ()=> calculatorCtrl.resetAll()
                  ),
                  BotonCalculadora(
                    text: '+/-',
                    bgColor: Color(0xffA5A5A5), 
                    onPressed: ()=>calculatorCtrl.changeNegativePositive()
                  ),
                  BotonCalculadora(
                    text: 'del',
                    bgColor: Color(0xffA5A5A5), 
                    onPressed: () => calculatorCtrl.deleteLastEntry()
                  ),
                  BotonCalculadora(
                    text: '/',
                    bgColor: Color(0xffF0A23B), 
                    onPressed: ()=> calculatorCtrl.selectOperation('/')
                  ),
                ],
              ),
              // Montaje de la segunda fila de la calculadora
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCalculadora( 
                    text: '7',
                    onPressed: () => calculatorCtrl.addNumber('7'),
                  ),
                  BotonCalculadora( 
                    text: '8',
                    onPressed: () => calculatorCtrl.addNumber('8'),
                  ),
                  BotonCalculadora( 
                    text: '9',
                    onPressed: () => calculatorCtrl.addNumber('9'),
                  ),
                  BotonCalculadora( 
                    text: 'X',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () =>calculatorCtrl.selectOperation('X'),
                  ),
                ],
              ),
              // Montaje 3 linea calculadora
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCalculadora( 
                    text: '4', 
                    onPressed: () => calculatorCtrl.addNumber('4'),
                  ),
                  BotonCalculadora( 
                    text: '5', 
                    onPressed: () => calculatorCtrl.addNumber('5'),
                  ),
                  BotonCalculadora( 
                    text: '6', 
                    onPressed: () => calculatorCtrl.addNumber('6'),
                  ),
                  BotonCalculadora( 
                    text: '-',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorCtrl.selectOperation('-'),
                  ),
                ],
              ),
              // Cuarta linea con valores 1 2 3 y +
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCalculadora( 
                    text: '1', 
                    onPressed: () => calculatorCtrl.addNumber('1'),
                  ),
                  BotonCalculadora( 
                    text: '2', 
                    onPressed: () => calculatorCtrl.addNumber('2'),
                  ),
                  BotonCalculadora( 
                    text: '3', 
                    onPressed: () => calculatorCtrl.addNumber('3'),
                  ),
                  BotonCalculadora(
                    text: '+',  
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () =>calculatorCtrl.selectOperation('+'),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCalculadora( 
                    text: '0', 
                    big: true,
                    onPressed: () => calculatorCtrl.addNumber('0'),
                  ),
                  BotonCalculadora( 
                    text: '.', 
                    onPressed: () => calculatorCtrl.addDecimalPoint(),
                  ),
                  BotonCalculadora( 
                    text: '=',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => calculatorCtrl.calculateResult(),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}