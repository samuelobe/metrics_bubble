import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bubble_state.dart';

class BubbleCubit extends Cubit<BubbleState> {
  BubbleCubit() : super(BubbleInitial());
}
