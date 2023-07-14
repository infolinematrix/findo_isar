import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../util/constant.dart';
import '../../../util/format_currency.dart';
import '../../../util/ui_helpers.dart';
import '../../widgets/annotated_region.dart';
import 'reports_controller.dart';

class AccountsSummary extends StatelessWidget {
  const AccountsSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return AnnotedAppRegion(
        child: Scaffold(
      // appBar: AppBar(
      //   title: const Text("ACCOUNT SUMMARY"),
      // ),
      body: CustomScrollView(
        slivers: [
          Consumer(builder: (context, ref, child) {
            return FormBuilder(
              key: formKey,
              child: SliverAppBar(
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                expandedHeight: 100.0,
                pinned: true,
                snap: false,
                floating: true,
                title: const Text(
                  "ACCOUNT SUMMARY",
                  style: TextStyle(),
                ),
                bottom: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  title: SizedBox(
                    height: 40,
                    child: FormBuilderDateRangePicker(
                      name: 'date_range',
                      firstDate: DateTime(2023),
                      lastDate: DateTime.now().add(const Duration(days: 1)),
                      initialValue: DateTimeRange(
                        start: ref.watch(startDateProvider),
                        end: DateTime.now(),
                      ),
                      style: inputStyle,
                      format: DateFormat('dd-MMM-yyyy'),
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Date Range',
                        iconColor: Colors.red,
                        filled: true,
                        fillColor: Theme.of(context).canvasColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        prefixIcon: const Icon(
                          Iconsax.calendar,
                          size: 24,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        if (formKey.currentState?.saveAndValidate() ?? false) {
                          DateTimeRange dateRange =
                              formKey.currentState!.value['date_range'];

                          ref
                              .watch(startDateProvider.notifier)
                              .update((state) => dateRange.start);

                          ref
                              .watch(endDateProvider.notifier)
                              .update((state) => dateRange.end);
                        }
                      },
                      icon: const Icon(Iconsax.filter),
                      label: const Text("Filter"),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium()
                  ],
                ),
              ),
            );
          }),
          Consumer(
            builder: (context, ref, child) {
              final data = ref.watch(accountsSummaryProvider);

              return data.when(
                loading: () =>
                    const SliverToBoxAdapter(child: LinearProgressIndicator()),
                error: (error, stackTrace) => const Text("Error"),
                data: (data) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, int index) {
                        return Card(
                          elevation: .25,
                          child: ListTile(
                            leading: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              child: Center(
                                child: Text(
                                  data[index]['account']![0],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            title: Text(
                              data[index]['account'].toString(),
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            subtitle: Text(
                                data[index]['account_description'].toString()),
                            trailing: Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                Material(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  color: Theme.of(context).hoverColor,
                                  clipBehavior: Clip.hardEdge,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 4),
                                    child: Text(
                                      "${data[index]['account_budget'] != 0 ? formatCurrency(data[index]['account_budget'].toString()) : 'Unlimited'}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onErrorContainer,
                                              fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                ),
                                Text(
                                    formatCurrency(
                                        data[index]['total'].toString()),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: data.length,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    ));
  }
}
