import 'package:broadcast_bloc/broadcast_bloc.dart';
import '../models/test_types.dart';

class TestTypesCubit extends BroadcastCubit<TestTypes> {
  TestTypesCubit() : super(TestTypes());

  void voteUnitTest() {
    emit(state.copyWith(unitTests: state.unitTests + 1));
  }

  void voteWidgetTest() {
    emit(state.copyWith(widgetTests: state.widgetTests + 1));
  }

  void voteIntegrationTest() {
    emit(state.copyWith(integrationTests: state.integrationTests + 1));
  }

  void reset() {
    emit(TestTypes());
  }
}
