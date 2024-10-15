import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 0, 0, 0),
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //horizontal
            mainAxisAlignment: MainAxisAlignment.center,  //vertical
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                    color: const Color.fromARGB(211, 200, 200, 24),
                    fontSize: 27,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 60),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  'Registrarse',
                  style: TextStyle(
                    color: const Color.fromARGB(211, 200, 200, 24),
                    fontSize: 24
                  ),
                ),
              ),
              SizedBox(height: 90),
            ],
          ),
        ),
        Container(
          //height: MediaQuery.of(context).size.height*0.93,
          //width: MediaQuery.of(context).size.width*0.8,
          margin: EdgeInsets.only(left: 60),
          decoration: BoxDecoration(
            color: const Color.fromARGB(192, 178, 41, 41),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(35), bottomLeft: Radius.circular(35))
          ),
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //EL WELCOME DE LA PANTALLA
                SizedBox(height: 70),
                  //EL BACK.... DE LA PANTALLA
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
                //EL LOG IN DE LA PANTALLA
                Text(
                  'Iniciando sesion con:',
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color.fromARGB(211, 200, 200, 24),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ) 
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: InputBorder.none,
                        prefixIcon: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.email_outlined
                              ),
                              Container(
                                height: 20,
                                width: 1,
                                color: Colors.black,
                              )
                            ]
                          ),
                        )
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 252, 252),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ) 
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Contraseña'),
                        border: InputBorder.none,
                        prefixIcon: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.lock_outline
                              ),
                              Container(
                                height: 20,
                                width: 1,
                                color: Colors.black,
                              )
                            ]
                          ),
                        )
                      ),
                    ),
                  ),
                  //BOTON DE INICIAR SESION
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0)
                      ),
                      child: Text(
                        'Iniciar Sesion',
                        style: TextStyle(
                          color: const Color.fromARGB(211, 200, 200, 24),
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Si no tienes cuenta',
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: 17
                        ),
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Registrate',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}