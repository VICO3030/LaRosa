import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_rosa/src/domain/models/AuthResponse.dart';
import 'package:indriver_rosa/src/domain/utils/Resource.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/bloc/LoginState.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(200, 143, 243, 147),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
            final response  =state.response;
            if(response is ErrorData){
              Fluttertoast.showToast(msg: '${response.message}',toastLength: Toast.LENGTH_SHORT);
                print('Error data :${response.message}');
            }
            else if(response is Success){
              print('Sucess Data: ${response.data}');
              final atuhresponse = response.data as AuthResponse;
              context.read<LoginBloc>().add(SaveUserSession(authResponse:atuhresponse));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final response=  state.response;
              if(response is Loading){
                return Stack(
                 
                  children: [
                     LoginContent(state),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }
              return LoginContent(state);
            },
          ),
        ));
  }
}
