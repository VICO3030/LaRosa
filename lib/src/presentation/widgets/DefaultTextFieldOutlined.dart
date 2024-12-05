import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {
  String text;
  IconData icon;
  EdgeInsetsGeometry margin;
  Function (String text) onChanged; 
    String? Function(String?)? validator;  
  

  DefaultTextFieldOutlined({
    required this.text,
    required this.icon,
    required  this.onChanged,
    this.margin= const EdgeInsets.only(top: 50, left: 20, right: 20),
    this.validator
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: margin,
      decoration: BoxDecoration(
        

        color: Color.fromRGBO(255,255,255,0.2 ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ), // BoxDecoration
      child: TextFormField(
          onChanged:(text){
          onChanged(text);
        },
        validator: validator,


        decoration: InputDecoration(
          label: Text(text),
         // border: InputBorder.none,
         
         focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color:Color.fromARGB(255, 13, 167, 213)  ,
            width: 2
          )
         ) ,
          enabledBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color:const Color.fromARGB(255, 109, 138, 153),
            width: 2
          )
         ) ,
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                ), // Icon
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ), // Container
        ), // InputDecoration
      ), // TextFormField
    ); // Container
  }
}
