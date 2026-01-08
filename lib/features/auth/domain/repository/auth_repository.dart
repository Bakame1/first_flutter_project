import 'package:first_flutter_project/core/error/failures.dart';
import 'package:first_flutter_project/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure,User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future <Either<Failure,User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}