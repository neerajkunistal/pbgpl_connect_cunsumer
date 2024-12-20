part of 'add_complaint_bloc.dart';

sealed class AddComplaintEvent extends Equatable {
  const AddComplaintEvent();
}

class AddComplaintPageLoadEvent extends AddComplaintEvent {
  final BuildContext context;
  const AddComplaintPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class AddComplaintSelectCategoryEvent extends AddComplaintEvent {
  final BuildContext context;
  final CategoryModel categoryData;
  const AddComplaintSelectCategoryEvent({
    required this.context,
    required this.categoryData,
  });
  @override
  List<Object?> get props => [
    context,
    categoryData];

}

class AddComplaintSelectSubCategoryEvent extends AddComplaintEvent {
  final SubCategoryModel subCategoryData;
  const AddComplaintSelectSubCategoryEvent({
    required this.subCategoryData,
  });
  @override
  List<Object?> get props => [
    subCategoryData
  ];
}

class AddComplaintSelectFileEvent extends AddComplaintEvent {
  final BuildContext context;
  final int mediaType;
  const AddComplaintSelectFileEvent({
    required this.context,
    required this.mediaType,
  });
  @override
  List<Object?> get props => [context, mediaType];
}

class AddComplaintRemoveFileEvent extends AddComplaintEvent {
  final int index;
  const AddComplaintRemoveFileEvent({
    required this.index,
  });
  @override
  List<Object?> get props => [index];
}

class AddComplaintSubmitEvent extends AddComplaintEvent {
  final BuildContext context;
  const AddComplaintSubmitEvent({required this.context});
  @override
  List<Object?> get props => [context];
}