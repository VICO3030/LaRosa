import 'package:http/http.dart' as http;
import 'package:indriver_rosa/src/data/api/ApiConfig.dart';
import 'dart:convert';

import 'package:indriver_rosa/src/domain/models/AuthResponse.dart';
import 'package:indriver_rosa/src/domain/models/user.dart';
import 'package:indriver_rosa/src/domain/utils/LisToString.dart';
import 'package:indriver_rosa/src/domain/utils/Resource.dart';
class  Authservice {

  Future<Resource<AuthResponse>> login (String email ,String password) async{
      try{
        Uri url  = Uri.http(Apiconfig.API_PROJECT, '/auth/login');
        Map<String ,String> headers= {'Content-Type':'application/json'};
        String  body =json.encode({
          'email':email,
          'password':password
        });
        final response = await http.post(url ,headers:headers,body: body);
        final data = json.decode(response.body);
        if (response.statusCode == 200  || response.statusCode==201){
             AuthResponse authresponse=  AuthResponse.fromJson(data);
              print('Data Remote: ${authresponse.toJson()}');
           print('Token: ${authresponse.token}');

           return Success(authresponse) ;
        }
        else{
          return ErrorData(listToString(data['message']));
        }
     

      }
      catch(e){
        print('Error: $e');
        return ErrorData(e.toString());
      }
  }

 Future<Resource<AuthResponse>> register (User user ) async{
             try{
        Uri url  = Uri.http(Apiconfig.API_PROJECT, '/auth/register');
        Map<String ,String> headers= {'Content-Type':'application/json'};

        String  body =json.encode(user);

        final response = await http.post(url ,headers:headers,body: body);
        final data = json.decode(response.body);

        if (response.statusCode == 200  || response.statusCode==201){
             AuthResponse authresponse=  AuthResponse.fromJson(data);
              print('Data Remote: ${authresponse.toJson()}');
           print('Token: ${authresponse.token}');
           print("ENTRO A LA BASE DE DATOS XD");

           return Success(authresponse) ;
        }
        else{
          return ErrorData(listToString(data['message']));
        }
     

      }
      catch(e){
        print('Error: $e');
        return ErrorData(e.toString());
      }
 }
 }