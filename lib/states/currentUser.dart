import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier{
  String _uid;
  String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp()async{
    String retVal ='error';

    try{
      FirebaseUser _firebaseUser = await _auth.currentUser();
      _uid = _firebaseUser.uid;
      _email= _firebaseUser.email;
      retVal = 'Success';
    }catch(e)
    {
      print(e);
    }

    return retVal;
  }

  Future<bool> signUpUser(String email,String password) async{
    bool retVal = false;
    try{
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if(_authResult.user!= null)
        {
          retVal=true;
        }
    }
    catch(e)
    {
      print(e);
    }

    return retVal;
  }

  Future<bool> loginUser(String email,String password) async{
    bool retVal = false;
    try{
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if(_authResult.user!= null)
      {
        _uid=_authResult.user.uid;
        _email=_authResult.user.email;
        retVal=true;
      }
    }
    catch(e)
    {
      print(e);
    }

    return retVal;
  }
  Future<String> logout()async{
    String retVal ='error';

    try{
      await _auth.signOut();
      _uid = null;
      _email= null;
      retVal = 'Success';
    }catch(e)
    {
      print(e);
    }

    return retVal;
  }
}