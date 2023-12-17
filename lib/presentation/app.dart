import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_db_drift/di/locator.dart';
import 'package:user_db_drift/presentation/cubits/user/user_cubit.dart';
import 'package:user_db_drift/presentation/cubits/user_form/user_form_cubit.dart';
import 'package:user_db_drift/presentation/screens/user_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<UserFormCubit>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            alignLabelWithHint: true,
          ),
        ),
        home: const UserListScreen(),
      ),
    );
  }
}
