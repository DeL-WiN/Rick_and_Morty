import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/cubit/cubit.dart';

import 'cubit/cubit_state.dart';


class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is LoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Users is Loaded')));
        }
      }),
      builder: (context, state) {

        if (state is EmptyState) {
          final UserCubit userCubit = context.watch<UserCubit>();
          final userState = userCubit.loadingUser();
          return const Center();
        }

        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LoadedState) {
          return Center(
            child: ListView.builder(
                itemCount: state.user?.results.length,
                itemBuilder: (context, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('id: ${state.user?.results[i].id}'),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                state.user!.results[i].image
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Text('Name: ${state.user?.results[i].name}'),
                      Text('Status: ${state.user?.results[i].status}'),
                      Text('Species: ${state.user?.results[i].species}'),
                      Text('Type: ${state.user?.results[i].type}'),
                      Text('Gender: ${state.user?.results[i].gender}'),
                      Text('Origin(name): ${state.user?.results[i].origin.name}'),
                      Text('Origin(url): ${state.user?.results[i].origin.url}'),
                      Text('Location(name): ${state.user?.results[i].location.name}'),
                      Text('Location(url): ${state.user?.results[i].location.url}'),
                      Text('Episode: ${state.user?.results[i].episode}'),
                    ],
                  );
                }),
          );
        }

        if (state is ErrorState) {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
