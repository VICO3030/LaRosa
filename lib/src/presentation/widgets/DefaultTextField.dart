import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String text; // Requerido
  final IconData icon; // Requerido
  final EdgeInsetsGeometry? margin; // Opcional
  final Function(String text)? onChanged; // Opcional
  final String? Function(String?)? validator; // Opcional

  DefaultTextField({
    required this.text,
    required this.icon,
    this.onChanged,
    this.validator,
    this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20), // Margen opcional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(fontSize: 17),
        validator: validator,
        decoration: InputDecoration(
          label: Text(
            text,
            style: TextStyle(fontSize: 13),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
