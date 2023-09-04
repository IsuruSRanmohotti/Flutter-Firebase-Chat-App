import 'package:flutter/material.dart';
import 'package:my_chat/screens/chat/chat_screen.dart';
import 'package:my_chat/screens/home/users/users.dart';
import 'package:my_chat/utils/navigation/custom_navigation.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "My Chat",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      "https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/short/linkedin-profile-picture-maker/dummy_image/thumb/004.webp"),
                )
              ],
            ),
            const Divider(),
            Expanded(
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
            )
          ],
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
