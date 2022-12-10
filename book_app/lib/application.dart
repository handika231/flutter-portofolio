import 'package:book_app/controller/main_notifier.dart';
import 'package:book_app/injector.dart';
import 'package:book_app/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => getIt<MainNotifier>(),
            ),
          ],
          child: const MaterialApp(
            home: MainView(),
            debugShowCheckedModeBanner: false,
            title: 'Ebook App',
          ),
        );
      },
    );
  }
}
