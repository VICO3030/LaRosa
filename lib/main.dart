import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_rosa/blocProviders.dart';
import 'package:indriver_rosa/injection.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/register/RegisterPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // CLASE PRINCIPAL
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        //para iniciar el principal ruta que va abrir
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => Loginpage(),
          'register': (BuildContext context) => RegisterPage(),
        },
      ),
    );
  }
}

// ignore_for_file: avoid_print

