import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';
import 'package:go_router/go_router.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        body: AnnotedAppRegion(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("REPORTS"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushNamed('STATEMENT');
                      },
                      child: Card(
                        elevation: .25,
                        child: ListTile(
                          title: Text(
                            "Statement of Account",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle:
                              const Text("View all transaction on a account"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushNamed('CASH-BOOK');
                      },
                      child: Card(
                        elevation: .25,
                        child: ListTile(
                          title: Text(
                            "Cash Book",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle:
                              const Text("View all transaction on a account"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushNamed('BANK-BOOK');
                      },
                      child: Card(
                        elevation: .25,
                        child: ListTile(
                          title: Text(
                            "Bank Book",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle:
                              const Text("View all transaction on a account"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).pushNamed('REPORTS');
                      },
                      child: Card(
                        elevation: .25,
                        child: ListTile(
                          title: Text(
                            "Budget Report",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle:
                              const Text("View all transaction on a account"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).pushNamed('REPORTS');
                      },
                      child: Card(
                        elevation: .25,
                        child: ListTile(
                          title: Text(
                            "Receive Book",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle:
                              const Text("View all transaction on a account"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).pushNamed('REPORTS');
                      },
                      child: Card(
                        elevation: .25,
                        child: ListTile(
                          title: Text(
                            "Payment Book",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle:
                              const Text("View all transaction on a account"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).pushNamed('REPORTS');
                      },
                      child: Card(
                        elevation: .25,
                        child: ListTile(
                          title: Text(
                            "My Savings",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle:
                              const Text("View all transaction on a account"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).pushNamed('REPORTS');
                      },
                      child: Card(
                        elevation: .25,
                        child: ListTile(
                          title: Text(
                            "Loan & Liabilities",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle:
                              const Text("View all transaction on a account"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
