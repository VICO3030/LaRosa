import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  final Function() onPressed; // Requerido
  final String text; // Requerido
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry margin;
  final double? width;
  final double height;
  final IconData? iconData;
  final Color iconColor;

  DefaultButton({
    required this.text,
    required this.onPressed, // Parámetro requerido
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.margin = const EdgeInsets.only(bottom: 20, left: 40, right: 40), // Margen opcional
    this.height = 45,
    this.width,
    this.iconData,
    this.iconColor = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width, // Si no hay width, toma el ancho de la pantalla
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed, // onPressed ya no necesita ser opcional
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null)
              Icon(
                iconData,
                color: iconColor,
                size: 30,
              ),
            if (iconData != null) SizedBox(width: 7),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
