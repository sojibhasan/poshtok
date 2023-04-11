import 'package:bubbly/utils/session_manager.dart';
import 'package:bubbly/view/profile/proifle_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPage extends StatelessWidget {
  final StreamChatClient client;
  const ChannelPage({Key key, this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var channel = StreamChannel.of(context).channel;

    return StreamChat(
      client: client,
      child: Scaffold(
        appBar: StreamChannelHeader(
          onImageTap: () {
            print(channel.isDistinct);
            if (channel.memberCount == 2) {
              print(true.toString());

              final otherUser = channel.state.members.firstWhereOrNull(
                (element) =>
                    element.user.id != SessionManager.userId.toString(),
              );
              if (otherUser != null) {
                print(otherUser.userId);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(1, otherUser.user.id),
                  ),
                );

                // if (pop == true) {
                //   Navigator.pop(context);
                // }
              }
            }
          },
        ),
        backgroundColor: Color(0xFFf6f6f6),
        body: Column(
          children: [
            Expanded(
              child: StreamMessageListView(),
            ),
            StreamMessageInput(),
          ],
        ),
      ),
    );
  }
}
