import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calculadora/src/bloc/calculator/calculator_bloc.dart';

import 'package:calculadora/src/widgets/results_labels.dart';
import 'package:calculadora/src/widgets/boton_calculadora.dart';




/// Pantalla principal de la calculadora 
class CalculadoraPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Instancia del bloc para comunicar cambios en la app
    // ignore: close_sinks
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

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
              // Montaje en pantalla de los valores de la calculadora, valores que se redibujan en un cambio de state
              ResultsLabels(),
              // Montaje de la primera fila de la calculadora
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Fila de botones de calculadora
                  BotonCalculadora(
                    text: 'AC',
                    bgColor: Color(0xffA5A5A5), 
                    onPressed: ()=> calculatorBloc.add(ResetAC())
                  ),
                  BotonCalculadora(
                    text: '+/-',
                    bgColor: Color(0xffA5A5A5), 
                    onPressed: ()=> print('+/-')
                  ),
                  BotonCalculadora(
                    text: 'del',
                    bgColor: Color(0xffA5A5A5), 
                    onPressed: ()=> print('del')
                  ),
                  BotonCalculadora(
                    text: '/',
                    bgColor: Color(0xffF0A23B), 
                    onPressed: ()=> print('/')
                  ),
                ],
              ),
              // Montaje de la segunda fila de la calculadora
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCalculadora( 
                    text: '7',
                    onPressed: () => calculatorBloc.add(AddNumber('7')),
                  ),
                  BotonCalculadora( 
                    text: '8',
                    onPressed: () => calculatorBloc.add(AddNumber('8')),
                  ),
                  BotonCalculadora( 
                    text: '9',
                    onPressed: () => calculatorBloc.add(AddNumber('9')),
                  ),
                  BotonCalculadora( 
                    text: 'X',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => print('X'),
                  ),
                ],
              ),
              // Montaje 3 linea calculadora
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCalculadora( 
                    text: '4', 
                    onPressed: () => print('4'),
                  ),
                  BotonCalculadora( 
                    text: '5', 
                    onPressed: () => print('5'),
                  ),
                  BotonCalculadora( 
                    text: '6', 
                    onPressed: () => print('6'),
                  ),
                  BotonCalculadora( 
                    text: '-',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => print('-'),
                  ),
                ],
              ),
              // Cuarta linea con valores 1 2 3 y +
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCalculadora( 
                    text: '1', 
                    onPressed: () => print('1'),
                  ),
                  BotonCalculadora( 
                    text: '2', 
                    onPressed: () => print('2'),
                  ),
                  BotonCalculadora( 
                    text: '3', 
                    onPressed: () => print('3'),
                  ),
                  BotonCalculadora(
                    text: '+',  
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => print('+'),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCalculadora( 
                    text: '0', 
                    big: true,
                    onPressed: () => print('0'),
                  ),
                  BotonCalculadora( 
                    text: '.', 
                    onPressed: () => print('.'),
                  ),
                  BotonCalculadora( 
                    text: '=',
                    bgColor: Color(0xffF0A23B ),
                    onPressed: () => print('='),
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