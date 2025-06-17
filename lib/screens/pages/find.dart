import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/screens/pages/Reservation/ticketsData.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Find extends StatefulWidget {
  final String? initialOrigin;
  final String? initialDestination;

  const Find({super.key, this.initialOrigin, this.initialDestination});

  @override
  State<Find> createState() => _FindState();
}

class _FindState extends State<Find> {
  String? origin, destination;
  int trainCount = 0;
  List<String> stations = [];
  List<dynamic> trainResults = [];
  bool isLoadingStations = false;
  bool isLoadingTrains = false;

  @override
  void initState() {
    super.initState();
    origin = widget.initialOrigin;
    destination = widget.initialDestination;
    fetchStations().then((_) {
      if (origin != null && destination != null) {
        fetchTrains();
      }
    });
  }

  Future<void> fetchStations() async {
    final supabase = Supabase.instance.client;

    try {
      final response = await supabase
          .from('stations')
          .select('name')
          .timeout(const Duration(seconds: 4)); // ⏱ أهم سطر هنا

      if (response.isNotEmpty) {
        setState(() {
          stations = List<String>.from(response.map((item) => item['name']))
              .toSet()
              .toList();
        });

        // تحميل تلقائي للقطارات لو الأصل والوجهة موجودين من البداية
        if (widget.initialOrigin != null && widget.initialDestination != null) {
          setState(() {
            origin = widget.initialOrigin;
            destination = widget.initialDestination;
          });
          fetchTrains();
        }
      }
    } on TimeoutException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Check your internet connection")),
      );
    } catch (e) {
      print('Error fetching stations: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load stations")),
      );
    }
  }

  Future<void> fetchTrains() async {
    final supabase = Supabase.instance.client;

    try {
      final response = await supabase
          .from('trains')
          .select('*')
          .eq('trainFrom', origin ?? '')
          .eq('trainTo', destination ?? '')
          .timeout(const Duration(seconds: 4)); // ⏱ أهم سطر هنا

      if (response.isNotEmpty) {
        setState(() {
          trainResults = response;
          trainCount = response.length;
        });
      } else {
        setState(() {
          trainResults = [];
          trainCount = 0;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No trains found for the selected route.'),
          ),
        );
      }
    } on TimeoutException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Check your internet connection")),
      );
    } catch (e) {
      print('Error fetching trains: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load trains")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20.h),
                child: Text(
                  'Find Your Train',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.colorblack,
                  ),
                ),
              ),
            ),
            Container(
              height: 320.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColor.colorwhite,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(131, 122, 122, 122),
                    blurRadius: 5.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Search Trains',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: AppColor.colorblack,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Loading indicator for stations
                  if (isLoadingStations)
                    const Center(child: CircularProgressIndicator())
                  else ...[
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: _dropdownDecoration('Origin', Icons.train),
                      items: stations
                          .where((station) => station != destination)
                          .map((value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() => origin = value),
                      value: origin,
                    ),
                    SizedBox(height: 20.h),
                    DropdownButtonFormField<String>(
                      decoration:
                          _dropdownDecoration('Destination', Icons.train),
                      items: stations
                          .where((station) => station != origin)
                          .map((value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (origin == value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'You can\'t select the same station twice'),
                            ),
                          );
                          setState(() => destination = null);
                        } else {
                          setState(() => destination = value);
                        }
                      },
                      value: destination,
                    ),
                  ],

                  SizedBox(height: 30.h),
                  mainbutton(
                    text1: "Search Trains",
                    onPressed: () {
                      if (origin != null &&
                          destination != null &&
                          origin != destination) {
                        fetchTrains();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please select both different stations'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(131, 122, 122, 122),
                    blurRadius: 50.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Available trains',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.colorblack,
                      ),
                    ),
                    Container(
                      width: 140.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(101, 9, 125, 179),
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: Center(
                        child: Text(
                          '$trainCount trains found',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // Loading indicator for trains
            if (isLoadingTrains)
              const Center(child: CircularProgressIndicator())
            else if (trainResults.isEmpty)
              Center(
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: AppColor.colorwhite,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5.r,
                        offset: Offset(0, 3.h),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(5.h)),
                      Column(children: [
                        Text(
                          'Start your Journey',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: AppColor.colorblack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          '\nSearch for trains by selecting your departure and destination stations.',
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: const Color.fromARGB(255, 72, 72, 72),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trainResults.length,
                itemBuilder: (context, index) {
                  final train = trainResults[index];
                  final int stops =
                      int.tryParse(train['stopin'].toString()) ?? 0;
                  final int price = stops * 30; // Example price calculation
                  return Container(
                    height: 280.h,
                    width: double.infinity,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      color: AppColor.colorwhite,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5.r,
                          offset: Offset(0, 3.h),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${train['number'] ?? 'train number not available'}',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 5.h)),
                                Text(
                                  "Duration",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '${train['time'] ?? 'Duration not available'} Hours',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.colorblack,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (train['level'] != null)
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 143, 203, 232),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              '${train['level']}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'From ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.colorblack,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' ${train['trainFrom']}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColor.colorblack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.grey,
                              size: 16.sp,
                            ),
                            Spacer(),
                            RichText(
                              text: TextSpan(
                                text: 'To ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.colorblack,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' ${train['trainTo'] ?? ''}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColor.colorblack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Departure: ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.colorblack,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${train['go'] ?? ''}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColor.colorblack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            RichText(
                              text: TextSpan(
                                text: 'Arrival: ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.colorblack,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${train['arrive'] ?? ''}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColor.colorblack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (train['departureTime'] != null)
                              Text(
                                'Departure: ${train['departureTime']}',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                          ],
                        ),
                        if (train['departureTime'] != null)
                          Text(
                            'Departure: ${train['departureTime']}',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 1,
                          color: const Color.fromARGB(255, 181, 181, 181),
                          height: 30.h,
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Text(
                                    'Price',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    ' EGP $price',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 27, 122, 201),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: Container(
                                width: 110.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 0, 107, 156),
                                      Color.fromARGB(255, 0, 51, 152),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => TrainDetails(
                                                  train: train,
                                                )));
                                  },
                                  child: Text(
                                    "Select Ticket",
                                    style: TextStyle(
                                        color: AppColor.colorwhite,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  InputDecoration _dropdownDecoration(String label, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: const Color.fromARGB(255, 241, 241, 241),
      labelText: label,
      labelStyle: TextStyle(
        color: const Color.fromARGB(255, 78, 78, 78),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Color(0xff0057FF)),
      ),
    );
  }
}
