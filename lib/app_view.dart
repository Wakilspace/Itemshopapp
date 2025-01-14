import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/Blocs/bloc/authentication_bloc.dart';
import 'package:flutter_shop/screens/auth/blocs/sign_in_bloc/bloc/sign_in_bloc.dart';
import 'package:flutter_shop/screens/home/blocs/bloc/get_items_bloc.dart';
import 'package:item_repo/item_repository.dart';

import 'screens/auth/views/welcome_screen.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
        surface: Colors.grey.shade100,
        onSurface: Colors.black,
        primary: Colors.blue,
        onPrimary: Colors.black,
      )),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: ((context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  SignInBloc(context.read<AuthenticationBloc>().userRepository),
            ),
            BlocProvider(
                create: (context) =>
                    GetItemsBloc(FirebaseItemRepo())..add(GetItems())),
          ], child: HomeScreen());
        } else {
          return WelcomeScreen();
        }
      })),
    );
  }
}
