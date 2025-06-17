import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/screens/pages/Reservation/completeBooking.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainDetails extends StatelessWidget {
  final Map<String, dynamic> train;

  const TrainDetails({super.key, required this.train});

  @override
  Widget build(BuildContext context) {
    final int stops = int.tryParse(train['stopin'].toString()) ?? 0;
    final int price = stops * 30; // Example price calculation
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 15,
                  right: 15,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TRAIN ${train['number']}",
                        style: TextStyle(
                            fontSize: 24,
                            color: const Color.fromARGB(255, 55, 170, 223),
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 80.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(60, 41, 161, 212),
                          borderRadius: BorderRadius.circular(20.0.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: train['level'] != null
                              ? Text(
                                  "${train['level']}",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 49, 73, 117),
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : SizedBox(
                                  height: 20,
                                ),
                        ),
                      ),
                    ]),
              ),
              Container(
                height: 620.h,
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity - 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 210, 210, 210), // Set the border color
                              width: 0.8, // Set the border width
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        " ${train['trainFrom']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                      ),
                                      Text(
                                        " ${train['go']}",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: const Color.fromARGB(
                                                255, 52, 52, 52)),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 18.sp,
                                            color:
                                                Color.fromRGBO(52, 52, 52, 1),
                                          ),
                                          Text(
                                            " ${train['time']} Hours",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: const Color.fromARGB(
                                                    255, 52, 52, 52)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: Color.fromARGB(255, 20, 102, 164),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        " ${train['trainTo']}",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${train['arrive']}",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: const Color.fromARGB(
                                                255, 52, 52, 52)),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.payments_outlined),
                                          Text(
                                            ' EGP $price',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: const Color.fromARGB(
                                                    255, 52, 52, 52)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity - 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 210, 210, 210), // Set the border color
                              width: 0.8, // Set the border width
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Train information',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "Train Number",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text('Class',
                                          style: TextStyle(fontSize: 18)),
                                      Text('Stops',
                                          style: TextStyle(fontSize: 18)),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(""),
                                  Text(
                                    " ${train['number']}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("${train['level']}",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "${train['stopin']}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity - 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 210, 210, 210), // Set the border color
                              width: 0.8, // Set the border width
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Schedule',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "Departure",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text('Arrival',
                                          style: TextStyle(fontSize: 18)),
                                      Text('Duration',
                                          style: TextStyle(fontSize: 18)),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(""),
                                  Text(
                                    "           ${train['go']}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("           ${train['arrive']}",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "${train['time']} Hours",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    mainbutton(
                        text1: 'Continue to Booking',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Completebooking(
                                    train:
                                        train, // Provide a default value or get the selected date
                                  )));
                        })
                  ],
                ),
              ),
              // Add more if needed
            ],
          ),
        ),
      ),
    );
  }
}
