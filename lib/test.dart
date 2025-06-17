import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  final supabase = Supabase.instance.client;
  String? origin, destination;
  int trainCount = 0;
  List<String> stations = [];
  List<dynamic> trainResults = [];
  bool isLoadingStations = false;
  bool isLoadingTrains = false;

  Future<List<dynamic>> fetchUserReservations() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user != null) {
      final List reservations = await supabase
          .from('reservations')
          .select('*')
          .eq('userId', user.id)
          .order('created_at', ascending: false);

      return reservations;
    } else {
      throw Exception('اليوزر مش مسجل دخول');
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
      appBar: AppBar(title: const Text('حجوزاتي')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUserReservations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {}

          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }

          final reservations = snapshot.data;

          if (reservations == null || reservations.isEmpty) {
            return const Center(child: Text('لا توجد حجوزات'));
          }

          return ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              final res = reservations[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text('من: $destination',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text('الي: $origin',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.people, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text('عدد الركاب: ${res['numPassengers']}',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.attach_money,
                                  color: Colors.grey),
                              const SizedBox(width: 8),
                              Text('السعر الكلي: ${res['totalPrice']} ج.م',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add your action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('عرض التفاصيل'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
