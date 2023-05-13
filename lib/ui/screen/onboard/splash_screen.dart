import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0XFFf5f7fe),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0XFFecebff), Color(0XFFc9d2ff)],
            ),
          ),
          child: Container(
            // height: 50,
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("REGISTER"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("LOGIN"),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Expanded(
              //   flex: 1,
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: SvgPicture.asset(mainBanner),
              //   ),
              // ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(18),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _topContent() {
    return Column(
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
            // SizedBox(
            //   width: 30.0.w,
            // ),
            // SvgPicture.asset(cloud),
            // const SizedBox(
            //   width: 8,
            // ),
            // Text(
            //   '34° C',
            //   style: Theme.of(context).textTheme.subtitle1,
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
    );
  }

  Widget _centerContent() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'A Marketplace of Millions of Buyers.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'Grow Your Business with Us',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Widget _bottomContent() {
    return Column(
      children: <Widget>[
        MaterialButton(
          elevation: 0,
          // color: const Color(0xFFFFAC30),
          // height: 50.h,
          // minWidth: 200.w,
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(12.sp)),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const DrawerPage(),
            //   ),
            // );
          },
          // child: Text(
          //   'Sign in',
          //   style: Theme.of(context).textTheme.button,
          // ),
        ),
        // UIHelper.verticalSpaceMedium(),
        // Text(
        //   'Create an Account',
        //   style: Theme.of(context).textTheme.bodyText2,
        // )
      ],
    );
  }
}
