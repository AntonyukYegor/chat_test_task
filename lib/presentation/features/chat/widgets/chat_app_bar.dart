import 'package:chat_test_task/presentation/common/app_colors.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/chat_status.dart';
import 'package:flutter/material.dart';

class Chat {
  final String name;
  final bool isOnline;

  Chat({
    required this.name,
    this.isOnline = true,
  });
}

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required this.model,
  }) : preferredSize = const Size.fromHeight(68);

  @override
  final Size preferredSize;

  final Chat model;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      elevation: 0,
      flexibleSpace: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 21,
            right: 21,
            bottom: 19,
          ),
          child: SizedBox(
            height: 52,
            child: Row(children: [
              CircleAvatar(
                backgroundColor: AppColors.lightSilver,
                radius: 26,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        model.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: AppColors.independence,
                            ),
                      ),
                    ),
                    ChatStatus(
                      model: model,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
