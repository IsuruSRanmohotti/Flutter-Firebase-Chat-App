import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_chat/controllers/notification_controller.dart';
import 'package:my_chat/providers/user_provider.dart';
import 'package:my_chat/screens/home/users/users.dart';
import 'package:my_chat/utils/navigation/custom_navigation.dart';
import 'package:provider/provider.dart';

import 'widgets/conversation_list.dart';
import 'widgets/header.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    NotificationController().updateToken();
    NotificationController().handleForeground();
    NotificationController().setupInteractedMessage();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    Logger().f(state);
    if (state == AppLifecycleState.resumed) {
      Provider.of<UserProvider>(context, listen: false)
          .updateOnlineStatus(true, context);
    } else {
      Provider.of<UserProvider>(context, listen: false)
          .updateOnlineStatus(false, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [Header(), ConversationList()],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomNavigation.nextPage(context, const UsersScreen());
        },
        child: const Icon(Icons.people),
      ),
    );
  }
}
