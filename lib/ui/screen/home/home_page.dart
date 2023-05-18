import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_wallet/models/transactions_model.dart';
import 'package:flutter_wallet/util/file_path.dart';
import 'package:flutter_wallet/util/format_currency.dart';
import 'package:flutter_wallet/util/ui_helpers.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/theme_mode.dart';
import '../../../util/date_utils.dart';
import '../../../util/double_back_to_close_app.dart';
import '../../widgets/annotated_region.dart';
import '../../widgets/pie_chart2.dart';
import '../../widgets/txn_item.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
            child: SingleChildScrollView(
              child: Consumer(
                builder: (context, ref, child) {
                  final homeData = ref.watch(inttHomeProvider);

                  return homeData.when(
                    loading: () => const LinearProgressIndicator(),
                    error: (error, stackTrace) => ErrorWidget(error),
                    data: (data) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _contentHeader(context),

                          UIHelper.verticalSpaceMedium(),
                          _userHeader(context),

                          UIHelper.verticalSpaceMedium(),
                          _currentMonthOverView(
                              context, data.monthIncomeExpenditure),

                          UIHelper.verticalSpaceMedium(),
                          _todaysSummary(context, data.monthIncomeExpenditure),

                          UIHelper.verticalSpaceLarge(),
                          _navigation(context),

                          UIHelper.verticalSpaceMedium(),
                          //--NAVIGATION
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Shotcuts',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SvgPicture.asset(
                                filter,
                                width: 18,
                              ),
                            ],
                          ),
                          UIHelper.verticalSpaceMedium(),
                          _shotcut1(context),

                          UIHelper.verticalSpaceMedium(),

                          //--UTILITIES
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Utilities',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SvgPicture.asset(
                                filter,
                                // color: Theme.of(context).iconTheme.color,
                                width: 18,
                              ),
                            ],
                          ),
                          UIHelper.verticalSpaceMedium(),

                          _utilities(context),

                          UIHelper.verticalSpaceMedium(),

                          //--RECENT

                          recentTransactions(context, data.recentTransactions),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox recentTransactions(
      BuildContext context, List<TransactionsModel> txn) {
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
          UIHelper.verticalSpaceMedium(),
          txn.isNotEmpty
              ? ListView.builder(
                  itemCount: txn.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return txnItem(context, txn[index]);
                  },
                )
              : const SizedBox.shrink()
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

  Widget _contentHeader(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
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
          // InkWell(
          //   onTap: () {},
          //   child: SvgPicture.asset(
          //     menu,
          //     width: 16,
          //     // color: Theme.of(context).iconTheme.color,
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Iconsax.notification),
                tooltip: "Notifications",
                onPressed: () {},
              ),
              Consumer(builder: (context, ref, child) {
                final theme = ref.watch(themeModeProvider);
                return IconButton(
                    onPressed: () {
                      ref.read(themeModeProvider.notifier).state =
                          theme == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    },
                    icon: Icon(theme == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode));
              }),
            ],
          )
        ],
      ),
    );
  }

  Widget _currentMonthOverView(
      BuildContext context, Map<String, dynamic> data) {
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
              Container(
                margin: const EdgeInsets.only(top: 8, left: 16),
                child: SizedBox.square(
                    dimension: 100,
                    child: PicChart(chartData: {
                      'expenditure': data['expenditurePercentage'],
                      'savings': data['savingsPercentage']
                    })),
              ),
              UIHelper.verticalSpaceSmall(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatCurrency(data['totalCreditMonth'].toString()),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Income',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                      )
                    ],
                  ),
                  UIHelper.verticalSpaceMedium(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatCurrency(data['totalDebitMonth'].toString()),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Expenditure',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          UIHelper.verticalSpaceLarge(),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${data['expenditurePercentage']}% SPENDINGS",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "${data['savingsPercentage']}% SAVINGS",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  )
                ],
              ),
              UIHelper.verticalSpaceSmall(),
              SizedBox(
                height: 8,
                child: Row(
                  children: [
                    Flexible(
                      flex: 30,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 70,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
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

  Widget _navigation(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
        SizedBox(
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
                  decoration: const BoxDecoration(
                    color: Colors.green,
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
                  GoRouter.of(context).pushNamed('ENTRY',
                      extra: {'accountType': 'EXPENDITURE'});
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
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.background)),
                        child: CircleAvatar(
                          radius: 24.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          child: const Icon(
                            Iconsax.direct_send5,
                            color: Colors.redAccent,
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
                      .pushNamed('ENTRY', extra: {'accountType': 'INCOME'});
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
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.background)),
                        child: CircleAvatar(
                          radius: 24.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          child: const Icon(
                            Iconsax.direct_inbox5,
                            color: Colors.blueAccent,
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
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed('WITHDRAWAL-ENTRY');
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
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.background)),
                        child: CircleAvatar(
                          radius: 24.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
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
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed('DEPOSIT-ENTRY');
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
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.background)),
                        child: CircleAvatar(
                          radius: 24.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          child: Icon(
                            Iconsax.repeat_circle5,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
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
                ),
              )
            ],
          ),
        ),
      ],
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

  Widget _todaysSummary(BuildContext context, Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 1, bottom: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              strToDate(DateTime.now()),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          IntrinsicHeight(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(
                          "Expenses",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatCurrency(data['totalDebitDay'].toString()),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Icon(
                              Iconsax.export_1,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    fit: FlexFit.loose,
                    child: SizedBox(
                      width: 50,
                      // child: DateWidget(
                      //   strDate: DateTime.now().toString(),
                      // ),
                      child: VerticalDivider(
                        thickness: 0.8,
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(
                          "Income",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Iconsax.import_1,
                              color: Colors.green,
                            ),
                            UIHelper.horizontalSpaceSmall(),
                            Text(
                              formatCurrency(data['totalCreditDay'].toString()),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class ModelServices {
  String title, img;
  ModelServices({required this.title, required this.img});
}
