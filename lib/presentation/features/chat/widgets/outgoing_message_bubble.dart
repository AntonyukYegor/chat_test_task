import 'package:chat_test_task/presentation/common/app_colors.dart';
import 'package:chat_test_task/presentation/features/chat/models/outgoing_message.dart';
import 'package:flutter/material.dart';

class OutgoingMessageBubble extends StatefulWidget {
  const OutgoingMessageBubble({
    super.key,
    required this.model,
  });
  final OutgoingMessage model;
  @override
  State<OutgoingMessageBubble> createState() => _OutgoingMessageBubbleState();
}

class _OutgoingMessageBubbleState extends State<OutgoingMessageBubble> {
  bool isTapHold = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapHold = !isTapHold;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 80,
              ),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: isTapHold
                        ? AppColors.ultramarineBlue
                        : AppColors.cadetGrey,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    )),
                duration: const Duration(milliseconds: 150),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 19,
                    top: 11.0,
                    right: 19,
                    bottom: 11.0,
                  ),
                  child: Text(
                    widget.model.content,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
