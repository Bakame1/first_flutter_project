import 'package:first_flutter_project/core/common/entities/user.dart';
import 'package:first_flutter_project/core/error/failures.dart';
import 'package:first_flutter_project/core/usecase/usecase.dart';
import 'package:first_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

//string for the type of success response
//UserSignUpParams : Because we had to pass multiple parameters to the usecase, we create a params class
class UserSignUp implements UseCase<User,UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async{

    return await authRepository.signUpWithEmailAndPassword(
        name: params.name,
        email: params.email,
        password: params.password
    );
  }

}
class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}