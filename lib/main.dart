import 'package:chat_test_task/common/repositories/message_repository.dart';
import 'package:chat_test_task/presentation/common/app_colors.dart';
import 'package:chat_test_task/presentation/features/chat/bloc/message_cubit.dart';
import 'package:chat_test_task/presentation/features/chat/pages/virtual_assistant_chat_page.dart';
import 'package:chat_test_task/presentation/features/chat/pages/web_socket_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terralink Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.ultramarineBlue),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.ghostWhite,
      ),
      home: BlocProvider(
        create: (_) => MessageCubit(
          messageRepository: MessageRepository(),
          messages: List.empty(),
        )..init(),
        child: const DefaultTabController(
          length: 2,
          child: Scaffold(
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.language_outlined)),
                Tab(child: Icon(Icons.flutter_dash_outlined)),
              ],
            ),
            body: TabBarView(
              children: [
                WebSocketChatPage(),
                VirtualAssistantChatPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
