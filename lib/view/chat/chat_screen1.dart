import 'package:bubbly/api/api_service.dart';
import 'package:bubbly/utils/const.dart';
import 'package:bubbly/utils/myloading/my_loading.dart';
import 'package:bubbly/utils/session_manager.dart';
import 'package:bubbly/view/chat/chat_list_page.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatScreen extends StatefulWidget {
  final String userId;
  final String accessToken;
  final StreamChatClient chatClient;
  const ChatScreen(this.chatClient, this.userId, this.accessToken);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void getUserProfile() {
    if (SessionManager.userId != null && SessionManager.userId != -1) {
      ApiService().getProfile(widget.userId).then((value) async {
        if (value.status == 200) {
          if (widget.userId == SessionManager.userId.toString()) {
            Provider.of<MyLoading>(context, listen: false).setUser(value);
          }

          // await client.connectUser(
          //   User(
          //     id: widget.userId,
          //     name: value.data.userName,
          //     image: Const.itemBaseUrl + value.data.userProfile,
          //   ),
          //   // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.e_Ok6ihr_vsvFJVo0dNgxR0ipyBJLzHh0qVngjPuTPo"
          //   widget.accessToken,
          // );

          // channel = client.channel('messaging', id: 'poshtok');

          // await channel.watch();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: StreamChat(
        client: widget.chatClient,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chat',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: fNSfUiBold,
                        fontSize: 20,
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Image.asset(
                    //         "icons/Add User.png",
                    //         width: 24,
                    //         color: Colors.black,
                    //       ),
                    //       padding: const EdgeInsets.all(0),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Image.asset(
                    //         "icons/More Circle.png",
                    //         width: 24,
                    //         color: Colors.black,
                    //       ),
                    //       padding: const EdgeInsets.all(0),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: ChatListPage(chatClient: widget.chatClient),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
