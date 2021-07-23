import 'package:flutter/material.dart';


/// Widget que permite dar una separacion en pantalla de los valores de la calculadora
class SeparadorCalculadora extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      color: Colors.white.withOpacity(0.4),
      margin: EdgeInsets.symmetric( vertical: 10 )
    );
  }
}