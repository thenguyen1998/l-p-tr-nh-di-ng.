import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/profile.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';

class ProfileViewModel with ChangeNotifier{
  int static = 0; //
  int modifile = 0;
  int updatedavatar = 0;

  void updatescreen(){
    notifyListeners();
  }

  void setUpdateavatar() {
    updatedavatar = 1;
    notifyListeners();
  }

  Future <void> uploadAvatar(XFile image) async{
    static = 1;
    notifyListeners();
    await UserRepository().uploadAvatar(image);
    var user = await UserRepository().getUserInfo();
    Profile().user = User.fromUser(user);
    updatedavatar = 0;
    static = 0;
    notifyListeners();
  }

  void displaySpinner() {
    static = 1;
    notifyListeners();
  }

  void hideSpinner() {
    static = 0;
    notifyListeners();
  }

  void setModifiled() {
    if(modifile == 0)
    {
      modifile = 1;
      notifyListeners();
    }
  }

  Future <void> updateProfile() async{
    static = 1;
    notifyListeners();
    await UserRepository().updateProfile();
    static = 0;
    modifile = 0;
    notifyListeners();
  }
}