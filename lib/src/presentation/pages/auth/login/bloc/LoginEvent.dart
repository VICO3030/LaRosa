import 'package:indriver_rosa/src/domain/models/AuthResponse.dart';
import 'package:indriver_rosa/src/domain/repository/AuthRepository.dart';
import 'package:indriver_rosa/src/presentation/utils/BlocFormItem.dart';

abstract class  LoginEvent{}
class LoginInitEvent extends  LoginEvent{}


class  EmailChanged extends LoginEvent { 
    final BlocFormItem email; 
     EmailChanged ({required  this.email});
}
 
class  PasswordChanged extends LoginEvent { 
    final BlocFormItem password; 
     PasswordChanged ({required  this.password});
}

class PhoneChanged extends LoginEvent { 
    final BlocFormItem phone; 
     PhoneChanged ({required  this.phone});
}



class  TelefonoChanged extends LoginEvent { 
    final BlocFormItem phone; 
     TelefonoChanged ({required  this.phone});
}

class SaveUserSession  extends LoginEvent{
  final AuthResponse  authResponse;
  SaveUserSession({required  this.authResponse});
  
}

class FormSubmit extends LoginEvent {} 

