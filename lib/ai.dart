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
      final answer = await RailBuddyService.getTrainAnswer(question);
      setState(() {
        messages.add({'role': 'bot', 'text': answer});
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
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h, horizontal: 14.w),
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    constraints: BoxConstraints(maxWidth: 250.w),
                    decoration: BoxDecoration(
                      color:
                          isUser ? Colors.cyan[100] : Colors.grey[300],
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(12.r),
                        topEnd: Radius.circular(12.r),
                        bottomStart:
                            Radius.circular(isUser ? 12.r : 0),
                        bottomEnd:
                            Radius.circular(isUser ? 0 : 12.r),
                      ),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(fontSize: 16.sp),
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
                'مواعيد القطارات من القاهرة لأسوان',
                'كام سعر التذكرة في الدرجة الأولى؟',
                'هل في قطر بكرة الصبح؟',
                'القطر بيتأخر؟',
              ].map((question) {
                return ActionChip(
                  backgroundColor: Colors.grey[200],
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
                      final answer = await RailBuddyService.getTrainAnswer(question);
                      setState(() {
                        messages.add({'role': 'bot', 'text': answer});
                      });
                    } catch (e) {
                      setState(() {
                        messages.add({
                          'role': 'bot',
                          'text': 'حصل خطأ: $e'
                        });
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
                  margin:
                      EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
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
                  margin:
                      EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
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