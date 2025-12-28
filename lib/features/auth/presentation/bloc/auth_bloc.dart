import 'package:first_flutter_project/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;//private var
  AuthBloc({
    required UserSignUp userSignUp,
}) :_userSignUp = userSignUp,
        super(AuthInitial()) {

    on<AuthSignUp>((event,emit) async{
      final res = await _userSignUp(UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name
      ));
      res.fold(
              (failure) => emit(AuthFailure(failure.message)),
              (success_uid) => emit(AuthSuccess(success_uid)),
      );
    });
  }
}
