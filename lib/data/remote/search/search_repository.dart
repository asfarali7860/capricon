import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/search/models/search_model.dart';

abstract interface class SearchRepository {
  Future<DataState<List<SearchResponseModel>>> getSearch({required QuerySearch querySearch});
}