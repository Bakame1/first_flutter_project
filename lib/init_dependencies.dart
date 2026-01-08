import 'package:first_flutter_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:first_flutter_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:first_flutter_project/features/auth/domain/usecases/user_login.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/secrets/app_secrets.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/user_sign_up.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';


//globally
final servicesLocator = GetIt.instance;

// Initialize dependencies here
Future<void> initDependencies() async {
  _initAuth();// help to init auth dependencies

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  //register lazy singleton means only one instance will be created and shared
  servicesLocator.registerLazySingleton(()=>supabase.client);//
  //.registerFactory = new instance every time
}

//we just follow was we put in the main.dart
void _initAuth(){
  // for AuthRemoteDataSourceImpl
  servicesLocator..registerFactory<AuthRemoteDataSource>(
          ()=> AuthRemoteDataSourceImpl(
            servicesLocator(),//brand new ressource every time
          ),
  )
  // repository
  ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        servicesLocator(),
      ),
  )

  //Usecases
  ..registerFactory(
        () => UserSignUp(
      servicesLocator(),
    ),  )


  ..registerFactory(
        () => UserLogin(
      servicesLocator(),
    ),  )
    //Bloc
  //AuthBloc with registerLazySingleton to have only one instance
  ..registerLazySingleton(
        () => AuthBloc(
          userSignUp: servicesLocator(),
          userLogin: servicesLocator(),

    ),
  );
}

