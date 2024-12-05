import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indriver_rosa/src/domain/utils/Resource.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indriver_rosa/src/presentation/utils/BlocFormItem.dart';

class RegisterBloc extends  Bloc<RegisterEvent , RegisterState> {

  AuthUseCases authUseCases;
  final formKey=  GlobalKey<FormState>();

  RegisterBloc(this.authUseCases) :  super(RegisterState()){
    on<RegisterInitEvent>((event,  emit) {
        emit(state.copyWith(

            formKey: formKey

        ));
    });

    on<NameChanged>((event, emit){
      emit(state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isEmpty? 'Ingrese el nombre' :  null
        ),
        formKey: formKey
      ));
    });


    on<LastnameChanged>((event, emit){
      emit(state.copyWith(
        lastname: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isEmpty? 'Ingrese el apellido' :  null
        ),
        formKey: formKey
      ));
    });

        on<EmailChanged>((event, emit){
      emit(state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isEmpty? 'Ingrese el email' :  null
        ),
        formKey: formKey
      ));
    });


      on<PhoneChanged>((event, emit){
      emit(state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isEmpty? 'Ingrese el phone' :  null
        ),
        formKey: formKey
      ));
    });

    on<PasswordChanged>((event, emit){
      emit(state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isEmpty? 'Ingrese el password' 
          :event.password.value.length < 6 ? 'Mas de 6 caracteres' : null
        ),
        formKey: formKey
      ));
    });


      on<ConfirmPassword>((event, emit){
      emit(state.copyWith(
        confirmPassword: BlocFormItem(
          value: event.confirmPassword.value,
          error: event.confirmPassword.value.isEmpty? 'Confirma el Password' 
          :event.confirmPassword.value.length < 6 ? 'Mas de 6 caracteres' 
          :event.confirmPassword.value != state.password.value ? 
          'Las contrasenias no coinciden' : null
          
        ),
        formKey: formKey
      ));
    });



    on<FormSubmit>((event , emit)async{
      print('Name:  ${state.name.value}');
      print('LastName:  ${state.lastname.value}');
      print('Email:  ${state.email.value}');
      print('Phone:  ${state.phone.value}');
      print('Password:  ${state.password.value}');
      print('ConfirmPassword:  ${state.confirmPassword.value}');
      emit(
        state.copyWith(
          response: Loading(),
          formKey: formKey
        )
      );
      Resource response = await  authUseCases.register.run( state.toUser());
       emit(
        state.copyWith(
          response: response,
          formKey: formKey
        )
      );

    });


    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });
    
    
    
    








  }


}