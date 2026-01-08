import 'package:first_flutter_project/features/auth/domain/entities/user.dart';
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
      //print('🔵 BLOC : EVENT RECEIVED ! Email: ${event.email}');
      emit(AuthLoading());

      final res = await _userSignUp(UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name
      ));
      res.fold(
            (l) {
              //print('❌ ERROR BLOC : ${l.message}');
              emit(AuthFailure(l.message));
        },
            (user) {
              //print('✅ SUCCESS BLOC : UID: $r');
              emit(AuthSuccess(user));
        },
      );
    });
  }
}
