import 'package:flutter/material.dart';
import 'package:indriver_rosa/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_rosa/src/presentation/widgets/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold( // Aseguramos que haya un Scaffold que proporcione un contexto de Material
    body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 0, 0, 0),
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textLoginRotated(),
              SizedBox(height: 60),
              _textRegisterRotated(context),
              SizedBox(height: 90),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(137, 112, 3, 3),
                Color.fromARGB(255, 158, 62, 62),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), 
              bottomLeft: Radius.circular(35)
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70),
                Text(
                  'BIENVENIDOS',
                  style: TextStyle(
                    fontSize: 45,
                    color: const Color.fromARGB(211, 200, 200, 24),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/img/car.png',
                    width: 350,
                    height: 350,
                  ),
                ),
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color.fromARGB(211, 200, 200, 24),
                    fontWeight: FontWeight.bold
                  ),
                ),
                 DefaultTextField
               (
                text: 'Email', 
               icon: Icons.email_outlined,
               margin: EdgeInsets.only(top:20, left: 10 , right: 10)
               
               ),
               DefaultTextField
               (text: 'Constrasania',
                icon: Icons.lock_clock_outlined,
                 margin: EdgeInsets.only(top:25, left: 10 , right: 10),
               
                )
                ,
                Spacer(),
                DefaultButton(
                  text: 'LOGIN',
                  color: const Color.fromARGB(31, 0, 0, 0),
                  textColor: Colors.yellow,
                  onPressed: () {},
                ),
                _NotienesCuenta(),

                SizedBox(height: 30),
                _textDontHaveAccount(context),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _NotienesCuenta(){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 20,
        height: 1,
        color: Colors.white,
        margin: EdgeInsets.only(right: 5),
      ),
      Text(
        'O',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      Container(
        width: 25,
        height: 1,
        color: Colors.white,
        margin: EdgeInsets.only(left: 5),
      ),
    ],
  );
}


  Widget _textLoginRotated (){
    return  RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                    color: const Color.fromARGB(211, 200, 200, 24),
                    fontSize: 27,
                    fontWeight: FontWeight.bold
                  ),
                ),
              );
  }

  Widget _textRegisterRotated(BuildContext context){
    return GestureDetector(
      //METODO ONCLICK
      onTap: (){
        Navigator.pushNamed(context, 'register');
      },


      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Registrarse',
          style: TextStyle(
            color: const Color.fromARGB(211, 200, 200, 24),
            fontSize: 24
          ),
        ),
      ),
    );
}



Widget  _textDontHaveAccount(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Si no tienes cuenta',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 17,
            ),
          ),
          SizedBox(width: 15),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'register');
            },
            child: Text(
              'Regístrate',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
        ],
      );
}
}