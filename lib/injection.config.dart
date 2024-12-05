// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:indriver_rosa/src/data/dataSource/local/SharefPref.dart'
    as _i860;
import 'package:indriver_rosa/src/data/dataSource/remote/services/AuthService.dart'
    as _i255;
import 'package:indriver_rosa/src/di/AppModule.dart' as _i1066;
import 'package:indriver_rosa/src/domain/repository/AuthRepository.dart'
    as _i565;
import 'package:indriver_rosa/src/domain/useCases/auth/AuthUseCases.dart'
    as _i682;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i860.SharefPref>(() => appModule.sharefPref);
    gh.factory<_i255.Authservice>(() => appModule.authService);
    gh.factory<_i565.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i682.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i1066.AppModule {}
