part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfilePageLoadState extends ProfileInitial {
  @override
  List<Object> get props => [];
}

final class FetchProfileDataState extends ProfileInitial {
  final bool isLoader;
  final bool isProfileEdit;
  final CustomerModel customerData;
  final TextEditingController mobileNumberController;

  FetchProfileDataState({
    required this.isLoader,
    required this.isProfileEdit,
    required this.customerData,
    required this.mobileNumberController
  });

  @override
  List<Object> get props => [
    isLoader,
    isProfileEdit,
    customerData,
    mobileNumberController,
  ];
}
