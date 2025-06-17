import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/screens/pages/booking/bookingDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyBookingPage extends StatefulWidget {
  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> bookings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBookings();
  }

  Future<void> loadBookings() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    final response = await supabase
        .from('reservations')
        .select('*')
        .eq('userId', userId)
        .order('created_at', ascending: false);

    List<Map<String, dynamic>> tempList = [];

    for (var reservations in response) {
      final train = await supabase
          .from('trains')
          .select('*')
          .eq('id', reservations['trainId'])
          .single();

      final booking = {
        'trainName': "${train['number']} ${train['level']}",
        'from': train['trainFrom'],
        'Duration': train['time'],
        'to': train['trainTo'],
        'date': reservations['date'],
        'time': train['go'] + " - " + train['arrive'],
        'class': train['level'],
        'reservationId': reservations['id'],
        'firstName': reservations['firstName'],
        'lastName': reservations['lastName'],
        'email': reservations['email'],
        'phone': reservations['phone'],
        'numPassengers': reservations['numPassengers'],
        'Totalprice': reservations['totalPrice'],
        'created_at': reservations['created_at'],
        'Visa': "****8696"
      };

      tempList.add(booking);
    }

    setState(() {
      bookings = tempList;
      isLoading = false;
    });
  }

  Future<void> cancelBooking(int reservationId, int index) async {
    await supabase.from('reservations').delete().eq('id', reservationId);
    setState(() {
      bookings.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Reservations",
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Upcoming Trips (${bookings.length})",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        final booking = bookings[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${booking['from']} → ${booking['to']}",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            booking['trainName'],
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
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
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Date",
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            DateFormat('EEE, MMM d yyyy')
                                                .format(DateTime.parse(
                                                    booking['date'])),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Time",
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            booking['time'],
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Class",
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            booking['class'],
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Reservation ID",
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            booking['reservationId'].toString(),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 17, 81, 133),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookingDetailsScreen(
                                                      booking: booking,
                                                    )));
                                      },
                                      child: Text(
                                        "View Details",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      width: 120.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: const Color.fromARGB(
                                              255, 255, 176, 184)),
                                      child: TextButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    title: Text(
                                                        "Delete the Ticket !"),
                                                    content: Text(
                                                        "Are you sure you want to delete the ticket ?"),
                                                    actions: <Widget>[
                                                      TextButton(
                                                          child: Text("Yes"),
                                                          onPressed: () {
                                                            cancelBooking(
                                                                booking[
                                                                    'reservationId'],
                                                                index);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }),
                                                      TextButton(
                                                          child: Text("cancel"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          })
                                                    ]);
                                              });
                                        },
                                        child: Text(
                                          "Cancel Booking",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
