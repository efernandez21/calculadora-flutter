import 'package:flutter/material.dart';

class ResultadoSecundario extends StatelessWidget {
  // Propiedades del resultado secundario
  final String text;
  // Constructor del resultado secundario
  ResultadoSecundario({
    Key key, 
    @required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text( this.text , style: TextStyle(fontSize: 30 ) ),
    );
  }
}
