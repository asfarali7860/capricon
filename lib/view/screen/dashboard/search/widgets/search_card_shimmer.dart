import 'package:capricon/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCardShimmer extends StatelessWidget {
  const SearchCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
            gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shimmerBox(width: 180.w, height: 16.h),
                  gapH6,
                  shimmerBox(width: 100.w, height: 14.h),
                  gapH6,
                  Row(
                    children: [
                      shimmerIcon(),
                      SizedBox(width: 4.w),
                      shimmerBox(width: 80.w, height: 12.h),
                      SizedBox(width: 10.w),
                      shimmerIcon(),
                      SizedBox(width: 4.w),
                      shimmerBox(width: 80.w, height: 12.h),
                    ],
                  ),
                  gapH6,
                  Row(
                    children: [
                      shimmerIcon(),
                      SizedBox(width: 4.w),
                      shimmerBox(width: 120.w, height: 12.h),
                    ],
                  ),
                  gapH6,
                  Row(
                    children: [
                      shimmerIcon(),
                      SizedBox(width: 4.w),
                      shimmerBox(width: 120.w, height: 12.h),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      shimmerIcon(),
                      SizedBox(width: 4.w),
                      shimmerBox(width: 100.w, height: 12.h),
                    ],
                  ),
                  gapH8,
                  shimmerBox(width: double.infinity, height: 12.h),
                  gapH4,
                  shimmerBox(width: double.infinity, height: 12.h),
                  gapH4,
                  shimmerBox(width: 150.w, height: 12.h),
                ],
              ),
            ),
          ],
        ),
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

  Widget shimmerIcon() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 16.sp,
        height: 16.sp,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}