part of 'add_connection_bloc.dart';

sealed class AddConnectionEvent extends Equatable {
  const AddConnectionEvent();
}

class AddConnectionPageLoadEvent extends AddConnectionEvent {
  final BuildContext context;
  AddConnectionPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class ChangeAreaEvent extends AddConnectionEvent {
  final AreaModel areaData;
  ChangeAreaEvent({
   required this.areaData});
  @override
  List<Object?> get props => [areaData];
}

class AreaEvent extends AddConnectionEvent {
  final AreaModel areaData;
  AreaEvent({
    required this.areaData});
  @override
  List<Object?> get props => [areaData];
}

class GuardianEvent extends AddConnectionEvent {
  final GuardianModel guardianData;
  GuardianEvent({
    required this.guardianData});
  @override
  List<Object?> get props => [guardianData];
}

class PropertyCategoryEvent extends AddConnectionEvent {
  final PropertyCategoryModel propertyCategoryData;
  PropertyCategoryEvent({
    required this.propertyCategoryData});
  @override
  List<Object?> get props => [propertyCategoryData];
}

class PropertyClassEvent extends AddConnectionEvent {
  final PropertyClassModel propertyClassData;
  PropertyClassEvent({
    required this.propertyClassData});
  @override
  List<Object?> get props => [propertyClassData];
}

class PropertyDistrictEvent extends AddConnectionEvent {
  final DistrictModel districtData;
  PropertyDistrictEvent({
    required this.districtData});
  @override
  List<Object?> get props => [districtData];
}

class CookingFuelEvent extends AddConnectionEvent {
  final CookingFuelModel cookingFuelData;
  CookingFuelEvent({
    required this.cookingFuelData});
  @override
  List<Object?> get props => [cookingFuelData];
}

class IdentificationProofEvent extends AddConnectionEvent {
  final IdentificationProofModel identificationProofData;
  IdentificationProofEvent({
    required this.identificationProofData});
  @override
  List<Object?> get props => [identificationProofData];
}

class OwnerShipProofEvent extends AddConnectionEvent {
  final OwnerShipProofModel ownerShipProofData;
  OwnerShipProofEvent({
    required this.ownerShipProofData});
  @override
  List<Object?> get props => [ownerShipProofData];
}

class OwnerShipTypePropertyEvent extends AddConnectionEvent {
  final OwnerTypePropertyModel ownerTypePropertyData;
  OwnerShipTypePropertyEvent({
    required this.ownerTypePropertyData});
  @override
  List<Object?> get props => [ownerTypePropertyData];
}

class AcceptConversionPolicyEvent extends AddConnectionEvent {
  final String acceptConversionPolicy;
  AcceptConversionPolicyEvent({
    required this.acceptConversionPolicy});
  @override
  List<Object?> get props => [acceptConversionPolicy];
}

class AcceptExtraCostFillingEvent extends AddConnectionEvent {
  final String acceptExtraCostFitting;
  AcceptExtraCostFillingEvent({
    required this.acceptExtraCostFitting});
  @override
  List<Object?> get props => [acceptExtraCostFitting];
}

class SocietyAllowMDPEEvent extends AddConnectionEvent {
  final String societyAllowMDPE;
  SocietyAllowMDPEEvent({
    required this.societyAllowMDPE});
  @override
  List<Object?> get props => [societyAllowMDPE];
}

class FrontSide1Event extends AddConnectionEvent {
  final BuildContext context;
  final int mediaType;
  FrontSide1Event({required this.context, required this.mediaType});
  @override
  List<Object?> get props => [context, mediaType];
}

class BackSide1Event extends AddConnectionEvent {
  final BuildContext context;
  final int mediaType;
  BackSide1Event({required this.context, required this.mediaType});
  @override
  List<Object?> get props => [context, mediaType];
}

class FrontSide2Event extends AddConnectionEvent {
  final BuildContext context;
  final int mediaType;
  FrontSide2Event({required this.context, required this.mediaType});
  @override
  List<Object?> get props => [context, mediaType];
}

class BackSide2Event extends AddConnectionEvent {
  final BuildContext context;
  final int mediaType;
  BackSide2Event({required this.context, required this.mediaType});
  @override
  List<Object?> get props => [context, mediaType];
}

class AddConnectionSubmitEvent extends AddConnectionEvent {
  final BuildContext context;
  AddConnectionSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}