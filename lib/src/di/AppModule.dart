
import 'package:indriver_rosa/src/data/dataSource/local/SharefPref.dart';
import 'package:indriver_rosa/src/data/dataSource/remote/services/AuthService.dart';
import 'package:indriver_rosa/src/data/repository/AuthRepositoryImpl.dart';
import 'package:indriver_rosa/src/domain/repository/AuthRepository.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/loginUseCase.dart';

import 'package:injectable/injectable.dart';



@module
abstract   class AppModule{

  @injectable
  SharefPref get sharefPref =>SharefPref();

  @injectable
  Authservice get authService  =>Authservice();


  @injectable
  AuthRepository  get authRepository  => Authrepositoryimpl(authService,sharefPref);

  @injectable
  AuthUseCases  get authUseCases  => AuthUseCases(
    login:LoginUseCase(authRepository),
    register: Registerusecase(authRepository),
    saveUserSession: SaveUserSessionUseCase(  authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
     );


}