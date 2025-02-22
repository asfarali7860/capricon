import 'package:capricon/utils/app_sizes.dart';
import 'package:capricon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchDetailShimmer extends StatelessWidget {
  const SearchDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        shimmerCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(width: 220.w, height: 18.h),
              gapH8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shimmerBox(width: 100.w, height: 14.h),
                  shimmerBox(width: 80.w, height: 14.h),
                ],
              ),
              gapH12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shimmerBox(width: 80.w, height: 20.h),
                  shimmerBox(width: 60.w, height: 16.h),
                ],
              ),
            ],
          ),
        ),
        gapH16,
        shimmerCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerTitle(),
              shimmerRow(),
              shimmerRow(),
              shimmerRow(),
            ],
          ),
        ),
        gapH16,
        shimmerCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerTitle(),
              shimmerRow(),
              shimmerRow(),
              shimmerRow(),
              shimmerRow(),
            ],
          ),
        ),
        gapH16,
        shimmerCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerTitle(),
              shimmerRow(),
              shimmerRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget shimmerCard(Widget child) {
    return Card(
      color: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: child,
      ),
    );
  }

  Widget shimmerTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: shimmerBox(width: 150.w, height: 16.h),
    );
  }

  Widget shimmerRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          shimmerBox(width: 120.w, height: 14.h),
          shimmerBox(width: 100.w, height: 14.h),
        ],
      ),
    );
  }

  Widget shimmerBox({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}