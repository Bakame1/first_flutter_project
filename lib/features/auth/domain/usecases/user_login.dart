import 'package:first_flutter_project/core/error/failures.dart';
import 'package:first_flutter_project/core/usecase/usecase.dart';
import 'package:first_flutter_project/features/auth/domain/entities/user.dart';
import 'package:first_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserLogin implements UseCase<User,UserLoginParams>{
  final AuthRepository authRepository;
  const UserLogin(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async{
    return authRepository.loginWithEmailAndPassword(
        email: params.email,
        password: params.password
    );

  }



}

class UserLoginParams{
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}