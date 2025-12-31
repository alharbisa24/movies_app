import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedMoviesShimmerLoading extends StatelessWidget {
  const TopRatedMoviesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                    width: 140.w,
            height: 220.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
                    ),
                  ),
            
                  SizedBox(height: 12.h),
            
                  // Title placeholder
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
            height: 20.h,
            width: 120.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
                    ),
                  ),
            
                  SizedBox(height: 6.h),
            
                  // Rating placeholder (icon + text)
                  Row(
                    children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Icon(Icons.star, size: 14.sp, color: Colors.grey.shade300),
            ),
            SizedBox(width: 4.w),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 14.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
                    ],
                  ),
            
                  SizedBox(height: 4.h),
            
                  // Genres placeholders (two rounded badges)
                  Row(
                    children: List.generate(2, (index) {
            return Padding(
              padding: EdgeInsets.only(right: 6.w),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  width: 50.w,
                  height: 20.h,
                ),
              ),
            );
                    }),
                  ),
                ],
              ),
          );
  
        },
      ),
    );
  }
}