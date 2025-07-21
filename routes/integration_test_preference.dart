import 'package:dart_frog/dart_frog.dart';

import '../cubits/integration_test_preference_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final vote = body['vote'] as int?;

  if (vote == null) {
    return Response(statusCode: 400, body: 'Invalid vote');
  }

  final cubit = context.read<IntegrationTestPreferenceCubit>();

  if (vote == 1) {
    cubit.voteYes();
  } else if (vote == 0) {
    cubit.voteNo();
  } else {
    return Response(statusCode: 400, body: 'Invalid vote');
  }

  return Response(body: 'Vote received: $vote');
}