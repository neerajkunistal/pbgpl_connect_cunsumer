part of 'add_complaint_bloc.dart';

sealed class AddComplaintState extends Equatable {
  const AddComplaintState();
}

final class AddComplaintInitial extends AddComplaintState {
  @override
  List<Object> get props => [];
}

final class AddComplaintPageLoadState extends AddComplaintInitial {
  @override
  List<Object> get props => [];
}

final class FetchAddComplaintDataState extends AddComplaintInitial {
  final bool isLoader;
  final bool isSubCategoryLoader;
  final List<CategoryModel> categoryList;
  final CategoryModel categoryData;
  final List<SubCategoryModel> subCategoryList;
  final SubCategoryModel subCategoryData;
  final List<File> fileList;
  final TextEditingController remarkController;

  FetchAddComplaintDataState({
    required this.isLoader,
    required this.isSubCategoryLoader,
    required this.remarkController,
    required this.fileList,
    required this.subCategoryList,
    required this.subCategoryData,
    required this.categoryData,
    required this.categoryList,
  });

  @override
  List<Object> get props => [
    isLoader,
    isSubCategoryLoader,
    remarkController,
    fileList,
    subCategoryList,
    subCategoryData,
    categoryData,
    categoryList,
  ];
}
