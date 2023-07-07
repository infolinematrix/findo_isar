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
import '../../../util/double_back_to_close_app.dart';
import '../../widgets/annotated_region.dart';
import '../../widgets/bar_chart.dart';
import '../../widgets/pie_chart2.dart';
import '../../widgets/txn_item.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            backgroundColor: Theme.of(context).primaryColor,
            content: const Text('Tap back again to leave'),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
            child: Consumer(
              builder: (context, ref, child) {
                final homeData = ref.watch(inttHomeProvider);

                return homeData.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => ErrorWidget(error),
                  data: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _contentHeader(context),
                        _userHeader(context, data.settings),

                        UIHelper.verticalSpaceMedium(),
                        const SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: BarChart1(),
                        ),

                        UIHelper.verticalSpaceSmall(),
                        _currentMonthSummary(
                            context, data.monthIncomeExpenditure),

                        UIHelper.verticalSpaceMedium(),
                        _navigation(context),

                        UIHelper.verticalSpaceMedium(),
                        //--NAVIGATION

                        _shotcut1(context),

                        UIHelper.verticalSpaceMedium(),
                        _currentBalance(context, data.currentBalance),

                        //--UTILITIES
                        UIHelper.verticalSpaceMedium(),
                        _utilities(context),

                        //--RECENT
                        UIHelper.verticalSpaceMedium(),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Recent Activities',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SvgPicture.asset(
                  filter,
                  // color: Theme.of(context).iconTheme.color,
                  width: 18,
                ),
              ],
            ),
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

  Row _userHeader(BuildContext context, Map<String, dynamic> settings) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              const Icon(Iconsax.user_tag),
              UIHelper.horizontalSpaceSmall(),
              Text(
                "Hi, ${settings['name']}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Iconsax.receipt_add),
          tooltip: "Pages",
          onPressed: () {
            GoRouter.of(context).pushNamed('PAGES');
          },
        ),
        IconButton(
          icon: const Icon(Iconsax.cpu_setting),
          tooltip: "Settings",
          onPressed: () {
            GoRouter.of(context).pushNamed('SETTINGS');
          },
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/svg/icon.png",
                  height: 36.0,
                  width: 36.0,
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FINDO',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w800, fontSize: 20, height: .75),
                  ),
                  Text(
                    'Smart Money Manager',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 12),
                  ),
                ],
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
              Consumer(
                builder: (context, ref, child) {
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
                        : Icons.dark_mode),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _currentMonthSummary(BuildContext context, Map<String, dynamic> data) {
    return SizedBox(
      height: 230,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'July, 2023',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text(
                        'Expenses & Savings Percentage',
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(Iconsax.chart),
                    ),
                  )
                ],
              ),
              UIHelper.verticalSpaceMedium(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: PicChart(
                          chartData: {
                            'expenditure': data['expenditurePercentage'],
                            'savings': data['savingsPercentage'],
                            'totalDebitMonth': data['totalDebitMonth'],
                            'totalCreditMonth': data['totalCreditMonth'],
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 7,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  formatCurrency(
                                      data['totalCreditMonth'].toString()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  'Income',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .primaryColorDark),
                                )
                              ],
                            ),
                            UIHelper.verticalSpaceMedium(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  formatCurrency(
                                      data['totalDebitMonth'].toString()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  'Expenditure',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .primaryColorDark),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceMedium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 12,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        UIHelper.horizontalSpaceSmall(),
                        const Text("Expenditure")
                      ],
                    ),
                  ),
                  UIHelper.horizontalSpaceMedium(),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 12,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        UIHelper.horizontalSpaceSmall(),
                        const Text("Savings")
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _currentMonthOverView(
  //     BuildContext context, Map<String, dynamic> data) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: <Widget>[
  //           // Flexible(
  //           //   flex: 2,
  //           //   child: Container(
  //           //     padding: const EdgeInsets.only(
  //           //       top: 16,
  //           //       left: 16,
  //           //     ),
  //           //     child: SizedBox.square(
  //           //       dimension: 80,
  //           //       child: PicChart(
  //           //         chartData: {
  //           //           'expenditure': data['expenditurePercentage'],
  //           //           'savings': data['savingsPercentage'],
  //           //           'totalDebitMonth': data['totalDebitMonth'],
  //           //           'totalCreditMonth': data['totalCreditMonth'],
  //           //         },
  //           //       ),
  //           //     ),
  //           //   ),
  //           // ),
  //           UIHelper.verticalSpaceSmall(),
  //           Flexible(
  //             flex: 4,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: <Widget>[
  //                 Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Text(
  //                       formatCurrency(data['totalCreditMonth'].toString()),
  //                       style:
  //                           Theme.of(context).textTheme.displaySmall!.copyWith(
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                     ),
  //                     Text(
  //                       'Income',
  //                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
  //                           fontWeight: FontWeight.w400,
  //                           color: Theme.of(context).primaryColorDark),
  //                     )
  //                   ],
  //                 ),
  //                 UIHelper.verticalSpaceMedium(),
  //                 Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Text(
  //                       formatCurrency(data['totalDebitMonth'].toString()),
  //                       style:
  //                           Theme.of(context).textTheme.displaySmall!.copyWith(
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                     ),
  //                     Text(
  //                       'Expenditure',
  //                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
  //                           fontWeight: FontWeight.w400,
  //                           color: Theme.of(context).primaryColorDark),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //       UIHelper.verticalSpaceLarge(),
  //       Column(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           // Row(
  //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           //   children: [
  //           //     // Text(
  //           //     //     "${data['totalCreditDay'] > 0 ? data['expenditurePercentage'] : '0'}% SPENDINGS",
  //           //     //     style: Theme.of(context)
  //           //     //         .textTheme
  //           //     //         .bodySmall!
  //           //     //         .copyWith(color: Theme.of(context).primaryColorDark)),
  //           //     // Text(
  //           //     //     "${data['totalDebitDay'] > 0 ? data['savingsPercentage'] : '0'}% SAVINGS",
  //           //     //     style: Theme.of(context)
  //           //     //         .textTheme
  //           //     //         .bodySmall!
  //           //     //         .copyWith(color: Theme.of(context).primaryColorDark))

  //           //     Text("24% SPENDINGS",
  //           //         style: Theme.of(context)
  //           //             .textTheme
  //           //             .bodySmall!
  //           //             .copyWith(color: Theme.of(context).primaryColorDark)),
  //           //     Text("32% SAVINGS",
  //           //         style: Theme.of(context)
  //           //             .textTheme
  //           //             .bodySmall!
  //           //             .copyWith(color: Theme.of(context).primaryColorDark))
  //           //   ],
  //           // ),
  //           UIHelper.verticalSpaceSmall(),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               SizedBox(
  //                 child: Row(
  //                   children: [
  //                     Container(
  //                       width: 10,
  //                       height: 12,
  //                       color: Theme.of(context).colorScheme.error,
  //                     ),
  //                     UIHelper.horizontalSpaceSmall(),
  //                     const Text("Expenditure")
  //                   ],
  //                 ),
  //               ),
  //               UIHelper.horizontalSpaceMedium(),
  //               SizedBox(
  //                 child: Row(
  //                   children: [
  //                     Container(
  //                       width: 10,
  //                       height: 12,
  //                       color: Theme.of(context).colorScheme.inversePrimary,
  //                     ),
  //                     UIHelper.horizontalSpaceSmall(),
  //                     const Text("Savings")
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           UIHelper.verticalSpaceSmall(),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _currentBalance(BuildContext context, Map<String, dynamic> data) {
    return Card(
      elevation: .25,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "CURRENT BALANCE",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            UIHelper.verticalSpaceMedium(),
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
                            "Cash in Hand",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatCurrency(data['cashBalance'].toString()),
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
                    const Flexible(
                      fit: FlexFit.loose,
                      child: SizedBox(
                        width: 50,
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
                            "Cash at Bank",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatCurrency(data['bankBalance'].toString()),
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
          ],
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Navigation',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SvgPicture.asset(
                scan,
                width: 18,
              ),
            ],
          ),
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
                    color: Theme.of(context).highlightColor,
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
                        style: Theme.of(context).textTheme.bodySmall,
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
                    color: Theme.of(context).highlightColor,
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
                        style: Theme.of(context).textTheme.bodySmall,
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
                    color: Theme.of(context).highlightColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).highlightColor),
                        ),
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
                        style: Theme.of(context).textTheme.bodySmall,
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
                    color: Theme.of(context).highlightColor,
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
                        style: Theme.of(context).textTheme.bodySmall,
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Shotcuts',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SvgPicture.asset(
                filter,
                width: 18,
              ),
            ],
          ),
        ),
        UIHelper.verticalSpaceMedium(),
        Row(
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
                      color: Theme.of(context).highlightColor,
                    ),
                    child: Icon(
                      Iconsax.wallet_money,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Statement",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed('ROOT_ACCOUNTS', extra: {
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
                      color: Theme.of(context).highlightColor,
                    ),
                    child: Icon(
                      Iconsax.autobrightness,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Accounts",
                    textAlign: TextAlign.center,
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
                      color: Theme.of(context).highlightColor,
                    ),
                    // child: SvgPicture.asset(
                    //   listServices[2].img,
                    //   // color: Theme.of(context).iconTheme.color,
                    // ),
                    child: Icon(
                      Iconsax.book_square,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Reports",
                    textAlign: TextAlign.center,
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
                      color: Theme.of(context).highlightColor,
                    ),
                    // child: SvgPicture.asset(
                    //   listServices[3].img,
                    //   // color: Theme.of(context).iconTheme.color,
                    // ),
                    child: Icon(
                      Iconsax.cpu,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Settings",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
          ],
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

    listServices.add(ModelServices(title: "Cash Book", img: send));
    listServices.add(ModelServices(title: "Bank Book", img: recive));
    listServices.add(ModelServices(title: "Statement", img: mobile));
    listServices.add(ModelServices(title: "Accounts", img: electricity));

    return GestureDetector(
      onTap: () {
        // print('${value.title}');
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Utilities',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SvgPicture.asset(
                  filter,
                  // color: Theme.of(context).iconTheme.color,
                  width: 18,
                ),
              ],
            ),
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed('CASH-BOOK'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).highlightColor,
                      ),
                      child: SvgPicture.asset(
                        listServices[0].img,
                        // color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    const Text(
                      "Cash Book",
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpaceMedium(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed('BANK-BOOK'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).highlightColor,
                      ),
                      child: SvgPicture.asset(
                        listServices[1].img,
                        // color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    const Text(
                      "Bank Book",
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpaceMedium(),
                  ],
                ),
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
                      color: Theme.of(context).highlightColor,
                    ),
                    child: SvgPicture.asset(
                      listServices[2].img,
                      // color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  const Text(
                    "Budget",
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpaceMedium(),
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
                      color: Theme.of(context).highlightColor,
                    ),
                    child: SvgPicture.asset(
                      listServices[3].img,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  const Text(
                    "Analytics",
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpaceMedium(),
                ],
              ),
            ],
          ),

          //#
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed('CASH-BOOK'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).highlightColor,
                        ),
                        child: SvgPicture.asset(
                          listServices[4].img,
                          // color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    const Text(
                      "Speed",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpaceMedium(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed('BANK-BOOK'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).highlightColor,
                      ),
                      child: SvgPicture.asset(
                        listServices[5].img,
                        // color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    const Text(
                      "Reminder",
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpaceMedium(),
                  ],
                ),
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
                      color: Theme.of(context).highlightColor,
                    ),
                    child: SvgPicture.asset(
                      listServices[6].img,
                      // color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  const Text(
                    "Currency",
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpaceMedium(),
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
                      color: Theme.of(context).highlightColor,
                    ),
                    child: SvgPicture.asset(
                      listServices[7].img,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  const Text(
                    "EMI Calc",
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpaceMedium(),
                ],
              ),
            ],
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
