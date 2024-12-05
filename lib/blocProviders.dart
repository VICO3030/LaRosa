import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_rosa/injection.dart';
import 'package:indriver_rosa/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';

List<BlocProvider>  blocProviders = [
  BlocProvider<LoginBloc>(create: (context)=> LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(create: (context)=> RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
];