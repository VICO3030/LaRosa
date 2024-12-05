import 'package:indriver_rosa/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/loginUseCase.dart';

class  AuthUseCases {

    LoginUseCase login ;
    Registerusecase register;
    SaveUserSessionUseCase saveUserSession;
    GetUserSessionUseCase getUserSession;

    
    AuthUseCases({
     required  this.login,
     required  this.register,
     required  this.saveUserSession,
     required  this.getUserSession,
    });
}