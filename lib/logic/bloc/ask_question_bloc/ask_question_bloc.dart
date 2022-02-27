import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/ask_question_model.dart';
import '../../../data/services/ask_question_service.dart';
import '../../../data/services/connectivity_service.dart';

part 'ask_question_event.dart';

part 'ask_question_state.dart';

class AskQuestionBloc extends Bloc<AskQuestionEvent, AskQuestionState> {
  final AskQuestionService askQuestionService;

  final ConnectivityService connectivityService;

  AskQuestionBloc({
    required this.askQuestionService,
    required this.connectivityService,
  }) : super(AskQuestionLoadingState()) {
    connectivityService.connectivityStream.stream.listen((event) async {
      if (event == ConnectivityResult.none) {
        add(AskQuestionNoInternetEvent());
      } else {
        add(AskQuestionFetchEvent());
      }
    });
    on<AskQuestionFetchEvent>(_onAskQuestionFetchEvent);
    on<AskQuestionChangeCategoryEvent>(_onAskQuestionChangeCategoryEvent);
    on<AskQuestionNoInternetEvent>(_onAskQuestionNoInternetEvent);
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

  Future<void> _onAskQuestionChangeCategoryEvent(
      AskQuestionChangeCategoryEvent event,
      Emitter<AskQuestionState> emit) async {
    emit(AskQuestionLoadingState());

    emit(AskQuestionLoadedState(event.allAskQuestionsData[event.categoryIndex],
        event.allAskQuestionsData));
  }

  Future<void> _onAskQuestionNoInternetEvent(
      AskQuestionNoInternetEvent event, Emitter<AskQuestionState> emit) async {
    emit(AskQuestionNoInternetState());
  }
}
