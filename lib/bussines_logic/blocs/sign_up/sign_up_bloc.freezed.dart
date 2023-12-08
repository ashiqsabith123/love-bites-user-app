// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'sign_up_bloc.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

// /// @nodoc
// mixin _$SignUpEvent {
//   OtpModel get signUpOtpModel => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(OtpModel signUpOtpModel) sendOtp,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(OtpModel signUpOtpModel)? sendOtp,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(OtpModel signUpOtpModel)? sendOtp,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(SendOtp value) sendOtp,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(SendOtp value)? sendOtp,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(SendOtp value)? sendOtp,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;

//   @JsonKey(ignore: true)
//   $SignUpEventCopyWith<SignUpEvent> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $SignUpEventCopyWith<$Res> {
//   factory $SignUpEventCopyWith(
//           SignUpEvent value, $Res Function(SignUpEvent) then) =
//       _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
//   @useResult
//   $Res call({OtpModel signUpOtpModel});
// }

// /// @nodoc
// class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
//     implements $SignUpEventCopyWith<$Res> {
//   _$SignUpEventCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? signUpOtpModel = null,
//   }) {
//     return _then(_value.copyWith(
//       signUpOtpModel: null == signUpOtpModel
//           ? _value.signUpOtpModel
//           : signUpOtpModel // ignore: cast_nullable_to_non_nullable
//               as OtpModel,
//     ) as $Val);
//   }
// }

// /// @nodoc
// abstract class _$$SendOtpImplCopyWith<$Res>
//     implements $SignUpEventCopyWith<$Res> {
//   factory _$$SendOtpImplCopyWith(
//           _$SendOtpImpl value, $Res Function(_$SendOtpImpl) then) =
//       __$$SendOtpImplCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call({OtpModel signUpOtpModel});
// }

// /// @nodoc
// class __$$SendOtpImplCopyWithImpl<$Res>
//     extends _$SignUpEventCopyWithImpl<$Res, _$SendOtpImpl>
//     implements _$$SendOtpImplCopyWith<$Res> {
//   __$$SendOtpImplCopyWithImpl(
//       _$SendOtpImpl _value, $Res Function(_$SendOtpImpl) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? signUpOtpModel = null,
//   }) {
//     return _then(_$SendOtpImpl(
//       signUpOtpModel: null == signUpOtpModel
//           ? _value.signUpOtpModel
//           : signUpOtpModel // ignore: cast_nullable_to_non_nullable
//               as OtpModel,
//     ));
//   }
// }

// /// @nodoc

// class _$SendOtpImpl implements SendOtp {
//   const _$SendOtpImpl({required this.signUpOtpModel});

//   @override
//   final OtpModel signUpOtpModel;

//   @override
//   String toString() {
//     return 'SignUpEvent.sendOtp(signUpOtpModel: $signUpOtpModel)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$SendOtpImpl &&
//             (identical(other.signUpOtpModel, signUpOtpModel) ||
//                 other.signUpOtpModel == signUpOtpModel));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, signUpOtpModel);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
//       __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(OtpModel signUpOtpModel) sendOtp,
//   }) {
//     return sendOtp(signUpOtpModel);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(OtpModel signUpOtpModel)? sendOtp,
//   }) {
//     return sendOtp?.call(signUpOtpModel);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(OtpModel signUpOtpModel)? sendOtp,
//     required TResult orElse(),
//   }) {
//     if (sendOtp != null) {
//       return sendOtp(signUpOtpModel);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(SendOtp value) sendOtp,
//   }) {
//     return sendOtp(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(SendOtp value)? sendOtp,
//   }) {
//     return sendOtp?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(SendOtp value)? sendOtp,
//     required TResult orElse(),
//   }) {
//     if (sendOtp != null) {
//       return sendOtp(this);
//     }
//     return orElse();
//   }
// }

// abstract class SendOtp implements SignUpEvent {
//   const factory SendOtp({required final OtpModel signUpOtpModel}) =
//       _$SendOtpImpl;

//   @override
//   OtpModel get signUpOtpModel;
//   @override
//   @JsonKey(ignore: true)
//   _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// mixin _$SignUpState {
//   bool get isLoading => throw _privateConstructorUsedError;
//   CommonResponseModel? get response => throw _privateConstructorUsedError;
//   SignUpModel? get signupModel => throw _privateConstructorUsedError;

//   @JsonKey(ignore: true)
//   $SignUpStateCopyWith<SignUpState> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $SignUpStateCopyWith<$Res> {
//   factory $SignUpStateCopyWith(
//           SignUpState value, $Res Function(SignUpState) then) =
//       _$SignUpStateCopyWithImpl<$Res, SignUpState>;
//   @useResult
//   $Res call(
//       {bool isLoading,
//       CommonResponseModel? response,
//       SignUpModel? signupModel});
// }

// /// @nodoc
// class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
//     implements $SignUpStateCopyWith<$Res> {
//   _$SignUpStateCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? isLoading = null,
//     Object? response = freezed,
//     Object? signupModel = freezed,
//   }) {
//     return _then(_value.copyWith(
//       isLoading: null == isLoading
//           ? _value.isLoading
//           : isLoading // ignore: cast_nullable_to_non_nullable
//               as bool,
//       response: freezed == response
//           ? _value.response
//           : response // ignore: cast_nullable_to_non_nullable
//               as CommonResponseModel?,
//       signupModel: freezed == signupModel
//           ? _value.signupModel
//           : signupModel // ignore: cast_nullable_to_non_nullable
//               as SignUpModel?,
//     ) as $Val);
//   }
// }

// /// @nodoc
// abstract class _$$SignUpStateImplCopyWith<$Res>
//     implements $SignUpStateCopyWith<$Res> {
//   factory _$$SignUpStateImplCopyWith(
//           _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
//       __$$SignUpStateImplCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call(
//       {bool isLoading,
//       CommonResponseModel? response,
//       SignUpModel? signupModel});
// }

// /// @nodoc
// class __$$SignUpStateImplCopyWithImpl<$Res>
//     extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
//     implements _$$SignUpStateImplCopyWith<$Res> {
//   __$$SignUpStateImplCopyWithImpl(
//       _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? isLoading = null,
//     Object? response = freezed,
//     Object? signupModel = freezed,
//   }) {
//     return _then(_$SignUpStateImpl(
//       isLoading: null == isLoading
//           ? _value.isLoading
//           : isLoading // ignore: cast_nullable_to_non_nullable
//               as bool,
//       response: freezed == response
//           ? _value.response
//           : response // ignore: cast_nullable_to_non_nullable
//               as CommonResponseModel?,
//       signupModel: freezed == signupModel
//           ? _value.signupModel
//           : signupModel // ignore: cast_nullable_to_non_nullable
//               as SignUpModel?,
//     ));
//   }
// }

// /// @nodoc

// class _$SignUpStateImpl implements _SignUpState {
//   const _$SignUpStateImpl(
//       {required this.isLoading, this.response, this.signupModel});

//   @override
//   final bool isLoading;
//   @override
//   final CommonResponseModel? response;
//   @override
//   final SignUpModel? signupModel;

//   @override
//   String toString() {
//     return 'SignUpState(isLoading: $isLoading, response: $response, signupModel: $signupModel)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$SignUpStateImpl &&
//             (identical(other.isLoading, isLoading) ||
//                 other.isLoading == isLoading) &&
//             (identical(other.response, response) ||
//                 other.response == response) &&
//             (identical(other.signupModel, signupModel) ||
//                 other.signupModel == signupModel));
//   }

//   @override
//   int get hashCode =>
//       Object.hash(runtimeType, isLoading, response, signupModel);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
//       __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
// }

// abstract class _SignUpState implements SignUpState {
//   const factory _SignUpState(
//       {required final bool isLoading,
//       final CommonResponseModel? response,
//       final SignUpModel? signupModel}) = _$SignUpStateImpl;

//   @override
//   bool get isLoading;
//   @override
//   CommonResponseModel? get response;
//   @override
//   SignUpModel? get signupModel;
//   @override
//   @JsonKey(ignore: true)
//   _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }
