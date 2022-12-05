// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../repository/repository_components.dart' as _i8;
import '../repository/repository_retailer.dart' as _i9;
import '../repository/repository_wholesaler.dart' as _i10;
import '../services/auth_service/auth_service.dart' as _i3;
import '../services/connectivity/connectivity.dart' as _i4;
import '../services/local_data/local_data.dart' as _i5;
import '../services/navigation/navigationService.dart' as _i6;
import '../services/network/network_info.dart' as _i7;
import '../services/network/web_service.dart' as _i12;
import '../services/storage/deviceStorage.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final deviceStorageServiceAbstract = _$DeviceStorageServiceAbstract();
  gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService());
  gh.lazySingleton<_i4.ConnectivityService>(() => _i4.ConnectivityService());
  gh.lazySingleton<_i5.LocalData>(() => _i5.LocalData());
  gh.lazySingleton<_i6.NavigationService>(() => _i6.NavigationService());
  gh.lazySingleton<_i7.NetworkInfoService>(() => _i7.NetworkInfoService());
  gh.lazySingleton<_i8.RepositoryComponents>(() => _i8.RepositoryComponents());
  gh.lazySingleton<_i9.RepositoryRetailer>(() => _i9.RepositoryRetailer());
  gh.lazySingleton<_i10.RepositoryWholesaler>(
      () => _i10.RepositoryWholesaler());
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => deviceStorageServiceAbstract.preferences,
    preResolve: true,
  );
  gh.lazySingleton<_i12.WebService>(() => _i12.WebService());
  gh.singleton<_i13.ZDeviceStorage>(_i13.ZDeviceStorage());
  return get;
}

class _$DeviceStorageServiceAbstract
    extends _i13.DeviceStorageServiceAbstract {}
