// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchDetailResponseModelImpl _$$SearchDetailResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$SearchDetailResponseModelImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  symbol: json['symbol'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  alpacaId: json['alpaca_id'] as String?,
  exchange: json['exchange'] as String?,
  description: json['description'] as String?,
  assetType: json['asset_type'] as String?,
  isin: json['isin'] as String?,
  industry: json['industry'] as String?,
  sector: json['sector'] as String?,
  employees: (json['employees'] as num?)?.toInt(),
  website: json['website'] as String?,
  address: json['address'] as String?,
  netZeroProgress: json['net_zero_progress'] as String?,
  carbonIntensityScope3: (json['carbon_intensity_scope_3'] as num?)?.toInt(),
  carbonIntensityScope1And2:
      (json['carbon_intensity_scope_1_and_2'] as num?)?.toInt(),
  carbonIntensityScope1And2And3:
      (json['carbon_intensity_scope_1_and_2_and_3'] as num?)?.toInt(),
  tempAlignmentScopes1And2: json['temp_alignment_scopes_1_and_2'] as String?,
  dnshAssessmentPass: json['dnsh_assessment_pass'] as bool?,
  goodGovernanceAssessment: json['good_governance_assessment'] as bool?,
  contributeToEnvironmentOrSocialObjective:
      json['contribute_to_environment_or_social_objective'] as bool?,
  sustainableInvestment: json['sustainable_investment'] as bool?,
  scope1Emissions: (json['scope_1_emissions'] as num?)?.toInt(),
  scope2Emissions: (json['scope_2_emissions'] as num?)?.toInt(),
  scope3Emissions: (json['scope_3_emissions'] as num?)?.toInt(),
  totalEmissions: (json['total_emissions'] as num?)?.toInt(),
  listingDate:
      json['listing_date'] == null
          ? null
          : DateTime.parse(json['listing_date'] as String),
  marketCap: json['market_cap'] as String?,
  ibkrConnectionId: (json['ibkr_connection_id'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  changePercent: (json['change_percent'] as num?)?.toDouble(),
  holdings: json['holdings'] as List<dynamic>?,
  sectorAllocation: json['sector_allocation'] as List<dynamic>?,
  sustainableInvestmentHoldingPercentage:
      (json['sustainable_investment_holding_percentage'] as num?)?.toInt(),
  inPortfolio: json['in_portfolio'] as bool?,
);

Map<String, dynamic> _$$SearchDetailResponseModelImplToJson(
  _$SearchDetailResponseModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'symbol': instance.symbol,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'alpaca_id': instance.alpacaId,
  'exchange': instance.exchange,
  'description': instance.description,
  'asset_type': instance.assetType,
  'isin': instance.isin,
  'industry': instance.industry,
  'sector': instance.sector,
  'employees': instance.employees,
  'website': instance.website,
  'address': instance.address,
  'net_zero_progress': instance.netZeroProgress,
  'carbon_intensity_scope_3': instance.carbonIntensityScope3,
  'carbon_intensity_scope_1_and_2': instance.carbonIntensityScope1And2,
  'carbon_intensity_scope_1_and_2_and_3':
      instance.carbonIntensityScope1And2And3,
  'temp_alignment_scopes_1_and_2': instance.tempAlignmentScopes1And2,
  'dnsh_assessment_pass': instance.dnshAssessmentPass,
  'good_governance_assessment': instance.goodGovernanceAssessment,
  'contribute_to_environment_or_social_objective':
      instance.contributeToEnvironmentOrSocialObjective,
  'sustainable_investment': instance.sustainableInvestment,
  'scope_1_emissions': instance.scope1Emissions,
  'scope_2_emissions': instance.scope2Emissions,
  'scope_3_emissions': instance.scope3Emissions,
  'total_emissions': instance.totalEmissions,
  'listing_date': instance.listingDate?.toIso8601String(),
  'market_cap': instance.marketCap,
  'ibkr_connection_id': instance.ibkrConnectionId,
  'price': instance.price,
  'change_percent': instance.changePercent,
  'holdings': instance.holdings,
  'sector_allocation': instance.sectorAllocation,
  'sustainable_investment_holding_percentage':
      instance.sustainableInvestmentHoldingPercentage,
  'in_portfolio': instance.inPortfolio,
};
