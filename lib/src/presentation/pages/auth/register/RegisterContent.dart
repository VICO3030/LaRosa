import 'package:flutter/material.dart';
import 'package:indriver_rosa/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_rosa/src/presentation/widgets/DefaultTextField.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold para el contexto Material
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 27, 30, 39),
                  Color.fromARGB(255, 117, 118, 124),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotated(context),
                SizedBox(height: 100),
                _textRegisterRotated(),
                SizedBox(height: MediaQuery.of(context).size.height *0.25),
              ],
            ),
          ),
            // Envuelve el contenido para que sea desplazable
             Container(
              
              margin: EdgeInsets.only(left: 50,bottom: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color.fromARGB(255, 255, 252, 252),
                    const Color.fromARGB(255, 156, 154, 154),
                  ],
                ),
              ),
              child: Column(
                children: [
                  _imageBanner(),
                  DefaultTextField(
                    text: 'Nombre',
                    icon: Icons.person_outline,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 5),
                  ),
                  DefaultTextField(
                    text: 'Apellido',
                    icon: Icons.person_2_outlined,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  ),
                  DefaultTextField(
                    text: 'Email',
                    icon: Icons.email_outlined,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  ),
                  DefaultTextField(
                    text: 'Teléfono',
                    icon: Icons.phone_outlined,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  ),
                  DefaultTextField(
                    text: 'Password',
                    icon: Icons.lock_clock_outlined,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  ),
                  DefaultTextField(
                    text: 'Confirmar Password',
                    icon: Icons.lock_clock_outlined,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  ),
                  DefaultButton(
                    text: 'Registrar', 
                    onPressed: (){},
                    margin: EdgeInsets.only(top : 30 ,left:60,right: 60),),
                     SizedBox(height: 10),
                    
                    _NotienesCuenta(),
                    SizedBox(height: 10),
                    _textDontHaveAccount(context),


                ],
              ),
            ),
          
        ],
      ),
    );
  }

Widget  _textDontHaveAccount(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ya tienes una Cuenta?',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 17,
            ),
          ),
          SizedBox(width: 15),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'login');
            },
            child: Text(
              'Iniciar Sesion',
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

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/loguito.png',
        width: 300,
        height: 300,
      ),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, 'login');
        },
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Registro',
        style: TextStyle(
          fontSize: 27,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
