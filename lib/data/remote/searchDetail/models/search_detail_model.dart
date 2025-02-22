// To parse this JSON data, do
//
//     final searchDetailRsponseModel = searchDetailRsponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'search_detail_model.freezed.dart';
part 'search_detail_model.g.dart';

SearchDetailResponseModel searchDetailResponseModelFromJson(String str) => SearchDetailResponseModel.fromJson(json.decode(str));

String searchDetailResponseModelToJson(SearchDetailResponseModel data) => json.encode(data.toJson());

@freezed
class SearchDetailResponseModel with _$SearchDetailResponseModel {
    const factory SearchDetailResponseModel({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "symbol")
        String? symbol,
        @JsonKey(name: "createdAt")
        DateTime? createdAt,
        @JsonKey(name: "updatedAt")
        DateTime? updatedAt,
        @JsonKey(name: "alpaca_id")
        String? alpacaId,
        @JsonKey(name: "exchange")
        String? exchange,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "asset_type")
        String? assetType,
        @JsonKey(name: "isin")
        String? isin,
        @JsonKey(name: "industry")
        String? industry,
        @JsonKey(name: "sector")
        String? sector,
        @JsonKey(name: "employees")
        int? employees,
        @JsonKey(name: "website")
        String? website,
        @JsonKey(name: "address")
        String? address,
        @JsonKey(name: "net_zero_progress")
        String? netZeroProgress,
        @JsonKey(name: "carbon_intensity_scope_3")
        int? carbonIntensityScope3,
        @JsonKey(name: "carbon_intensity_scope_1_and_2")
        int? carbonIntensityScope1And2,
        @JsonKey(name: "carbon_intensity_scope_1_and_2_and_3")
        int? carbonIntensityScope1And2And3,
        @JsonKey(name: "temp_alignment_scopes_1_and_2")
        String? tempAlignmentScopes1And2,
        @JsonKey(name: "dnsh_assessment_pass")
        bool? dnshAssessmentPass,
        @JsonKey(name: "good_governance_assessment")
        bool? goodGovernanceAssessment,
        @JsonKey(name: "contribute_to_environment_or_social_objective")
        bool? contributeToEnvironmentOrSocialObjective,
        @JsonKey(name: "sustainable_investment")
        bool? sustainableInvestment,
        @JsonKey(name: "scope_1_emissions")
        int? scope1Emissions,
        @JsonKey(name: "scope_2_emissions")
        int? scope2Emissions,
        @JsonKey(name: "scope_3_emissions")
        int? scope3Emissions,
        @JsonKey(name: "total_emissions")
        int? totalEmissions,
        @JsonKey(name: "listing_date")
        DateTime? listingDate,
        @JsonKey(name: "market_cap")
        String? marketCap,
        @JsonKey(name: "ibkr_connection_id")
        int? ibkrConnectionId,
        @JsonKey(name: "price")
        double? price,
        @JsonKey(name: "change_percent")
        double? changePercent,
        @JsonKey(name: "holdings")
        List<dynamic>? holdings,
        @JsonKey(name: "sector_allocation")
        List<dynamic>? sectorAllocation,
        @JsonKey(name: "sustainable_investment_holding_percentage")
        int? sustainableInvestmentHoldingPercentage,
        @JsonKey(name: "in_portfolio")
        bool? inPortfolio,
    }) = _SearchDetailResponseModel;

    factory SearchDetailResponseModel.fromJson(Map<String, dynamic> json) => _$SearchDetailResponseModelFromJson(json);
}