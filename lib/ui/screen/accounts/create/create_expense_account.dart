import 'package:flutter/material.dart';

import '../../../../models/accounts_model.dart';
import '../../../widgets/annotated_region.dart';

class CreateExpensesAccount extends StatelessWidget {
  const CreateExpensesAccount({Key? key, required this.account})
      : super(key: key);
  final AccountsModel account;
  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CREATE EXPENSES ACCOUNT"),
        ),
      ),
    );
  }
}