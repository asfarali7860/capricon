import 'package:capricon/core/state/data_state.dart';
import 'package:capricon/data/remote/searchDetail/models/search_detail_model.dart';
import 'package:capricon/data/remote/searchDetail/search_detail_repository.dart';
import 'package:capricon/domain/providers/repository_provider.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/screen/searchDetail/viewmodel/state/search_detail_state.dart';

final searchDetailNotifierProvider = StateNotifierProvider<SearchDetailNotifier, SearchDetailState>((ref)=> SearchDetailNotifier(ref: ref, repository: ref.watch(searchDetailRepositoryProvider)));

class SearchDetailNotifier extends StateNotifier<SearchDetailState>{
  late final Ref ref;
  late final SearchDetailRepository repository;
  SearchDetailNotifier({required this.ref, required this.repository}):super(const SearchDetailInitial());

  Future<void> getSearchDetail(String searchId) async{
    state = const SearchDetailLoading();
    final resposne = await repository.getSearchDetail(searchId: searchId);
    switch(resposne){
      case DataStateSuccess<SearchDetailResponseModel>(data: var data):
        state = SearchDetailLoaded(data: data);
      case DataStateError<SearchDetailResponseModel>(ex: var ex):
        state = SearchDetailError(ex: ex.toString());
    }
  }
}