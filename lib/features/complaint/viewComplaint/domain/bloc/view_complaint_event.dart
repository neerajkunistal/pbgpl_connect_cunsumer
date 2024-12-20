part of 'view_complaint_bloc.dart';

sealed class ViewComplaintEvent extends Equatable {
  const ViewComplaintEvent();
}

class ViewComplaintPageLoadEvent extends ViewComplaintEvent {
  final BuildContext context;

  const ViewComplaintPageLoadEvent({
    required this.context,
});
  @override
  List<Object?> get props => [context];
}