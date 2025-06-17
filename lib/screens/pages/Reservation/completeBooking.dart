import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/main.dart';
import 'package:egyrailwayes/screens/pages/myticket.dart';
import 'package:egyrailwayes/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Completebooking extends StatefulWidget {
  final Map<String, dynamic> train;

  const Completebooking({super.key, required this.train});

  @override
  State<Completebooking> createState() => _CompletebookingState();
}

class _CompletebookingState extends State<Completebooking> {
  final _formKey = GlobalKey<FormState>();
  int _passengerCount = 1;
  @override
  void initState() {
    super.initState();
    loadUserReservationData();
  }

  void loadUserReservationData() async {
    final userId = Supabase.instance.client.auth.currentUser!.id;

    final response = await Supabase.instance.client
        .from('reservations')
        .select()
        .eq('trainId', widget.train['id'])
        .eq("userId", userId)
        .maybeSingle();
    if (response != null) {
      setState(() {
        firstNameController.text = response['firstName'] ?? '';
        lastNameController.text = response['lastName'] ?? '';
        emailController.text = response['email'] ?? '';
        phoneController.text = response['phone'] ?? '';
        _dateController.text = response['date'] ?? '';
        _passengersController = response['numPassengers'] ?? '';
      });
    }
  }

  double calculateTotalPrice() {
    int stops = int.tryParse(widget.train['stopin'].toString()) ?? 0;
    double price = stops * 30.0;
    double totalPrice = 0.0;
    if (widget.train['stopin'] != null &&
        _passengersController.text.isNotEmpty) {
      totalPrice =
          price * (num.tryParse(_passengersController.text) ?? 0).toDouble();
    }
    totalpriceController.text = totalPrice.toString();
    return totalPrice;
  }

  void _confirmBooking() async {
    if (_formKey.currentState!.validate()) {
      final userId = Supabase.instance.client.auth.currentUser?.id;

      await Supabase.instance.client.from('reservations').insert({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'numPassengers': int.tryParse(_passengersController.text),
        'trainId': widget.train['id'],
        'userId': userId,
        'date': _dateController.text,
        'totalPrice': double.tryParse(totalpriceController.text),
      });

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Reservation Confirmed!"),
                content:
                    Text("Your reservation has been successfully processed."),
                actions: <Widget>[
                  TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyBookingPage()));
                      })
                ]);
          });
    }
  }

  final TextEditingController _dateController = TextEditingController();
  TextEditingController _passengersController =
      TextEditingController(text: '1');
  TextEditingController totalpriceController = TextEditingController();

  TextEditingController phoneController = TextEditingController(
      text: Supabase.instance.client.auth.currentUser?.userMetadata?['phone'] ??
          " ");

  TextEditingController firstNameController = TextEditingController(
    text: Supabase.instance.client.auth.currentUser?.userMetadata?['full_name']
            ?.split(" ")
            .first ??
        "No First Name",
  );
  TextEditingController fullNameController = TextEditingController(
      text: Supabase
          .instance.client.auth.currentUser?.userMetadata?['full_name']);
  TextEditingController yearController = TextEditingController(text: '11/31');
  TextEditingController cvvController = TextEditingController(text: '855');

  TextEditingController cardController =
      TextEditingController(text: '4223-5526-1285-8696');
  TextEditingController lastNameController = TextEditingController(
    text: Supabase.instance.client.auth.currentUser?.userMetadata?['full_name']
            ?.split(" ")
            .last ??
        "No Last Name",
  );
  final TextEditingController emailController = TextEditingController(
    text: Supabase.instance.client.auth.currentUser?.email ?? "No Email",
  );
  final supabase = Supabase.instance.client;
  List<dynamic> reservations = [];
  bool isLoading = true;
  Future<List<dynamic>> fetchUsers() async {
    final response = await Supabase.instance.client
        .from('reservations')
        .select("*")
        .order('created_at', ascending: false);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final dynamic stops = int.tryParse(widget.train['stopin'].toString()) ?? 0;
    final double price = stops * 30.0;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Bar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان وزر الرجوع
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 0, right: 2),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Complete your\nBooking',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.sp),
                                ),
                                Text(
                                  'Please fill in your details \nto complete the booking',
                                  style: TextStyle(fontSize: 14.sp),
                                )
                              ],
                            ),
                          ])),
                  // فورم البيانات
                  Container(
                    height: 630.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(
                              25, 41, 161, 212), // Transparent blue
                          Colors.white, // White
                        ],
                        stops: [
                          0.0,
                          0.2
                        ], // Adjust the stops for the gradient effect
                      ),
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
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Passenger Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.sp),
                            ),
                            Text(
                              "Enter your personal information",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        Spacer(),

                        _buildTextField(
                            controller: firstNameController,
                            label: "First Name",
                            hint: '',
                            icon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            }),
                        _buildTextField(
                            controller: lastNameController,
                            label: "Last Name",
                            hint: '',
                            icon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            }),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: TextFormField(
                            controller: _passengersController,
                            decoration: InputDecoration(
                              labelText: 'Number of Passengers',
                              hintText: '1',
                              prefixIcon: Icon(Icons.people),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              final n = int.tryParse(value);
                              if (n != null && n >= 1) {
                                setState(() {
                                  _passengerCount = n;
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the number of passengers';
                              }
                              final n = num.tryParse(value);
                              if (n == null) {
                                return 'Please enter a valid number';
                              }
                              if (n < 1) {
                                return 'Number of passengers must be at least 1';
                              }
                              return null;
                            },
                          ),
                        ),
                        _buildTextField(
                            controller: emailController,
                            label: 'Email',
                            hint: 'example@gmail.com',
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            }),
                        _buildTextField(
                          controller: phoneController,
                          label: 'Phone Number',
                          hint: 'Please enter your phone number',
                          icon: Icons.phone,
                          prefixText: '+20 ',
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),

                        /// ⬇ فيلد تاريخ السفر المعدل
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: TextFormField(
                            controller: _dateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Date of Travel',
                              hintText: 'Select your travel date',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onTap: () async {
                              DateTime now = DateTime.now();
                              DateTime tomorrow = now.add(Duration(days: 1));

                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: tomorrow,
                                firstDate: tomorrow,
                                lastDate: DateTime(now.year + 1),
                              );

                              if (pickedDate != null) {
                                String formattedDate =
                                    "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                                setState(() {
                                  _dateController.text = formattedDate;
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a travel date';
                              }
                              return null;
                            },
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    height: 360.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(
                              25, 41, 161, 212), // Transparent blue
                          Colors.white, // White
                        ],
                        stops: [
                          0.0,
                          0.2
                        ], // Adjust the stops for the gradient effect
                      ),
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
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Payment Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.sp),
                            ),
                            Text(
                              "Enter your card details securely",
                              style: TextStyle(fontSize: 14.sp),
                            )
                          ],
                        ),
                        Spacer(),
                        _buildTextField(
                          controller: cardController,
                          label: 'Card Number',
                          hint: '',
                          icon: Icons.credit_card,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your card number';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          controller: fullNameController,
                          label: 'Cardholder Name',
                          hint: 'Enter cardholder name',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter cardholder name';
                            }
                            return null;
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(
                                controller: yearController,
                                label: 'Expiry Date',
                                hint: '18/30',
                                icon: Icons.calendar_month,
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter expiry date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: _buildTextField(
                                controller: cvvController,
                                label: 'CVV',
                                hint: '123',
                                icon: Icons.lock,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter CVV';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Container(
                      height: 515.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(
                                25, 41, 161, 212), // Transparent blue
                            Colors.white, // White
                          ],
                          stops: [
                            0.0,
                            0.2
                          ], // Adjust the stops for the gradient effect
                        ),
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
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Booking summary",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.sp),
                              ),
                              Text(
                                "Review your booking details",
                                style: TextStyle(fontSize: 14.sp),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Train',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Container(
                                      width: 80.w,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            60, 41, 161, 212),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: widget.train['level'] != null
                                            ? Text(
                                                "${widget.train['level']}",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 49, 73, 117),
                                                ),
                                                textAlign: TextAlign.center,
                                              )
                                            : SizedBox(
                                                height: 20,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.train['trainFrom']} ",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: const Color.fromARGB(
                                              255, 86, 86, 86)),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 18.sp,
                                      color:
                                          const Color.fromARGB(255, 86, 86, 86),
                                    ),
                                    Text(
                                      " ${widget.train['trainTo']} ",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: const Color.fromARGB(
                                              255, 86, 86, 86)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " ${widget.train['go']} - ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color.fromARGB(
                                              255, 86, 86, 86)),
                                    ),
                                    Text(
                                      " ${widget.train['arrive']} ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color.fromARGB(
                                              255, 86, 86, 86)),
                                    ),
                                    Text(
                                      " (${widget.train['time']} Hours)  ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color.fromARGB(
                                              255, 86, 86, 86)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Passengers: $_passengerCount ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color.fromARGB(
                                              255, 86, 86, 86)),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Price ",
                                                style: TextStyle(
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              ),
                                              TextSpan(
                                                text: "for 1 Passengers ",
                                                style: TextStyle(
                                                    fontSize: 17.sp,
                                                    color: const Color.fromARGB(
                                                        255, 60, 195, 249)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Ticket price",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Text(
                                          "$price",
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold)),
                                        Text(calculateTotalPrice().toString(),
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    mainbutton(
                                        text1: "Complete Booking",
                                        onPressed: _confirmBooking),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  // ويدجت مساعدة لبناء الفيلدات
  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    String? prefixText,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixText: prefixText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
