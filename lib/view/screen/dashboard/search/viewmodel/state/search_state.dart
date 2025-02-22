
import 'package:capricon/data/remote/search/models/search_model.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState{
  const SearchInitial();
}

final class SearchLoading extends SearchState{
  const SearchLoading();
}

final class SearchLoaded extends SearchState {
  const SearchLoaded({required this.data});

  final List<SearchResponseModel> data;
}

final class SearchError extends SearchState{
  const SearchError({this.ex});

  final String? ex;
}

extension SearchExtension on SearchState {
  bool get isSuccess {
    switch(this) {
      case SearchLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<SearchResponseModel> get searchResponse {
    switch(this){
      case SearchLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case SearchLoading():
        return true;
      default:
        return false;
    }
  }
}