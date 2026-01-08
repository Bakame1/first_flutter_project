import 'package:first_flutter_project/core/common/entities/user.dart';
import 'package:first_flutter_project/core/error/failures.dart';
import 'package:first_flutter_project/core/usecase/usecase.dart';
import 'package:first_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);


  @override
  Future<Either<Failure, User>> call(NoParams params) async{
    return await authRepository.currentUser();
  }
}