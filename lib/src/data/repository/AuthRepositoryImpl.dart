import 'package:indriver_rosa/src/data/dataSource/local/SharefPref.dart';
import 'package:indriver_rosa/src/data/dataSource/remote/services/AuthService.dart';
import 'package:indriver_rosa/src/domain/models/AuthResponse.dart';
import 'package:indriver_rosa/src/domain/models/user.dart';
import 'package:indriver_rosa/src/domain/repository/AuthRepository.dart';
import 'package:indriver_rosa/src/domain/utils/Resource.dart';


class Authrepositoryimpl  implements  AuthRepository {

  Authservice authservice ;
  SharefPref sharefPref;
  Authrepositoryimpl(this.authservice, this.sharefPref); //injeccion de dependencias 

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {

      return authservice.login(email, password);
  }
  @override 
    Future<Resource<AuthResponse>> register (User user )async {
      return authservice.register(  user);

  }
  //alamcenar informacion session
  @override
  Future<AuthResponse?> getUserSession()async {
    final  data =  await  sharefPref.read('user');
    if(data!=null){
      AuthResponse  authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;

  }
  
  @override
  Future<void> saveUserSession(AuthResponse authResponse)async {
    sharefPref.save('user', authResponse.toJson());
  }
}
  
