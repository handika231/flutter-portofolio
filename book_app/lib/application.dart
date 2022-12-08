import 'package:book_app/controller/main_notifier.dart';
import 'package:book_app/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainNotifier(),
        ),
      ],
      child: const MaterialApp(
        home: MainView(),
        debugShowCheckedModeBanner: false,
        title: 'Ebook App',
      ),
    );
  }
}
