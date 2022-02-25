import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/relative_model.dart';
import '../../../data/services/relative_service.dart';

part 'relative_event.dart';
part 'relative_state.dart';

class RelativeBloc extends Bloc<RelativeEvent, RelativeState> {
  final RelativeService relativeService;

  RelativeBloc({required this.relativeService})
      : super(RelativeLoadingState()) {
    on<RelativeFetchEvent>(_onRelativeFetchEvent);
    on<RelativeUpdateEvent>(_onRelativeUpdateEvent);
    on<RelativeAddEvent>(_onRelativeAddEvent);
    on<RelativeDeletionEvent>(_onRelativeDeletionEvent);
  }

  Future<void> _onRelativeFetchEvent(
      RelativeFetchEvent event, Emitter<RelativeState> emit) async {
    emit(RelativeLoadingState());
    final allRelativesData = await relativeService.fetchRelativesProfiles();

    if (allRelativesData != null && allRelativesData is RelativeModel) {
      emit(RelativeLoadedState(allRelativesData: allRelativesData));
    } else if (allRelativesData != null &&
        allRelativesData is int &&
        allRelativesData == 200) {
      emit(const RelativeLoadedState(allRelativesData: null));
    } else if (allRelativesData != null && allRelativesData is String) {
      emit(RelativeErrorState(allRelativesData.toString()));
    } else {
      emit(const RelativeErrorState('Something went wrong! Try again later.'));
    }
  }

  Future<void> _onRelativeAddEvent(
      RelativeAddEvent event, Emitter<RelativeState> emit) async {
    emit(RelativeLoadingState());
    final updateRelative = await relativeService.addRelativeProfile(
        postBody: event.addRelativeData);

    if (updateRelative) {
      Fluttertoast.showToast(
          msg: "Profile Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong! Try again later.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 15.0);
    }
    add(RelativeFetchEvent());
  }

  Future<void> _onRelativeUpdateEvent(
      RelativeUpdateEvent event, Emitter<RelativeState> emit) async {

    emit(RelativeLoadingState());
    final updateRelative = await relativeService.updateRelativeProfile(
        uuid: event.updateRelativeData['uuid'],
        postBody: event.updateRelativeData);

    if (updateRelative) {
      Fluttertoast.showToast(
          msg: "Profile Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong! Try again later.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 15.0);
    }
    add(RelativeFetchEvent());
  }

  Future<void> _onRelativeDeletionEvent(
      RelativeDeletionEvent event, Emitter<RelativeState> emit) async {
    emit(RelativeLoadingState());

    final relativeDeleted = await relativeService.deleteRelativeProfile(
        uuid: event.deleteRelativeUUID);

    if (relativeDeleted) {
      Fluttertoast.showToast(
          msg: "Profile Deleted Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong! Try again later.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 15.0);
    }
    add(RelativeFetchEvent());
  }
}
