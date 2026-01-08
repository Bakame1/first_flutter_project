import 'package:first_flutter_project/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

//SuccessType can be anything like List of items, single item, etc.
//Params because we dont know how many parameters we will need to pass to the usecase.
abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure,SuccessType>> call (Params params);

}