import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_wallet/util/file_path.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/double_back_to_close_app.dart';
import '../../widgets/annotated_region.dart';
import '../../widgets/current_month_status.dart';
import '../../widgets/txn_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            margin: const EdgeInsets.all(16),
            backgroundColor: Theme.of(context).primaryColor,
            content: const Text('Tap back again to leave'),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _contentHeader(),

                  const SizedBox(height: 16),

                  _userHeader(context),

                  const SizedBox(height: 16),
                  const CurrentMonthStatus(data: {'a': 34}),
                  const SizedBox(height: 16),

                  _contentOverView(),

                  const SizedBox(height: 30),

                  //--SHOTCUT

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Navigation',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SvgPicture.asset(
                        scan,
                        // color: Theme.of(context).iconTheme.color,
                        width: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _navigation(),

                  const SizedBox(
                    height: 16,
                  ),

                  //--SERVICES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Shotcuts',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SvgPicture.asset(
                        filter,
                        width: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _shotcut1(context),

                  const SizedBox(
                    height: 16,
                  ),

                  //--UTILITIES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Utilities',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SvgPicture.asset(
                        filter,
                        // color: Theme.of(context).iconTheme.color,
                        width: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _utilities(context),

                  const SizedBox(
                    height: 16,
                  ),

                  //--RECENT

                  _recentTransactions(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _recentTransactions(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recent Activities',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SvgPicture.asset(
                filter,
                // color: Theme.of(context).iconTheme.color,
                width: 18,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return txnItem(context);
            },
          ),
        ],
      ),
    );
  }

  Row _userHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              const Icon(Iconsax.user_tag),
              const SizedBox(
                width: 16,
              ),
              Text(
                'Hi, Subha',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Iconsax.notification),
          tooltip: "Notifications",
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Iconsax.math),
          tooltip: "Calculator",
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Iconsax.cpu_setting),
          tooltip: "Settings",
          onPressed: () {},
        )
      ],
    );
  }

  Widget _contentHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SvgPicture.asset(
              logo,
              width: 34,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              'eWalle',
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
        InkWell(
          onTap: () {
            setState(() {
              // print('call');
              // xOffset = 240;
              // yOffset = 180;
              // scaleFactor = 0.7;
              // isDrawerOpen = true;
            });
          },
          child: SvgPicture.asset(
            menu,
            width: 16,
            // color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    );
  }

  Widget _contentOverView() {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
        // color: const Color(0xffF1F3F6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '20,600',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Expenditure',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Center(
                  child: Icon(
                    Iconsax.settings,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
              // const Icon(
              //   Iconsax.arrow_2,
              //   size: 30,
              // ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '20,600',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Income',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "20% SPENDINGS",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "80% SAVINGS",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 10,
                child: Row(
                  children: [
                    Flexible(
                      flex: 30,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 70,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).dialogBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navigation() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 100,
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              top: 28,
              bottom: 28,
            ),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Iconsax.add,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .pushNamed('ENTRY', extra: {'entryType': 'EXPENSES-ENTRY'});
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(16),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffD8D9E4))),
                    child: CircleAvatar(
                      radius: 24.0,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      child: Icon(
                        Iconsax.direct_send5,
                        color: Theme.of(context).primaryColor,
                        size: 34,
                      ),
                    ),
                  ),
                  Text(
                    'Payment',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .pushNamed('ENTRY', extra: {'entryType': 'INCOME-ENTRY'});
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(16),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xffD8D9E4))),
                    child: CircleAvatar(
                      radius: 24.0,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      child: Icon(
                        Iconsax.direct_inbox5,
                        color: Theme.of(context).primaryColorDark,
                        size: 34,
                      ),
                    ),
                  ),
                  Text(
                    'Receive',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(16),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffD8D9E4))),
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: Icon(
                      Iconsax.repeat_circle5,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      size: 34,
                    ),
                  ),
                ),
                Text(
                  'Withdrawl',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(16),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffD8D9E4))),
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: Icon(
                      Iconsax.repeat_circle5,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 34,
                    ),
                  ),
                ),
                Text(
                  'Deposit',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _shotcut1(BuildContext context) {
    List<ModelServices> listServices = [];
    listServices.add(ModelServices(title: "Statement", img: mobile));
    listServices.add(ModelServices(title: "Accounts", img: electricity));
    listServices.add(ModelServices(title: "Reports", img: send));
    listServices.add(ModelServices(title: "Settings", img: recive));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed('STATEMENT');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                // child: SvgPicture.asset(
                //   listServices[0].img,
                // ),
                child: const Icon(Iconsax.wallet_money),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Statement",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed('ACCOUNTS', extra: {
              'parent': 0,
              'title': "ACCOUNT GROUP",
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: const Icon(Iconsax.autobrightness),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Accounts",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed('REPORTS');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                // child: SvgPicture.asset(
                //   listServices[2].img,
                //   // color: Theme.of(context).iconTheme.color,
                // ),
                child: const Icon(Iconsax.book_square),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Reports",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed('SETTINGS');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                // child: SvgPicture.asset(
                //   listServices[3].img,
                //   // color: Theme.of(context).iconTheme.color,
                // ),
                child: const Icon(
                  Iconsax.cpu,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Settings",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _utilities(BuildContext context) {
    List<ModelServices> listServices = [];

    listServices.add(ModelServices(title: "Cash Book", img: send));
    listServices.add(ModelServices(title: "Bank Book", img: recive));
    listServices.add(ModelServices(title: "Statement", img: mobile));
    listServices.add(ModelServices(title: "Accounts", img: electricity));

    return GestureDetector(
      onTap: () {
        // print('${value.title}');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: SvgPicture.asset(
                  listServices[0].img,
                  // color: Theme.of(context).iconTheme.color,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                listServices[0].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: SvgPicture.asset(
                  listServices[1].img,
                  // color: Theme.of(context).iconTheme.color,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                listServices[1].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: SvgPicture.asset(
                  listServices[2].img,
                  // color: Theme.of(context).iconTheme.color,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                listServices[2].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: SvgPicture.asset(
                  listServices[3].img,
                  // color: Theme.of(context).iconTheme.color,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                listServices[3].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ],
      ),
    );
    // return Container(
    //   color: Colors.green,
    //   width: double.infinity,
    //   height: 100,
    //   child: GridView.count(
    //     crossAxisCount: 4,
    //     childAspectRatio: MediaQuery.of(context).size.width /
    //         (MediaQuery.of(context).size.height / 0.1),
    //     children: listServices.map((value) {
    //       return GestureDetector(
    //         onTap: () {
    //           // print('${value.title}');
    //         },
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             Container(
    //               width: 50,
    //               height: 50,
    //               padding: const EdgeInsets.all(12),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(8),
    //                 color: Theme.of(context).cardColor,
    //               ),
    //               child: SvgPicture.asset(
    //                 value.img,
    //                 color: Theme.of(context).iconTheme.color,
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 8,
    //             ),
    //             Text(
    //               value.title,
    //               textAlign: TextAlign.center,
    //               style: Theme.of(context).textTheme.bodyLarge,
    //             ),
    //             const SizedBox(
    //               height: 14,
    //             ),
    //           ],
    //         ),
    //       );
    //     }).toList(),
    //   ),
    // );
  }
}

class ModelServices {
  String title, img;
  ModelServices({required this.title, required this.img});
}