import 'package:dart_frog/dart_frog.dart';
import '../cubits/test_types_cubit.dart';

final _testTypesCubit = TestTypesCubit();

final testTypesProvider = provider<TestTypesCubit>((_) => _testTypesCubit);
