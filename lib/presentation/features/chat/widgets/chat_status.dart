import 'package:chat_test_task/presentation/common/app_colors.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/chat_app_bar.dart';
import 'package:flutter/material.dart';

class ChatStatus extends StatelessWidget {
  const ChatStatus({
    super.key,
    required this.model,
  });

  final Chat model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: model.isOnline
                  ? AppColors.persianGreen
                  : AppColors.independence,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  3,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              model.isOnline ? 'Online' : 'Offline',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    color: model.isOnline
                        ? AppColors.persianGreen
                        : AppColors.independence,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
