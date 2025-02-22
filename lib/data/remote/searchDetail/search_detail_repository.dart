import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/searchDetail/models/search_detail_model.dart';

abstract interface class SearchDetailRepository {
  Future<DataState<SearchDetailResponseModel>> getSearchDetail({required String searchId});
}