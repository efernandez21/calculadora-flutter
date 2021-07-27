import 'package:flutter/material.dart';

/// Widget que muestra el resultado principal obtenido en pantalla
class ResultadoPrincipal extends StatelessWidget {
  // Propiedades de los textos principales
  final String text;
  // Constructor del widget ResultadoPrincipal
  ResultadoPrincipal({
    Key key, 
    @required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Montaje resultado principal, dentro de un fittedBox para que se adapte a la pantalla a medida que aumenten los numeros en el escrito
    return Container(
      margin: EdgeInsets.only( bottom: 20 ),
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text( this.text , style: TextStyle(fontSize: 50 ) )),
    );
  }
}
