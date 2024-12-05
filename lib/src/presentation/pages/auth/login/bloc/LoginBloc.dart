import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_rosa/src/domain/models/AuthResponse.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/AuthUseCases.dart';

import 'package:indriver_rosa/src/domain/utils/Resource.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:indriver_rosa/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends  Bloc<LoginEvent, LoginState> { 
  AuthUseCases authUseCases;
  final formKey  = GlobalKey<FormState>();
 // Authservice authservice =  Authservice();   mala practica 
 // AuthUseCases authUseCases = AuthUseCases(login:login);
 //LoginUseCase loginUseCase =  LoginUseCase();
   
  


  LoginBloc(this.authUseCases) :  super (LoginState()) {

    on<LoginInitEvent>((event ,emit )async{
      AuthResponse? authResponse =  await authUseCases.getUserSession.run();
      print('Auth response  Session :${authResponse?.toJson()}');
      emit(state.copyWith(formKey: formKey));
    });
    
    on<EmailChanged>((event , emit ){
      //event.email  LO QUE EL USUARIO ESTA ESCRIBIENDO
      emit(
        state.copyWith(
          email:BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty?  'Ingresa el email' : null
          ),
          formKey: formKey
        )  

      );
    });

    on<SaveUserSession>((event,emit)async{
      await authUseCases.saveUserSession.run(event.authResponse);
      

    });

    on<PasswordChanged>((event ,emit ){
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isEmpty? 'Ingresa el password ' 
            :event.password.value.length <6 ? 'Minimo 6 caracteres' : null
          ),
          formKey: formKey

        )

      );
    });

    on<FormSubmit>((event ,emit )async{
      print("email: ${state.email.value}" );
      print("password: ${state.password.value}" );
      emit(
        state.copyWith(
          response: Loading(),
          formKey: formKey
        )
      );
      //await  
      //await Future .delayed(Duration(seconds: 3), () async{
      Resource response = await  authUseCases.login.run(state.email.value,state.password.value);
      emit(
        state.copyWith(
          response: response,
          formKey: formKey
        )
      );
    });
  
}
}