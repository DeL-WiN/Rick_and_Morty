import '../api/model.dart';

abstract class UserState {}

class EmptyState extends UserState {}

class LoadingState extends UserState {}

class LoadedState extends UserState {
  User? user;
  LoadedState({
    required this.user,
  });
}

class ErrorState extends UserState {}
