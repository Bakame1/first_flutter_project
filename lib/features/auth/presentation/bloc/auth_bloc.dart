import 'package:first_flutter_project/core/usecase/usecase.dart';
import 'package:first_flutter_project/features/auth/domain/entities/user.dart';
import 'package:first_flutter_project/features/auth/domain/usecases/current_user.dart';
import 'package:first_flutter_project/features/auth/domain/usecases/user_login.dart';
import 'package:first_flutter_project/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;//private var
  final UserLogin _userLogin;
  final CurrentUser _currentUser;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
}) :_userSignUp = userSignUp,
      _userLogin = userLogin,
      _currentUser = currentUser,
        super(AuthInitial()) {

    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn (
      AuthIsUserLoggedIn event,
      Emitter<AuthState>emit,
      )async{
    final res = await _currentUser(NoParams());

    res.fold(
          (failure) {
        emit(AuthFailure(failure.message));
      },
          (user) {
            print ('✅ EMAIL : UID: ${user.name}');
            emit(AuthSuccess(user));
      },
    );
  }



  void _onAuthSignUp (AuthSignUp event, Emitter<AuthState>emit,)async{
      //print('🔵 BLOC : EVENT RECEIVED ! Email: ${event.email}');
      emit(AuthLoading());//we are loading state

      final res = await _userSignUp(UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name
      ));


      res.fold(
            (failure) {
          //print('❌ ERROR BLOC : ${l.message}');
          emit(AuthFailure(failure.message));
        },
            (user) {
          //print('✅ SUCCESS BLOC : UID: $r');
          emit(AuthSuccess(user));
        },
      );
    }

  void _onAuthLogin (AuthLogin event, Emitter<AuthState>emit)async{
    //print('🔵 BLOC : EVENT RECEIVED ! Email: ${event.email}');
    emit(AuthLoading());//we are loading state

    final res = await _userLogin(UserLoginParams(
        email: event.email,
        password: event.password,
    ));


    res.fold(
          (failure) {
        //print('❌ ERROR BLOC : ${l.message}');
        emit(AuthFailure(failure.message));
      },
          (user) {
        //print('✅ SUCCESS BLOC : UID: $r');
        emit(AuthSuccess(user));
      },
    );
  }

}
