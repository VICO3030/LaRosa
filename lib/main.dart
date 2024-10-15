import 'package:flutter/material.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/register/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // CLASE PRINCIPAL
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      //para iniciar el principal ruta que va abrir
      initialRoute: 'login',
      routes: {
        'login':(BuildContext  context) => Loginpage(),
        'register':(BuildContext  context) => RegisterPage(),

      },
      
    );
  }
}
