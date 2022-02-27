part of 'ask_question_bloc.dart';

abstract class AskQuestionEvent extends Equatable {
  const AskQuestionEvent();
}

class AskQuestionFetchEvent extends AskQuestionEvent {
  @override
  List<Object?> get props => [];
}

class AskQuestionChangeCategoryEvent extends AskQuestionEvent {
  final int categoryIndex;
  final List<AskQuestionModel> allAskQuestionsData;

  const AskQuestionChangeCategoryEvent(
      {required this.categoryIndex, required this.allAskQuestionsData});

  @override
  List<Object?> get props => [categoryIndex, allAskQuestionsData];
}

class AskQuestionNoInternetEvent extends AskQuestionEvent {
  @override
  List<Object?> get props => [];
}
