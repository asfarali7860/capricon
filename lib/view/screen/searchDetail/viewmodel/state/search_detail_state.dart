import 'package:capricon/data/remote/searchDetail/models/search_detail_model.dart';

sealed class SearchDetailState {
  const SearchDetailState();
}

final class SearchDetailInitial extends SearchDetailState{
  const SearchDetailInitial();
}

final class SearchDetailLoading extends SearchDetailState{
  const SearchDetailLoading();
}

final class SearchDetailLoaded extends SearchDetailState {
  const SearchDetailLoaded({required this.data});

  final SearchDetailResponseModel data;
}

final class SearchDetailError extends SearchDetailState{
  const SearchDetailError({this.ex});

  final String? ex;
}

extension SearchDetailExtension on SearchDetailState {
  bool get isSuccess {
    switch(this) {
      case SearchDetailLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  SearchDetailResponseModel? get searchDetailResponse {
    switch(this){
      case SearchDetailLoaded(data: final data):
        return data;
      default:
        return null;
    }
  }

  bool get isLoading {
    switch(this) {
      case SearchDetailLoading():
        return true;
      default:
        return false;
    }
  }
}