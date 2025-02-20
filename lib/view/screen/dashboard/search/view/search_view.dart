import 'package:capricon/utils/colors.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/components/box_shadow.dart';
import 'package:flutter/material.dart';

class SearchPageView extends ConsumerStatefulWidget {
  const SearchPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends ConsumerState<SearchPageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kWhite,
                boxShadow: [customBoxShadow()]
              ),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  // filled: true,
                  // fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}