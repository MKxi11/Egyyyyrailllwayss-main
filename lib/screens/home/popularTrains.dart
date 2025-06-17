import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Populartrains extends StatefulWidget {
  const Populartrains({super.key});

  @override
  State<Populartrains> createState() => _PopulartrainsState();
}

class _PopulartrainsState extends State<Populartrains> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 255, 255, 255),
        borderRadius: BorderRadius.circular(8.0.r),
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.0.h),
          Container(
            width: 200.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(135, 89, 180, 232),
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Travel with Ease',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Text(
            'Popular Trains',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0.h),
          Text(
            'Discover Egypt\'s most traveled train routes and top destinations. Explore ancient cities and breathtaking landscapes.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
