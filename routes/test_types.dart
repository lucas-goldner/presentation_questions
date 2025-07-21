import 'package:dart_frog/dart_frog.dart';

import '../cubits/test_types_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final testTypes = body['test_types'] as List<dynamic>?;

  if (testTypes == null || testTypes.isEmpty) {
    return Response(statusCode: 400, body: 'Invalid test_types');
  }

  final cubit = context.read<TestTypesCubit>();
  final validTypes = <String>[];

  for (final testType in testTypes) {
    if (testType is! String) continue;

    switch (testType) {
      case 'unit':
        cubit.voteUnitTest();
        validTypes.add(testType);
      case 'widget':
        cubit.voteWidgetTest();
        validTypes.add(testType);
      case 'integration':
        cubit.voteIntegrationTest();
        validTypes.add(testType);
    }
  }

  if (validTypes.isEmpty) {
    return Response(statusCode: 400, body: 'No valid test_types found');
  }

  return Response(body: 'Votes received: ${validTypes.join(', ')}');
}
