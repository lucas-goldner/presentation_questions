import 'package:dart_frog/dart_frog.dart';

import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

import '../cubits/testing_question_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    final cubit = context.read<TestingQuestionCubit>()..subscribe(channel);

    channel.stream.listen(
      (_) {
        channel.sink.add(cubit.state.toJson());
      },
      onDone: () => cubit.unsubscribe(channel),
    );
  });
  return handler(context);
}
