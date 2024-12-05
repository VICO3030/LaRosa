import 'package:indriver_rosa/src/domain/models/user.dart';
import 'package:indriver_rosa/src/domain/repository/AuthRepository.dart';

class  Registerusecase {
  AuthRepository authRepository;
  Registerusecase(this.authRepository);

  run(User user ) => authRepository.register( user);
}