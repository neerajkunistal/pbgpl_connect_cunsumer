part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfilePageLoadEvent extends ProfileEvent {
  final BuildContext context;
  ProfilePageLoadEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}

class ProfileProfileEditEvent extends ProfileEvent {
  final BuildContext context;
  ProfileProfileEditEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}

class ProfileSubmitEvent extends ProfileEvent {
  final BuildContext context;
  ProfileSubmitEvent({ required this.context});
  @override
  List<Object?> get props => [context];
}