import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';

import 'package:intl/intl.dart';

import '../../widgets/annotated_region.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SplashScreen> {
  static DateTime now = DateTime.now();
  String formattedTime = DateFormat.jm().format(now);
  String formattedDate = DateFormat('MMM d, yyyy | EEEEEE').format(now);

  @override
  Widget build(BuildContext context) {
    return const AnnotedAppRegion(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // _topContent(),
                // _centerContent(),
                // _bottomContent()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 18.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  formattedTime,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                // const SizedBox(
                //   width: 30.0,
                // ),
                // SvgPicture.asset(cloud),
                // const SizedBox(
                //   width: 8,
                // ),
                // Text(
                //   '34° C',
                //   style: Theme.of(context).textTheme.titleMedium,
                // ),
              ],
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              formattedDate,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ],
    );
  }

  Widget _centerContent() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox.square(
            dimension: 80,
            child: SvgPicture.asset("assets/svg/logo.svg"),
          ),
          Text(
            'Smart Money Manager',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          UIHelper.verticalSpaceSmall(),
          const SizedBox(
            width: 100,
            height: 4,
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }

  // Widget _bottomContent() {
  //   return Column(
  //     children: <Widget>[
  //       MaterialButton(
  //         elevation: 0,
  //         // color: const Color(0xFFFFAC30),
  //         // height: 50.h,
  //         // minWidth: 200.w,
  //         // shape: RoundedRectangleBorder(
  //         //     borderRadius: BorderRadius.circular(12.sp)),
  //         onPressed: () {
  //           // Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(
  //           //     builder: (context) => const DrawerPage(),
  //           //   ),
  //           // );
  //         },
  //         // child: Text(
  //         //   'Sign in',
  //         //   style: Theme.of(context).textTheme.button,
  //         // ),
  //       ),
  //       // UIHelper.verticalSpaceMedium(),
  //       // Text(
  //       //   'Create an Account',
  //       //   style: Theme.of(context).textTheme.bodyText2,
  //       // )
  //     ],
  //   );
  // }
}
