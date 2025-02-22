import 'package:capricon/data/remote/search/models/search_model.dart' as search;
import 'package:capricon/routes/app_routes.dart';
import 'package:capricon/utils/app_sizes.dart';
import 'package:capricon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchCard extends StatelessWidget {
  final search.SearchResponseModel searchData;

  const SearchCard({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(AppRoute.searchDetailPage.name, extra: searchData.id.toString());
      },
      child: Card(
        color: kWhite,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  searchData.image?.url ?? '',
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.image_not_supported, size: 80.sp, color: Colors.grey),
                ),
              ),
              gapW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      searchData.name ?? 'No Name',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "(${searchData.symbol ?? 'N/A'})",
                      style: TextStyle(fontSize: 14.sp, color: Colors.blueAccent),
                    ),
                    gapH4,
                    Row(
                      children: [
                        Icon(Icons.business, size: 16.sp, color: Colors.grey[700]),
                        gapW4,
                        Text(
                          searchData.exchange ?? 'Unknown Exchange',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                        ),
                        gapW10,
                        Icon(Icons.category, size: 16.sp, color: Colors.grey[700]),
                        gapW4,
                        Text(
                          searchData.assetType ?? 'Unknown Type',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.account_balance, size: 16.sp, color: Colors.red[700]),
                        gapW4,
                        Text(
                          searchData.industry ?? 'Unknown Industry',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.bar_chart, size: 16.sp, color: Colors.blue[700]),
                        gapW4,
                        Text(
                          searchData.sector ?? 'Unknown Sector',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    gapH6,
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16.sp, color: Colors.grey[700]),
                        gapW4,
                        Text(
                          "Listed: ${searchData.listingDate ?? 'N/A'}",
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    gapH8,
                    Text(
                      searchData.description ?? 'No description available.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}