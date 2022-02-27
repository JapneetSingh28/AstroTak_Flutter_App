part of 'relative_bloc.dart';

abstract class RelativeEvent extends Equatable {
  const RelativeEvent();
}

class RelativeFetchEvent extends RelativeEvent {
  @override
  List<Object?> get props => [];
}

class RelativeAddEvent extends RelativeEvent {
  final Map addRelativeData;

  const RelativeAddEvent({required this.addRelativeData});

  @override
  List<Object?> get props => [addRelativeData];
}

class RelativeUpdateEvent extends RelativeEvent {
  final Map updateRelativeData;

  const RelativeUpdateEvent({required this.updateRelativeData});

  @override
  List<Object?> get props => [updateRelativeData];
}

class RelativeDeletionEvent extends RelativeEvent {
  final String deleteRelativeUUID;

  const RelativeDeletionEvent({required this.deleteRelativeUUID});

  @override
  List<Object?> get props => [deleteRelativeUUID];
}

class RelativeNoInternetEvent extends RelativeEvent {
  @override
  List<Object?> get props => [];
}
