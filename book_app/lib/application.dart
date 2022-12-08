import 'package:book_app/cubit/main_cubit.dart';
import 'package:book_app/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
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
