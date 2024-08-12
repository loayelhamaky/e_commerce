// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce_app/data/data_sources/local_ds/local_ds.dart'
    as _i629;
import 'package:e_commerce_app/data/data_sources/local_ds/local_ds_impl.dart'
    as _i508;
import 'package:e_commerce_app/data/data_sources/remote_ds/remote_ds.dart'
    as _i852;
import 'package:e_commerce_app/data/data_sources/remote_ds/remote_ds_impl.dart'
    as _i1065;
import 'package:e_commerce_app/data/utils/shared_prefs_utils.dart' as _i709;
import 'package:e_commerce_app/domain/repos/auth_repo/auth_repo.dart' as _i499;
import 'package:e_commerce_app/domain/repos/auth_repo/auth_repo_impl.dart'
    as _i1030;
import 'package:e_commerce_app/domain/repos/cart_repo/cart_repo.dart' as _i267;
import 'package:e_commerce_app/domain/repos/cart_repo/cart_repo_impl.dart'
    as _i238;
import 'package:e_commerce_app/domain/repos/main_repo/main_repo.dart' as _i653;
import 'package:e_commerce_app/domain/repos/main_repo/main_repo_impl.dart'
    as _i454;
import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/login_vm.dart'
    as _i224;
import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/register_vm.dart'
    as _i581;
import 'package:e_commerce_app/presentation/main_screen/main_vm/main_vm.dart'
    as _i951;
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/home/vm/home_vm.dart'
    as _i612;
import 'package:e_commerce_app/third_party_packages_module.dart' as _i22;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

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
    final thirdPartyPackagesModule = _$ThirdPartyPackagesModule();
    gh.factory<_i709.SharedPrefsUtils>(() => _i709.SharedPrefsUtils());
    gh.factory<_i951.MainVm>(() => _i951.MainVm());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => thirdPartyPackagesModule.internetConnectionChecker);
    gh.factory<_i267.CartRepo>(() => _i238.CartRepoImpl());
    gh.factory<_i629.AuthLocalDs>(() => _i508.AuthLocalDsImpl());
    gh.factory<_i852.AuthRemoteDs>(
        () => _i1065.AuthRemoteDsImpl(gh<_i709.SharedPrefsUtils>()));
    gh.factory<_i499.AuthRepo>(() => _i1030.AuthRepoImpl(
          gh<_i629.AuthLocalDs>(),
          gh<_i852.AuthRemoteDs>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i653.MainRepo>(() => _i454.CategoriesRepoImpl(
          gh<_i852.AuthRemoteDs>(),
          gh<_i629.AuthLocalDs>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i612.HomeVm>(() => _i612.HomeVm(gh<_i653.MainRepo>()));
    gh.singleton<_i224.LoginVm>(() => _i224.LoginVm(
          gh<_i499.AuthRepo>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.singleton<_i581.RegisterVm>(() => _i581.RegisterVm(
          gh<_i499.AuthRepo>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    return this;
  }
}

class _$ThirdPartyPackagesModule extends _i22.ThirdPartyPackagesModule {}
