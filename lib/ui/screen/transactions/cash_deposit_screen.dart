import 'package:flutter/material.dart';
import 'package:flutter_wallet/ui/widgets/annotated_region.dart';

class CashDepositScreen extends StatelessWidget {
  const CashDepositScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cash Deposit"),
        ),
      ),
    );
  }
}
