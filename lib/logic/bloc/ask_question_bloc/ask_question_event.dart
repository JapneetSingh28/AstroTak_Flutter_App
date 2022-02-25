part of 'ask_question_bloc.dart';

abstract class AskQuestionEvent extends Equatable {
  const AskQuestionEvent();
}

class AskQuestionFetchEvent extends AskQuestionEvent {
  @override
  List<Object?> get props => [];
}

class AskQuestionFilterEvent extends AskQuestionEvent {
  final int tagIndex;
  final List<AskQuestionModel> allAskQuestionsData;

  const AskQuestionFilterEvent(
      {required this.tagIndex, required this.allAskQuestionsData});

  @override
  List<Object?> get props => [tagIndex, allAskQuestionsData];
}
