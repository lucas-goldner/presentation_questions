import 'package:dart_frog/dart_frog.dart';
import '../cubits/integration_test_preference_cubit.dart';

final _integrationTestPreferenceCubit = IntegrationTestPreferenceCubit();

final integrationTestPreferenceProvider =
    provider<IntegrationTestPreferenceCubit>(
  (_) => _integrationTestPreferenceCubit,
);