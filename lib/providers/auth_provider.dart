import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_chat/controllers/auth_controller.dart';
import 'package:my_chat/models/user_model.dart';
import 'package:my_chat/screens/home/conversations/conversation.dart';
import 'package:my_chat/utils/navigation/custom_navigation.dart';

import '../screens/auth/sign_in_page.dart';

class AuthProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  User? _user;
  User? get user => _user;

  Future<void> listenToAuthState(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().e('User is currently signed out!');
        CustomNavigation.nextPage(context, const SignInPage());
      } else {
        Logger().f('User is signed in!');
        _user = user;
        notifyListeners();
        CustomNavigation.nextPage(context, const ConversationScreen());
      }
    });
  }

  Future<void> signInWithGoogle() async {
    final credential = await authController.signInWithGoogle();

    if (credential != null) {
      UserModel user = UserModel(
          name: _user!.displayName!,
          image: _user!.photoURL!,
          isOnline: true,
          lastSeen: DateTime.now().toString(),
          uid: _user!.uid);
      await authController.saveUserData(user);
    }
  }

  Future<void> signOut() async {
    authController.userSignOut();
  }
}
