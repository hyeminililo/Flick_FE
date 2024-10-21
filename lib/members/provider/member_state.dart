import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_state.freezed.dart';

@freezed
class MemberProfileState with _$MemberProfileState {
  const factory MemberProfileState.initial() = MemberProfileInitial;
  const factory MemberProfileState.loading() = MemberProfileLoading;
  const factory MemberProfileState.loaded(MemberInfoModel memberInfo) =
      MemberProfileLoaded;
  const factory MemberProfileState.error(String message) = MemberProfileError;
}
