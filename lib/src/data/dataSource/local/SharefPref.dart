import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharefPref{
  //guardar informacion 
  Future<void> save (String key , dynamic value )async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  //metodo para devolver informacion 
  Future<dynamic> read(String  key )async{
    final prefs = await SharedPreferences.getInstance();  
    if(prefs.getString(key) !=  null){
      return  json.decode(prefs.getString(key)!);
    }

    return null;
  }

  //devolver boolemam

  Future<bool> remove (String key )async{
    final prefs = await SharedPreferences.getInstance();
    return  prefs.remove( key);
  }

    Future<bool> contains (String key )async{
    final prefs = await SharedPreferences.getInstance();
    return  prefs.containsKey( key);

  }

}