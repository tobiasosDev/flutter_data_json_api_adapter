// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Company _$_$_CompanyFromJson(Map<String, dynamic> json) {
  return _$_Company(
    id: json['id'] as String,
    name: json['name'] as String,
    nasdaq: json['nasdaq'] as String,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    models: json['models'] == null
        ? null
        : HasMany.fromJson(json['models'] as Map<String, dynamic>),
    employees: json['w'] == null
        ? null
        : HasMany.fromJson(json['w'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nasdaq': instance.nasdaq,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'models': instance.models,
      'w': instance.employees,
    };

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, non_constant_identifier_names

mixin $CompanyLocalAdapter on LocalAdapter<Company> {
  @override
  Map<String, Map<String, Object>> relationshipsFor([Company model]) => {
        'models': {
          'name': 'models',
          'inverse': 'company',
          'type': 'models',
          'kind': 'HasMany',
          'instance': model?.models
        },
        'w': {
          'name': 'employees',
          'type': 'employees',
          'kind': 'HasMany',
          'instance': model?.employees,
          'remoteType': 'workers'
        }
      };

  @override
  Company deserialize(map) {
    for (final key in relationshipsFor().keys) {
      map[key] = {
        '_': [map[key], !map.containsKey(key)],
      };
    }
    return Company.fromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model) => model.toJson();
}

// ignore: must_be_immutable
class $CompanyHiveLocalAdapter = HiveLocalAdapter<Company>
    with $CompanyLocalAdapter;

class $CompanyRemoteAdapter = RemoteAdapter<Company>
    with JSONAPIAdapter<Company>, TestMixin<Company>, CaseMixin<Company>;

//

final companyLocalAdapterProvider =
    Provider<LocalAdapter<Company>>((ref) => $CompanyHiveLocalAdapter(ref));

final companyRemoteAdapterProvider = Provider<RemoteAdapter<Company>>(
    (ref) => $CompanyRemoteAdapter(ref.read(companyLocalAdapterProvider)));

final companyRepositoryProvider =
    Provider<Repository<Company>>((ref) => Repository<Company>(ref));

final _watchCompany = StateNotifierProvider.autoDispose
    .family<DataStateNotifier<Company>, WatchArgs<Company>>((ref, args) {
  return ref.watch(companyRepositoryProvider).watchOne(args.id,
      remote: args.remote,
      params: args.params,
      headers: args.headers,
      alsoWatch: args.alsoWatch);
});

AutoDisposeStateNotifierProvider<DataStateNotifier<Company>> watchCompany(
    dynamic id,
    {bool remote = true,
    Map<String, dynamic> params = const {},
    Map<String, String> headers = const {},
    AlsoWatch<Company> alsoWatch}) {
  return _watchCompany(WatchArgs(
      id: id,
      remote: remote,
      params: params,
      headers: headers,
      alsoWatch: alsoWatch));
}

final _watchCompanies = StateNotifierProvider.autoDispose
    .family<DataStateNotifier<List<Company>>, WatchArgs<Company>>((ref, args) {
  ref.maintainState = false;
  return ref.watch(companyRepositoryProvider).watchAll(
      remote: args.remote, params: args.params, headers: args.headers);
});

AutoDisposeStateNotifierProvider<DataStateNotifier<List<Company>>>
    watchCompanies(
        {bool remote,
        Map<String, dynamic> params,
        Map<String, String> headers}) {
  return _watchCompanies(
      WatchArgs(remote: remote, params: params, headers: headers));
}

extension CompanyX on Company {
  /// Initializes "fresh" models (i.e. manually instantiated) to use
  /// [save], [delete] and so on.
  ///
  /// Pass:
  ///  - A `BuildContext` if using Flutter with Riverpod or Provider
  ///  - Nothing if using Flutter with GetIt
  ///  - A Riverpod `ProviderContainer` if using pure Dart
  ///  - Its own [Repository<Company>]
  Company init(container) {
    final repository = container is Repository<Company>
        ? container
        : internalLocatorFn(companyRepositoryProvider, container);
    return repository.internalAdapter.initializeModel(this, save: true)
        as Company;
  }
}

extension CompanyRepositoryX on Repository<Company> {
  Future<Company> loginTest(Company model) =>
      (internalAdapter as TestMixin<Company>).loginTest(model);
}
