import 'package:flutter/material.dart';
import 'package:my_chat/controllers/users_controller.dart';
import 'package:my_chat/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  UsersController usersController = UsersController();

  Future<void> updateOnlineStatus(bool isOnline, BuildContext context) async {
    String uid = Provider.of<AuthUProvider>(context, listen: false).user!.uid;
    usersController.updateOnlineStatus(isOnline, uid);
  }
}
