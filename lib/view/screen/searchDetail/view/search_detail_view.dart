import 'package:capricon/utils/app_sizes.dart';
import 'package:capricon/utils/utils.dart';
import 'package:capricon/view/screen/searchDetail/viewmodel/search_detail_viewmodel.dart';
import 'package:capricon/view/screen/searchDetail/viewmodel/state/search_detail_state.dart';
import 'package:capricon/view/screen/searchDetail/widgets/search_detail_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capricon/utils/colors.dart';

class SearchDetailPage extends ConsumerStatefulWidget {
  final String searchId;
  const SearchDetailPage({super.key, required this.searchId});

  @override
  ConsumerState<SearchDetailPage> createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends ConsumerState<SearchDetailPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(searchDetailNotifierProvider.notifier).getSearchDetail(widget.searchId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchDetailState = ref.watch(searchDetailNotifierProvider);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text('Stock Details'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: kWhite,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Builder(
          builder: (_){
            switch(searchDetailState){
              case SearchDetailLoading():
                return SearchDetailShimmer();
              case SearchDetailLoaded(data: var stockData):
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${stockData.name} (${stockData.symbol})",
                              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exchange: ${stockData.exchange ?? 'N/A'}",
                                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                                ),
                                Text(
                                  stockData.assetType ?? 'N/A',
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            gapH12,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${stockData.price?.toStringAsFixed(2) ?? 'N/A'}",
                                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${stockData.changePercent?.toStringAsFixed(2) ?? '0'}%",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: (stockData.changePercent ?? 0.0) >= 0 ? Colors.green : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    gapH16,
                    Card(
                      color: kWhite,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionTitle("Stock Information"),
                            stockInfoRow("Industry", stockData.industry),
                            stockInfoRow("Sector", stockData.sector),
                            stockInfoRow("Market Cap", "\$${stockData.marketCap}"),
                            stockInfoRow("Listing Date", stockData.listingDate.toString()),
                          ],
                        ),
                      ),
                    ),
                    gapH16,
                    Card(
                      color: kWhite,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionTitle("Sustainability & Environment"),
                            stockInfoRow("Net Zero Progress", stockData.netZeroProgress),
                            stockInfoRow("Scope 1 Emissions", "${stockData.scope1Emissions} tons"),
                            stockInfoRow("Scope 2 Emissions", "${stockData.scope2Emissions} tons"),
                            stockInfoRow("Scope 3 Emissions", "${stockData.scope3Emissions} tons"),
                            stockInfoRow("Total Emissions", "${stockData.totalEmissions} tons"),
                          ],
                        ),
                      ),
                    ),
                    gapH16,
                    Card(
                      color: kWhite,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionTitle("Company Details"),
                            stockInfoRow("Website", stockData.website),
                            stockInfoRow("Address", stockData.address),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              default:
                return const SizedBox.shrink();
            }
          }
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget stockInfoRow(String label, dynamic value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
          Flexible(
            child: Text(
              value ?? 'N/A',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}