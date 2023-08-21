import 'package:chat_test_task/presentation/common/app_colors.dart';
import 'package:chat_test_task/presentation/common/app_constant.dart';
import 'package:chat_test_task/presentation/features/chat/models/menu_message.dart';
import 'package:flutter/material.dart';

class MenuMessageBubble extends StatelessWidget {
  const MenuMessageBubble({
    super.key,
    required this.model,
  });

  final MenuMessage model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 8.0,
                        right: 20,
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
                    Wrap(
                      children: [
                        ...model.items.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextButton(
                              onPressed: e.call,
                              child: Text(e.title),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
