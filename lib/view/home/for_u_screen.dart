import 'package:bubbly/api/api_service.dart';
import 'package:bubbly/modal/uservideo/user_video.dart';
import 'package:bubbly/utils/const.dart';
import 'package:bubbly/utils/session_manager.dart';
import 'package:bubbly/view/video/item_video.dart';
import 'package:flutter/material.dart';

class ForYouScreen extends StatefulWidget {
  @override
  _ForYouScreenState createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  List mList = List<Widget>.generate(0, (index) {
    return ItemVideo(null);
  });

  int start = 0;
  int limit = 10;

  @override
  void initState() {
    getAllData();
    // callApiForYou();
    super.initState();
  }

  getAllData() async {
    setState(() {
      isLoading = false;
    });
    await ApiService()
      .getPostList(start.toString(), limit.toString(),
        SessionManager.userId.toString(), Const.related).then(
      (value) {
        if (value != null && value.data != null && value.data.isNotEmpty) {
          if (mList.isEmpty) {
            mList = List<Widget>.generate(
              value.data.length,
              (index) {
                return ItemVideo(value.data[index]);
              },
            );
            setState(() {});
          } else {
            for (Data data in value.data) {
              mList.add(ItemVideo(data));
            }
          }
          start += 10;
        }
      },
    );
    setState(() {
      isLoading = true;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    PageController pageController = PageController();

    return isLoading
    ? PageView(
      physics: ClampingScrollPhysics(),
      controller: pageController,
      pageSnapping: true,
      onPageChanged: (value) {
        if (value == mList.length - 1) {
          getAllData();
        }
      },
      scrollDirection: Axis.vertical,
      children: mList
    )
    : SizedBox(
      height: MediaQuery.of(context).size.height * .9,
      child: const Center(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // void callApiForYou() {
  //   ApiService()
  //       .getPostList(start.toString(), limit.toString(),
  //           SessionManager.userId.toString(), Const.related)
  //       .then(
  //     (value) {
  //       if (value != null && value.data != null && value.data.isNotEmpty) {
  //         if (mList.isEmpty) {
  //           mList = List<Widget>.generate(
  //             value.data.length,
  //             (index) {
  //               return ItemVideo(value.data[index]);
  //             },
  //           );
  //           setState(() {});
  //         } else {
  //           for (Data data in value.data) {
  //             mList.add(ItemVideo(data));
  //           }
  //         }
  //         start += 10;
  //       }
  //     },
  //   );
  // }
}
