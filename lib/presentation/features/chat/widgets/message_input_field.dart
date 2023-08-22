import 'package:chat_test_task/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class MessageInputField extends StatefulWidget {
  const MessageInputField({
    super.key,
    required this.onMessageSend,
    this.initText = '',
  });
  final String initText;
  final void Function({required String message}) onMessageSend;

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  late final TextEditingController _textEditingController =
      TextEditingController(text: widget.initText);

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22.0,
        right: 22.0,
        bottom: 18,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.uclaBlue.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.athensGray),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  )),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                onSubmitted: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  widget.onMessageSend(message: value);
                  _textEditingController.clear();
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 22,
                    top: 20,
                    bottom: 20,
                  ),
                  hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cadetGrey,
                      ),
                  border: InputBorder.none,
                  hintText: 'Напишите ваше сообщение',
                  suffixIcon: SendMessageButton(
                    onPressed: () {
                      if (_textEditingController.text.isEmpty) {
                        return;
                      }
                      widget.onMessageSend(
                        message: _textEditingController.text,
                      );
                      _textEditingController.clear();
                    },
                  ),
                ),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.cadetGrey,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        'assets/icons/send.png',
        height: 24,
        width: 24,
      ),
    );
  }
}
