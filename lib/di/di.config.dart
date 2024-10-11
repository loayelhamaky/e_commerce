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
import 'package:e_commerce_app/data/repos_implementation/auth_repo_impl.dart'
    as _i904;
import 'package:e_commerce_app/data/repos_implementation/cart_repo_impl.dart'
    as _i679;
import 'package:e_commerce_app/data/repos_implementation/main_repo_impl.dart'
    as _i491;
import 'package:e_commerce_app/data/repos_implementation/profile_repo_impl.dart'
    as _i781;
import 'package:e_commerce_app/data/repos_implementation/wishlist_repo_impl.dart'
    as _i196;
import 'package:e_commerce_app/data/request_retry_helper/request_retry_helper.dart'
    as _i325;
import 'package:e_commerce_app/data/shared_prefs_utils/shared_prefs_utils.dart'
    as _i650;
import 'package:e_commerce_app/domain/interface_repos/auth_repo.dart' as _i907;
import 'package:e_commerce_app/domain/interface_repos/cart_repo.dart' as _i198;
import 'package:e_commerce_app/domain/interface_repos/main_repo.dart' as _i96;
import 'package:e_commerce_app/domain/interface_repos/profile_repo.dart'
    as _i1041;
import 'package:e_commerce_app/domain/interface_repos/wishlist_repo.dart'
    as _i60;
import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/login_vm/login_vm.dart'
    as _i224;
import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/register_vm.dart'
    as _i581;
import 'package:e_commerce_app/presentation/main_screen/main_vm/main_vm.dart'
    as _i951;
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/cart/vm/cart_vm.dart'
    as _i70;
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/categories/categories_vm/categories_vm.dart'
    as _i377;
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/home/vm/home_vm.dart'
    as _i612;
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/profile/vm/profile_vm.dart'
    as _i445;
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/wishlist/wishlist_vm/wish_list_vm.dart'
    as _i466;
import 'package:e_commerce_app/presentation/main_screen/view/screens/subcategories_products_screen/vm/vm.dart'
    as _i608;
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
    gh.singleton<_i650.SharedPrefsUtils>(() => _i650.SharedPrefsUtils());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => thirdPartyPackagesModule.internetConnectionChecker);
    gh.singleton<_i198.CartRepo>(() => _i679.CartRepoImpl());
    gh.singleton<_i1041.ProfileRepo>(() => _i781.ProfileRepoImpl());
    gh.factory<_i445.ProfileVm>(
        () => _i445.ProfileVm(gh<_i1041.ProfileRepo>()));
    gh.factory<_i852.AuthRemoteDs>(
        () => _i1065.AuthRemoteDsImpl(gh<_i650.SharedPrefsUtils>()));
    gh.singleton<_i60.WishListRepo>(() => _i196.WishlistRepoImpl());
    gh.singleton<_i96.MainRepo>(() => _i491.MainRepoImpl());
    gh.lazySingleton<_i325.RetryRequestHelper>(
        () => _i325.RetryRequestHelper(function: gh<Function>()));
    gh.factory<_i629.AuthLocalDs>(() => _i508.AuthLocalDsImpl());
    gh.factory<_i608.SubCategoryProductsVm>(() => _i608.SubCategoryProductsVm(
          gh<_i60.WishListRepo>(),
          gh<_i198.CartRepo>(),
        ));
    gh.singleton<_i951.MainVm>(() => _i951.MainVm(gh<_i96.MainRepo>()));
    gh.factory<_i907.AuthRepo>(() => _i904.AuthRepoImpl(
          gh<_i629.AuthLocalDs>(),
          gh<_i852.AuthRemoteDs>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.singleton<_i224.LoginVm>(() => _i224.LoginVm(
          gh<_i907.AuthRepo>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.singleton<_i581.RegisterVm>(() => _i581.RegisterVm(
          gh<_i907.AuthRepo>(),
          gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i70.CartVm>(() => _i70.CartVm(
          gh<_i198.CartRepo>(),
          gh<_i951.MainVm>(),
        ));
    gh.factory<_i466.WishListVm>(() => _i466.WishListVm(
          gh<_i60.WishListRepo>(),
          gh<_i951.MainVm>(),
          gh<_i198.CartRepo>(),
        ));
    gh.factory<_i612.HomeVm>(() => _i612.HomeVm(
          gh<_i60.WishListRepo>(),
          gh<_i198.CartRepo>(),
          gh<_i951.MainVm>(),
        ));
    gh.factory<_i377.CategoriesVm>(() => _i377.CategoriesVm(
          gh<_i198.CartRepo>(),
          gh<_i60.WishListRepo>(),
          gh<_i951.MainVm>(),
          gh<_i96.MainRepo>(),
        ));
    return this;
  }
}

class _$ThirdPartyPackagesModule extends _i22.ThirdPartyPackagesModule {}
