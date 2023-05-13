import 'package:flutter/material.dart';
import 'package:flutter_wallet/models/accounts_model.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';

class CreateBankAccount extends StatelessWidget {
  const CreateBankAccount({Key? key, required this.account}) : super(key: key);
  final AccountsModel account;
  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CREATE BANK ACCOUNT"),
        ),
      ),
    );
  }
}
