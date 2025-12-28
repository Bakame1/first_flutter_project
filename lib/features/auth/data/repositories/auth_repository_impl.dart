

import 'package:first_flutter_project/core/error/exceptions.dart';
import 'package:first_flutter_project/core/error/failures.dart';
import 'package:first_flutter_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:first_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password}) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailAndPassword(
          name: name,
          email: email,
          password: password
      );
      return right(userId);//Not just a direct string
    } on ServerException catch (e) {

      return left(Failure(e.message));
    }
  }

}