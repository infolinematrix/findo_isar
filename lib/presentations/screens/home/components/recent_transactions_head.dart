import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/constants/variables.dart';
import '../../../../theme/ui_helper.dart';
import '../../../../utils/utilities.dart';

class RecentTransactionsHead extends StatelessWidget {
  const RecentTransactionsHead({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        height: 80.h,
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 90.w,
              child: Container(
                margin: EdgeInsets.only(left: 8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipOval(
                      child: Container(
                        alignment: Alignment.center,
                        color: Color(randomColor[
                            randomNumber(min: 0, max: randomColor.length - 1)]),
                        height: 45.0.sp,
                        width: 45.0.sp,
                        child: Text(
                          "M",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Text(
                          "My Account Book",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Text(
                          "250.50",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
