import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/search/search_repository.dart';
import 'package:capricon/data/remote/search/models/search_model.dart';
import 'package:capricon/domain/providers/repository_provider.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/screen/dashboard/search/viewmodel/state/search_state.dart';

final searchNotifierProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref)=> SearchNotifier(ref: ref, repository: ref.watch(seachRepositoryProvider)));

class SearchNotifier extends StateNotifier<SearchState>{
  late final Ref ref;
  late final SearchRepository repository;
  SearchNotifier({required this.ref, required this.repository}):super(const SearchInitial());

  Future<void> getSearch(QuerySearch querySearch) async{
    if(state is SearchInitial){
      state = const SearchLoading();
    }
    final resposne = await repository.getSearch(querySearch: querySearch);
    switch(resposne){
      case DataStateSuccess<List<SearchResponseModel>>(data: var data):
        Logger.printSuccess(data.toString());
        state = SearchLoaded(data: data);
      case DataStateError<List<SearchResponseModel>>(ex: var ex):
        state = SearchError(ex: ex.toString());
    }
  }
}