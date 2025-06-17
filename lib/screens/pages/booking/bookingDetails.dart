import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookingDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> booking;

  const BookingDetailsScreen({Key? key, required this.booking})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 242, 242),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Bar(),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    "Your ticket",
                    style:
                        TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Stack(
                children: [
                  // صورة التذكرة كخلفية
                  ClipRRect(
                    child: Image.asset(
                      'images/ticket.png', // غيّر المسار لو الصورة في مكان تاني
                      height: 1100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Booking#",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(" ${booking['reservationId']}",
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold)),
                                    Spacer(),
                                    Text("Booked on")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade100,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Upcoming",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 80, 32),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      DateFormat('EEE, MMM d yyyy').format(
                                          DateTime.parse(
                                              booking['created_at'])),
                                      style: _textStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Journey Details ", style: _sectionTitle),
                            SizedBox(height: 15.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Train",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                                Text(" ${booking['trainName']}",
                                    style: _textStyle),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_pin),
                                        Text(
                                          "From",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_pin),
                                        Text(
                                          "To",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(" ${booking['from']}",
                                        style: _textStyle),
                                    Text(" ${booking['to']}",
                                        style: _textStyle),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 80.h,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.date_range),
                                          Text(
                                            "Date",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('EEE, MMM d yyyy').format(
                                            DateTime.parse(booking['date'])),
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("   ${booking['time']}",
                                              style: _textStyle),
                                          Text(
                                            " ${booking['Duration']} Hours",
                                            style: TextStyle(fontSize: 18.sp),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                            SizedBox(height: 30.h),
                            Text(
                              "Passenger Details",
                              style: _sectionTitle,
                            ),
                            SizedBox(height: 10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                Text(
                                    " ${booking['firstName']} ${booking['lastName']}",
                                    style: _textStyle),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                Text(" ${booking['email']}", style: _textStyle),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                Text(" ${booking['phone']}", style: _textStyle),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Number of Passengers",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                Text(" ${booking['numPassengers']}",
                                    style: _textStyle),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Text("Ticket Details", style: _sectionTitle),
                            SizedBox(height: 10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                Text(" ${booking['Totalprice']}",
                                    style: _textStyle),
                                Text(
                                  "paid with Visa ${booking['Visa']}",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  TextStyle get _textStyle => TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        shadows: [Shadow(blurRadius: 2, color: Colors.black)],
      );

  TextStyle get _sectionTitle => TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(blurRadius: 3, color: Colors.black)],
      );
}
