// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestModelImpl _$$LoginRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$LoginRequestModelImpl(
  identifier: json['identifier'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$$LoginRequestModelImplToJson(
  _$LoginRequestModelImpl instance,
) => <String, dynamic>{
  'identifier': instance.identifier,
  'password': instance.password,
};

_$LoginReesponseModelImpl _$$LoginReesponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$LoginReesponseModelImpl(
  jwt: json['jwt'] as String?,
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$LoginReesponseModelImplToJson(
  _$LoginReesponseModelImpl instance,
) => <String, dynamic>{'jwt': instance.jwt, 'user': instance.user};

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  email: json['email'] as String?,
  provider: json['provider'] as String?,
  confirmed: json['confirmed'] as bool?,
  blocked: json['blocked'] as bool?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  investorType: json['investor_type'] as String?,
  fcmToken: json['fcm_token'],
  mobileNo: json['mobile_no'],
  city: json['city'],
  state: json['state'],
  zipCode: json['zip_code'],
  resetPasswordOtp: json['reset_password_otp'],
  deletedAt: json['deleted_at'],
  externalProfilePictureUrl: json['external_profile_picture_url'],
  addressLine1: json['address_line_1'],
  addressLine2: json['address_line_2'],
  fullName: json['full_name'] as String?,
  ibkrOnboardingFinished: json['ibkr_onboarding_finished'],
  guidedInvestingFinished: json['guided_investing_finished'],
  customiseClimatePortfolio: json['customise_climate_portfolio'],
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'provider': instance.provider,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'investor_type': instance.investorType,
      'fcm_token': instance.fcmToken,
      'mobile_no': instance.mobileNo,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
      'reset_password_otp': instance.resetPasswordOtp,
      'deleted_at': instance.deletedAt,
      'external_profile_picture_url': instance.externalProfilePictureUrl,
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'full_name': instance.fullName,
      'ibkr_onboarding_finished': instance.ibkrOnboardingFinished,
      'guided_investing_finished': instance.guidedInvestingFinished,
      'customise_climate_portfolio': instance.customiseClimatePortfolio,
    };
