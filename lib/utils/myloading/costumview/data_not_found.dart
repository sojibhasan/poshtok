import 'package:bubbly/utils/assert_image.dart';
import 'package:bubbly/utils/const.dart';
import 'package:flutter/material.dart';

class DataNotFound extends StatelessWidget {
  final bool loading;
  const DataNotFound({this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 55,
              child: Image(
                image: AssetImage(icLogo),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              loading ? 'Loading...' : 'Data Not Found...!',
              style: TextStyle(
                fontSize: 16,
                fontFamily: fNSfUiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
