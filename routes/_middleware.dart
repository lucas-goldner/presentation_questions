import 'package:dart_frog/dart_frog.dart';

import '../middleware/test_types_provider.dart';
import '../middleware/testing_question_provider.dart';

Handler middleware(Handler handler) =>
    handler.use(testingQuestionProvider).use(testTypesProvider);
