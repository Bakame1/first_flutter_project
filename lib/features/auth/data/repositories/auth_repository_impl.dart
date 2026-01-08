

import 'dart:math';

import 'package:first_flutter_project/core/error/exceptions.dart';
import 'package:first_flutter_project/core/error/failures.dart';
import 'package:first_flutter_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:first_flutter_project/features/auth/domain/entities/user.dart';
import 'package:first_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password
  }) async {

    return _getUser(() async => await remoteDataSource.loginWithEmailAndPassword(
          email: email,
          password: password
    ));


  }
//reusable function
  Future<Either<Failure, User>> _getUser(
      Future<User> Function() fn
      )

  async{
    try{
      final user = await fn();

      return right(user);

    } on ServerException catch (e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password}) async {

    return _getUser(() async => await remoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password
    ));

  }

}