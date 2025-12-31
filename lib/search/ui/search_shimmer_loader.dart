import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:shimmer/shimmer.dart';

class SearchShimmerLoader extends StatelessWidget {
  const SearchShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
    margin: EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 90.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),

        horizontalSpace(16),

        SizedBox(
         width: 160.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

          Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  height: 20.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),

              verticalSpace(6),

             Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Icon(Icons.star, size: 14.sp, color: Colors.grey.shade300),
              ),
              horizontalSpace(6),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  width: 30.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          ),

              verticalSpace(4),

       Wrap(
          spacing: 8,
          children: List.generate(3, (i) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            );
          }),
        ),

     Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 12.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
            ],
          ),
        ),
      ],
    ),
        ),  
      ],
    ),
          );
  
        },
      ),
    );
  }
}