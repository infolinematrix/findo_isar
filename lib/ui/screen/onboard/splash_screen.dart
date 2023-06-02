import 'package:flutter/material.dart';
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
    return AnnotedAppRegion(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _topContent(),
                _centerContent(),
                _bottomContent()
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
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "assets/svg/icon.png",
              height: 60.0,
              width: 60.0,
            ),
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

  Widget _bottomContent() {
    return Column(
      children: <Widget>[
        Text(
          'Spent * Save * Budget',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).disabledColor),
        )
      ],
    );
  }
}
