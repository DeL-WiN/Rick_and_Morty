import 'package:bloc/bloc.dart';
import 'package:untitled6/api/api.dart';

import '../api/model.dart';
import 'cubit_state.dart';



class UserCubit extends Cubit<UserState> {
  final ApiUser apiUser;
  UserCubit(this.apiUser) : super(EmptyState());

  Future<void> loadingUser() async {
    try{
      emit(LoadingState());
      final User? loadedUserList = await apiUser.getHttp();
      emit(LoadedState(user: loadedUserList));
    }
    catch(_){
      emit(ErrorState());
    }
  }
}
