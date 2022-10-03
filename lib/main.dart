import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/api/api.dart';

import 'cubit/cubit.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

   final apiUser = ApiUser();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) =>
          UserCubit(apiUser),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('User List'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );

  }
}

