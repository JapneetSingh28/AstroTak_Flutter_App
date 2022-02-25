import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/ask_question_model.dart';
import '../../../data/services/ask_question_service.dart';

part 'ask_question_event.dart';
part 'ask_question_state.dart';

class AskQuestionBloc extends Bloc<AskQuestionEvent, AskQuestionState> {
  final AskQuestionService askQuestionService;

  AskQuestionBloc({required this.askQuestionService})
      : super(AskQuestionLoadingState()) {
    on<AskQuestionFetchEvent>(_onAskQuestionFetchEvent);
    on<AskQuestionFilterEvent>(_onAskQuestionFilterEvent);
  }

  Future<void> _onAskQuestionFetchEvent(
      AskQuestionFetchEvent event, Emitter<AskQuestionState> emit) async {
    emit(AskQuestionLoadingState());
    final allAskQuestionsData = await askQuestionService.fetchAskQuestions();

    if (allAskQuestionsData.isNotEmpty) {
      emit(AskQuestionLoadedState(allAskQuestionsData[0], allAskQuestionsData));
    } else {
      emit(const AskQuestionErrorState(
          'Something went wrong! Try again later.'));
    }
  }

  Future<void> _onAskQuestionFilterEvent(
      AskQuestionFilterEvent event, Emitter<AskQuestionState> emit) async {
    emit(AskQuestionLoadingState());

    emit(AskQuestionLoadedState(
        event.allAskQuestionsData[event.tagIndex], event.allAskQuestionsData));
  }
}
