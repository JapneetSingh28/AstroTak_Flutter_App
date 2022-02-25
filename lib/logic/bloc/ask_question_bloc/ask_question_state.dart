part of 'ask_question_bloc.dart';

abstract class AskQuestionState extends Equatable {
  const AskQuestionState();
}

class AskQuestionLoadingState extends AskQuestionState {
  @override
  List<Object> get props => [];
}

class AskQuestionErrorState extends AskQuestionState {
  final String errorMessage;

  const AskQuestionErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class AskQuestionLoadedState extends AskQuestionState {
  final AskQuestionModel selectedTagData;
  final List<AskQuestionModel> allAskQuestionsData;

  const AskQuestionLoadedState(this.selectedTagData, this.allAskQuestionsData);

  @override
  List<Object?> get props => [selectedTagData, allAskQuestionsData];
}
