import 'package:bubbly/utils/colors.dart';
import 'package:bubbly/view/chat/user_chat.dart';
import 'package:flutter/material.dart';

import '../../utils/const.dart';

class Chat extends StatelessWidget {
  const Chat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    color: Colors.white,
                    fontFamily: fNSfUiBold,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "icons/Add User.png",
                        width: 24,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "icons/More Circle.png",
                        width: 24,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15),
          //   child: TextField(
          //     onChange: (text) {},
          //     hintText: "Search",
          //     prefixIcon: Padding(
          //       padding: const EdgeInsets.all(15),
          //       child: Image.asset(
          //         "icons/Search.png",
          //         width: 16,
          //         color: HexColor("#D8D8D8"),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView(
              children: [
                ...List.filled(10, 1).map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserChat(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: colorIcon,
                      ),
                      title: Text(
                        "user.name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: colorPink,
                        ),
                      ),
                      subtitle: Text(
                        "message goes here",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                        // weight: FontWeight.bold,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "yesterday",
                            style: TextStyle(
                              fontSize: 12,
                              color: colorPink,
                            ),
                            // weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
