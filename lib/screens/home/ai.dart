import 'package:egyrailwayes/constants/bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ai extends StatefulWidget {
  const Ai({super.key});

  @override
  State<Ai> createState() => _AiState();
}

class _AiState extends State<Ai> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  bool isLoading = false;

  Future<void> _sendMessage() async {
    final question = _controller.text.trim();
    if (question.isEmpty) return;

    setState(() {
      messages.add({'role': 'user', 'text': question});
      isLoading = true;
      _controller.clear();
    });

    try {
      final answer = await
          // RailBuddyService.getTrainAnswer
          (question);
      setState(() {
        messages.add({
          'role': 'bot',
          'text': """Well, aren't you in luck! Train NO.
419 departs from cairo to Aswan. It leaves at 4:00 and arrives at 10:00, making the journey a grand total of 6 hours. This train is classified as a Sleeper and makes 7 stops along the way. It also cruises at a blistering speed of 80 km/h."""
        });
      });
    } catch (e) {
      setState(() {
        messages.add({'role': 'bot', 'text': 'حصل خطأ: $e'});
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(15.r),
                          topEnd: Radius.circular(15.r),
                          bottomEnd: Radius.circular(15.r),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Hello! How can i help you today?",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    )),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['role'] == 'user';

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    constraints: BoxConstraints(maxWidth: 250.w),
                    decoration: BoxDecoration(
                      color: isUser
                          ? const Color.fromARGB(255, 3, 106, 191)
                          : Colors.grey[300],
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(15.r),
                        topEnd: Radius.circular(15.r),
                        bottomStart: Radius.circular(isUser ? 15.r : 0),
                        bottomEnd: Radius.circular(isUser ? 0 : 15.r),
                      ),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: isUser ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),

          if (isLoading)
            Padding(
              padding: EdgeInsets.all(10.h),
              child: CircularProgressIndicator(),
            ),

          // الأسئلة المقترحة
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                ' schedule from cairo to aswan ?',
                ' there is a online payment ?'
              ].map((question) {
                return ActionChip(
                  backgroundColor: const Color.fromARGB(255, 148, 148, 148),
                  label: Text(
                    question,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  onPressed: () async {
                    setState(() {
                      messages.add({'role': 'user', 'text': question});
                      isLoading = true;
                    });

                    try {
                      final answer = await
                          // RailBuddyService.getTrainAnswer
                          (question);
                      setState(() {
                        messages.add({
                          'role': 'bot',
                          'text':
                              "yes , there is a online payments with google pay, apple pay, vodafone cash, visa,  mastercard  "
                        });
                      });
                    } catch (e) {
                      setState(() {
                        messages.add({'role': 'bot', 'text': 'حصل خطأ: $e'});
                      });
                    } finally {
                      setState(() => isLoading = false);
                    }
                  },
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 10.h),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                  width: 290.w,
                  height: 50.h,
                  child: TextFormField(
                    controller: _controller,
                    cursorColor: Colors.cyan,
                    cursorWidth: 1.w,
                    cursorHeight: 30.h,
                    decoration: InputDecoration(
                      hintText: "Type your Message...",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide:
                            BorderSide(color: Colors.cyan, width: 0.8.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide:
                            BorderSide(color: Colors.grey, width: 0.8.w),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 3.w, bottom: 3.h),
                  margin: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.cyan,
                  ),
                  child: Transform.rotate(
                    angle: -0.5,
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: _sendMessage,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
