import 'package:flutter/material.dart';
import 'package:my_chat/screens/chat/chat_screen.dart';
import 'package:my_chat/utils/navigation/custom_navigation.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                CustomNavigation.nextPage(context, const ChatScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  title: const Text(
                    "Kamal Bandara",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "this is new message",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                  leading: const CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        "https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/short/linkedin-profile-picture-maker/dummy_image/thumb/004.webp"),
                  ),
                  trailing: const Text("18:55"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}