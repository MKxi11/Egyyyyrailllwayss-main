import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextContainer extends StatefulWidget {
  const TextContainer({super.key});

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
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
              color: const Color.fromARGB(62, 255, 255, 255),
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Experience Egypt Like Never Before',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Text(
            'Travel Egypt by',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Default color
              ),
              children: <TextSpan>[
                const TextSpan(text: 'Train'),
                TextSpan(
                  text: ' with Ease',
                  style: TextStyle(
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 244, 98, 166),
                          const Color.fromARGB(255, 255, 161, 89),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(Rect.fromLTWH(150, 100, 400, 70)),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0.h),
          Text(
            '''   Book train ticket online, skip the lines, and 
    enjoy your journey across the land of the
   Pharaohs.''',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
