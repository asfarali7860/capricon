import 'dart:async';

import 'package:capricon/data/remote/search/models/search_model.dart';
import 'package:capricon/view/screen/dashboard/search/widgets/search_card.dart';
import 'package:capricon/utils/app_sizes.dart';
import 'package:capricon/utils/colors.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/components/box_shadow.dart';
import 'package:capricon/view/screen/dashboard/search/viewmodel/search_viewmodel.dart';
import 'package:capricon/view/screen/dashboard/search/viewmodel/state/search_state.dart';
import 'package:capricon/view/screen/dashboard/search/widgets/search_card_shimmer.dart';
import 'package:flutter/material.dart';

class SearchPageView extends ConsumerStatefulWidget {
  const SearchPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends ConsumerState<SearchPageView> {
  TextEditingController searchController = TextEditingController();

  Timer? debounce;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      if (debounce?.isActive ?? false) debounce!.cancel();
      
      debounce = Timer(const Duration(seconds: 1), () {
        performSearch(searchController.text);
      });
    });
  }

  void performSearch(String query) {
    if (query.isNotEmpty) {
      QuerySearch searchQuery = QuerySearch(query: query);
      ref.read(searchNotifierProvider.notifier).getSearch(searchQuery);
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchNotifierProvider);
    return Material(
      color: kWhite,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kWhite,
          body: SingleChildScrollView(
            child: Column(
              children: [
                gapH10,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kWhite,
                    boxShadow: [customBoxShadow()]
                  ),
                  child: TextField(
                    controller: searchController,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                gapH16,
                Builder(
                  builder: (_){
                    switch(searchState){
                      case SearchLoading():
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return SearchCardShimmer();
                          }, 
                          separatorBuilder: (context, index){
                            return gapH8;
                          }, 
                          itemCount: 5
                        );
                      case SearchLoaded(data: var data):
                        return data.isEmpty
                        ? const Center(child: Text("No results found."))
                        : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return SearchCard(searchData: data[index]);
                          }, 
                          separatorBuilder: (context, index){
                            return gapH8;
                          }, 
                          itemCount: data.length
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}