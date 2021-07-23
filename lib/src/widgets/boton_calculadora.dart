import 'package:flutter/material.dart';


// Boton simple de la calculadora
class BotonCalculadora extends StatelessWidget {
  // Propiedades para la construccion de este boton, el big me indicara un agrandamiento del boton
  final Color bgColor;
  final bool big;
  final String text;
  final Function onPressed;
  // Constructor del boton especifico para la calculadora, se envian algunos valores por defecto teniendo en cuenta que estamos trabajando sin null safety
  BotonCalculadora({
    Key key, 
    this.bgColor = const Color(0xff333333), 
    this.big = false, 
    @required this.text,
    @required this.onPressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Estilo del boton
    final buttonStyle = TextButton.styleFrom(
        backgroundColor: this.bgColor,
        primary: Colors.white,
        shape: StadiumBorder(),
    );
    return Container(
      margin: EdgeInsets.only( bottom: 10, right: 5, left: 5 ),
      child: TextButton(
        style: buttonStyle,
        child: Container(
          width: this.big ? 150 : 65,
          height: 65,
          child: Center(
            child: Text(this.text, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),),
          ),
        ),
        onPressed: ()=> this.onPressed(), 
      ),
    );
  }
}