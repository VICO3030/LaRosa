import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:indriver_rosa/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indriver_rosa/src/presentation/utils/BlocFormItem.dart';
import 'package:indriver_rosa/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_rosa/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {

  RegisterState  state;

   RegisterContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key:state.formKey,
      child: Stack( // Scaffold para el contexto Material
       
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
                child: Stack(
                  children: [
                    _ImageBackground(context),
                    SingleChildScrollView(
                      child: Column( 
                          children: [
                            _imageBanner(),
                                 
                            DefaultTextFieldOutlined(
                              text: 'Nombre',
                              icon: Icons.person_outline,
                              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                              onChanged:(text){
                                context.read<RegisterBloc>().add(NameChanged(name:  BlocFormItem(value: text)));
                              },
                              validator:(value) {
                                return  state.name.error;
                              },
                            ),
                            DefaultTextFieldOutlined(
                              text: 'Apellido',
                              icon: Icons.person_2_outlined,
                              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                              onChanged:(text) {
                                context.read<RegisterBloc>().add(LastnameChanged(lastname:  BlocFormItem(value: text)));
      
                              },
                              validator:(value) {
                                return  state.lastname.error;
                              },
                              
                            ),
                            DefaultTextFieldOutlined(
                              text: 'Email',
                              icon: Icons.email_outlined,
                              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                              onChanged:(text) {
                                context.read<RegisterBloc>().add(EmailChanged(email:  BlocFormItem(value: text)));
                              },
                              validator:(value) {
                                return  state.email.error;
                              },
      
      
                            ),
                            DefaultTextFieldOutlined(
                              text: 'Teléfono',
                              icon: Icons.phone_outlined,
                              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                              onChanged:(text) {
                                context.read<RegisterBloc>().add(PhoneChanged(phone:  BlocFormItem(value: text)));
      
                              },
                              validator:(value) {
                                return  state.phone.error;
                              },
                            ),
                            DefaultTextFieldOutlined(
                              text: 'Password',
                              icon: Icons.lock_clock_outlined,
                              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                              onChanged : (text){
                                     context.read<RegisterBloc>().add(PasswordChanged(password:  BlocFormItem(value: text)));
                              },
                              validator:(value) {
                                return  state.password.error;
                              },
                             
                            ),
                            DefaultTextFieldOutlined(
                              text: 'Confirmar Password',
                              icon: Icons.lock_clock_outlined,
                              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                              onChanged: (text){
                                 context.read<RegisterBloc>().add(ConfirmPassword(confirmPassword:  BlocFormItem(value: text)));
                              },
                                validator:(value) {
                                return  state.confirmPassword.error;
                              },
                             
                            ),
                            DefaultButton(
                              onPressed : () { 
                                if(state.formKey!.currentState!.validate()){
                                    context.read<RegisterBloc>().add(FormSubmit());
                                    context.read<RegisterBloc>().add(FormReset());
                                }
      
                              },
      
      
      
                              text: 'Registrar', 
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
              ),
            //  _ImageBackground(context)
            
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
              Navigator.pop(context);
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


Widget _ImageBackground(BuildContext context){

  return  Container(
    alignment:Alignment.bottomCenter,
    margin: EdgeInsets.only(bottom: 80),
    child: Image.asset('assets/img/destination.png',
    width: MediaQuery.of(context).size.width * 0.6,
    height: MediaQuery.of(context).size.width * 0.6,
    opacity: AlwaysStoppedAnimation(0.2),
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

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/trip.png',
        width: 250,
        height: 250,
      ),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
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
