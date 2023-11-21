// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signUpLoading,
    required TResult Function(SignUpModel signUpModel) sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signUpLoading,
    TResult? Function(SignUpModel signUpModel)? sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signUpLoading,
    TResult Function(SignUpModel signUpModel)? sendOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(SendOtp value) sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpLoading value)? signUpLoading,
    TResult? Function(SendOtp value)? sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignUpLoadingImplCopyWith<$Res> {
  factory _$$SignUpLoadingImplCopyWith(
          _$SignUpLoadingImpl value, $Res Function(_$SignUpLoadingImpl) then) =
      __$$SignUpLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpLoadingImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpLoadingImpl>
    implements _$$SignUpLoadingImplCopyWith<$Res> {
  __$$SignUpLoadingImplCopyWithImpl(
      _$SignUpLoadingImpl _value, $Res Function(_$SignUpLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpLoadingImpl implements SignUpLoading {
  const _$SignUpLoadingImpl();

  @override
  String toString() {
    return 'SignUpEvent.signUpLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signUpLoading,
    required TResult Function(SignUpModel signUpModel) sendOtp,
  }) {
    return signUpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signUpLoading,
    TResult? Function(SignUpModel signUpModel)? sendOtp,
  }) {
    return signUpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signUpLoading,
    TResult Function(SignUpModel signUpModel)? sendOtp,
    required TResult orElse(),
  }) {
    if (signUpLoading != null) {
      return signUpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(SendOtp value) sendOtp,
  }) {
    return signUpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpLoading value)? signUpLoading,
    TResult? Function(SendOtp value)? sendOtp,
  }) {
    return signUpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) {
    if (signUpLoading != null) {
      return signUpLoading(this);
    }
    return orElse();
  }
}

abstract class SignUpLoading implements SignUpEvent {
  const factory SignUpLoading() = _$SignUpLoadingImpl;
}

/// @nodoc
abstract class _$$SendOtpImplCopyWith<$Res> {
  factory _$$SendOtpImplCopyWith(
          _$SendOtpImpl value, $Res Function(_$SendOtpImpl) then) =
      __$$SendOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SignUpModel signUpModel});
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
      _$SendOtpImpl _value, $Res Function(_$SendOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUpModel = null,
  }) {
    return _then(_$SendOtpImpl(
      signUpModel: null == signUpModel
          ? _value.signUpModel
          : signUpModel // ignore: cast_nullable_to_non_nullable
              as SignUpModel,
    ));
  }
}

/// @nodoc

class _$SendOtpImpl implements SendOtp {
  const _$SendOtpImpl({required this.signUpModel});

  @override
  final SignUpModel signUpModel;

  @override
  String toString() {
    return 'SignUpEvent.sendOtp(signUpModel: $signUpModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpImpl &&
            (identical(other.signUpModel, signUpModel) ||
                other.signUpModel == signUpModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signUpLoading,
    required TResult Function(SignUpModel signUpModel) sendOtp,
  }) {
    return sendOtp(signUpModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signUpLoading,
    TResult? Function(SignUpModel signUpModel)? sendOtp,
  }) {
    return sendOtp?.call(signUpModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signUpLoading,
    TResult Function(SignUpModel signUpModel)? sendOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(signUpModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(SendOtp value) sendOtp,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpLoading value)? signUpLoading,
    TResult? Function(SendOtp value)? sendOtp,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class SendOtp implements SignUpEvent {
  const factory SendOtp({required final SignUpModel signUpModel}) =
      _$SendOtpImpl;

  SignUpModel get signUpModel;
  @JsonKey(ignore: true)
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$SignUpStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignUpStateImpl implements _SignUpState {
  const _$SignUpStateImpl({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'SignUpState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState({required final bool isLoading}) =
      _$SignUpStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
