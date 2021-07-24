import 'package:calculadora/src/bloc/calculator/calculator_bloc.dart';
import 'package:calculadora/src/screens/calculadora_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() => runApp(AppState());
// Widget para separar MyApp de cualquier lista de blocks en busqueda de codigo mas limpio
 class AppState extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MultiBlocProvider(
       child: MyApp(),
       providers: [
        //  Blocs a usar en la parte mas alta de mi aplicacion
         BlocProvider<CalculatorBloc>(create: (_) => new CalculatorBloc())
       ],
     );
   }
 }
//  Widget de construccion de mi app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: CalculadoraPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black
      ),
    );
  }
}