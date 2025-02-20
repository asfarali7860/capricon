import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

LoginRequestModel loginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());

@freezed
class LoginRequestModel with _$LoginRequestModel {
    const factory LoginRequestModel({
        @JsonKey(name: "identifier")
        String? identifier,
        @JsonKey(name: "password")
        String? password,
    }) = _LoginRequestModel;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);
}


//================RESPONSE========================//

LoginReesponseModel loginReesponseModelFromJson(String str) => LoginReesponseModel.fromJson(json.decode(str));

String loginReesponseModelToJson(LoginReesponseModel data) => json.encode(data.toJson());

@freezed
class LoginReesponseModel with _$LoginReesponseModel {
    const factory LoginReesponseModel({
        @JsonKey(name: "jwt")
        String? jwt,
        @JsonKey(name: "user")
        User? user,
    }) = _LoginReesponseModel;

    factory LoginReesponseModel.fromJson(Map<String, dynamic> json) => _$LoginReesponseModelFromJson(json);
}

@freezed
class User with _$User {
    const factory User({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "username")
        String? username,
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "provider")
        String? provider,
        @JsonKey(name: "confirmed")
        bool? confirmed,
        @JsonKey(name: "blocked")
        bool? blocked,
        @JsonKey(name: "createdAt")
        DateTime? createdAt,
        @JsonKey(name: "updatedAt")
        DateTime? updatedAt,
        @JsonKey(name: "investor_type")
        String? investorType,
        @JsonKey(name: "fcm_token")
        dynamic fcmToken,
        @JsonKey(name: "mobile_no")
        dynamic mobileNo,
        @JsonKey(name: "city")
        dynamic city,
        @JsonKey(name: "state")
        dynamic state,
        @JsonKey(name: "zip_code")
        dynamic zipCode,
        @JsonKey(name: "reset_password_otp")
        dynamic resetPasswordOtp,
        @JsonKey(name: "deleted_at")
        dynamic deletedAt,
        @JsonKey(name: "external_profile_picture_url")
        dynamic externalProfilePictureUrl,
        @JsonKey(name: "address_line_1")
        dynamic addressLine1,
        @JsonKey(name: "address_line_2")
        dynamic addressLine2,
        @JsonKey(name: "full_name")
        String? fullName,
        @JsonKey(name: "ibkr_onboarding_finished")
        dynamic ibkrOnboardingFinished,
        @JsonKey(name: "guided_investing_finished")
        dynamic guidedInvestingFinished,
        @JsonKey(name: "customise_climate_portfolio")
        dynamic customiseClimatePortfolio,
    }) = _User;

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
