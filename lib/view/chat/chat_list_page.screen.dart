import 'package:bubbly/utils/myloading/costumview/data_not_found.dart';
import 'package:bubbly/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'channel_page.dart';

class ChatListPage extends StatefulWidget {
  final StreamChatClient chatClient;
  const ChatListPage({Key key, this.chatClient}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  StreamChannelListController _listController;

  @override
  void initState() {
    super.initState();

    _listController = StreamChannelListController(
      client: StreamChat.of(context).client,
      filter: Filter.in_(
        'members',
        [
          StreamChat.of(context).currentUser != null
              ? StreamChat.of(context).currentUser.id
              : SessionManager.userId.toString(),
        ],
      ),
      sort: const [SortOption('last_message_at')],
      limit: 20,
    );
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamChannelListView(
      controller: _listController,
      emptyBuilder: (context) => DataNotFound(),
      loadingBuilder: (context) => DataNotFound(loading: true),
      // itemBuilder: (context, items, index, defaultWidget) {
      //   return defaultWidget.copyWith(
      //     le
      //   );
      // },
      onChannelTap: (channel) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return StreamChannel(
                channel: channel,
                child: ChannelPage(
                  client: widget.chatClient,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
