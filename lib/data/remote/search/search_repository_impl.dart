import 'package:capricon/core/api_client.dart';
import 'package:capricon/core/endpoints.dart';
import 'package:capricon/core/exception.dart';
import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/search/models/search_model.dart';
import 'package:capricon/data/remote/search/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final ApiClient _apiClient;
  SearchRepositoryImpl(this._apiClient);

  @override
  Future<DataState<List<SearchResponseModel>>> getSearch({required QuerySearch querySearch}) async {
    try{
      final response = await _apiClient.get(
        EndPoints.search.val(),
        queryParams: querySearch.toJson()
      );

      if (response.data is List) {
        final List<SearchResponseModel> searchResults = (response.data as List)
            .map((item) => SearchResponseModel.fromJson(item as Map<String, dynamic>))
            .toList();

        return DataStateSuccess<List<SearchResponseModel>>(data: searchResults);
      } else {
        return DataStateError<List<SearchResponseModel>>(
          ex: ApiException("Invalid response format. Expected List but got ${response.data.runtimeType}"),
        );
      }
    }catch(ex){
      return DataStateError<List<SearchResponseModel>>(ex: ApiException(ex.toString()));
    }
  }
}