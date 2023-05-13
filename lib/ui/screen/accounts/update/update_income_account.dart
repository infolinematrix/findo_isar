import 'package:flutter/material.dart';
import '../../../../models/accounts_model.dart';
import '../../../widgets/annotated_region.dart';

class UpdateIncomeAccount extends StatelessWidget {
  const UpdateIncomeAccount({Key? key, required this.account})
      : super(key: key);
  final AccountsModel account;
  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("UPDATE INCOME ACCOUNT"),
        ),
      ),
    );
  }
}
