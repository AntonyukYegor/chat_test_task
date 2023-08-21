import 'package:chat_test_task/presentation/common/app_colors.dart';
import 'package:chat_test_task/presentation/common/app_constant.dart';
import 'package:chat_test_task/presentation/features/chat/models/incoming_message.dart';
import 'package:flutter/material.dart';

class IncomingMessageBubble extends StatelessWidget {
  const IncomingMessageBubble({
    super.key,
    required this.model,
  });

  final IncomingMessage model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 80,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.cultured),
                borderRadius: AppConstants.incomingBubbleBorder,
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 8.0,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      model.content,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.independence,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 16,
                      bottom: 8.0,
                    ),
                    child: Text(
                      model.postfix,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.slateGray,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
