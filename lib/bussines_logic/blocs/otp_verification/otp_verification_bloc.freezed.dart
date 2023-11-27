// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtpVerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() validate,
    required TResult Function() resend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? validate,
    TResult? Function()? resend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? validate,
    TResult Function()? resend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Validate value) validate,
    required TResult Function(Resend value) resend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Validate value)? validate,
    TResult? Function(Resend value)? resend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Validate value)? validate,
    TResult Function(Resend value)? resend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationEventCopyWith<$Res> {
  factory $OtpVerificationEventCopyWith(OtpVerificationEvent value,
          $Res Function(OtpVerificationEvent) then) =
      _$OtpVerificationEventCopyWithImpl<$Res, OtpVerificationEvent>;
}

/// @nodoc
class _$OtpVerificationEventCopyWithImpl<$Res,
        $Val extends OtpVerificationEvent>
    implements $OtpVerificationEventCopyWith<$Res> {
  _$OtpVerificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ValidateImplCopyWith<$Res> {
  factory _$$ValidateImplCopyWith(
          _$ValidateImpl value, $Res Function(_$ValidateImpl) then) =
      __$$ValidateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateImplCopyWithImpl<$Res>
    extends _$OtpVerificationEventCopyWithImpl<$Res, _$ValidateImpl>
    implements _$$ValidateImplCopyWith<$Res> {
  __$$ValidateImplCopyWithImpl(
      _$ValidateImpl _value, $Res Function(_$ValidateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidateImpl with DiagnosticableTreeMixin implements Validate {
  const _$ValidateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpVerificationEvent.validate()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'OtpVerificationEvent.validate'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() validate,
    required TResult Function() resend,
  }) {
    return validate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? validate,
    TResult? Function()? resend,
  }) {
    return validate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? validate,
    TResult Function()? resend,
    required TResult orElse(),
  }) {
    if (validate != null) {
      return validate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Validate value) validate,
    required TResult Function(Resend value) resend,
  }) {
    return validate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Validate value)? validate,
    TResult? Function(Resend value)? resend,
  }) {
    return validate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Validate value)? validate,
    TResult Function(Resend value)? resend,
    required TResult orElse(),
  }) {
    if (validate != null) {
      return validate(this);
    }
    return orElse();
  }
}

abstract class Validate implements OtpVerificationEvent {
  const factory Validate() = _$ValidateImpl;
}

/// @nodoc
abstract class _$$ResendImplCopyWith<$Res> {
  factory _$$ResendImplCopyWith(
          _$ResendImpl value, $Res Function(_$ResendImpl) then) =
      __$$ResendImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendImplCopyWithImpl<$Res>
    extends _$OtpVerificationEventCopyWithImpl<$Res, _$ResendImpl>
    implements _$$ResendImplCopyWith<$Res> {
  __$$ResendImplCopyWithImpl(
      _$ResendImpl _value, $Res Function(_$ResendImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendImpl with DiagnosticableTreeMixin implements Resend {
  const _$ResendImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpVerificationEvent.resend()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'OtpVerificationEvent.resend'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResendImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() validate,
    required TResult Function() resend,
  }) {
    return resend();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? validate,
    TResult? Function()? resend,
  }) {
    return resend?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? validate,
    TResult Function()? resend,
    required TResult orElse(),
  }) {
    if (resend != null) {
      return resend();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Validate value) validate,
    required TResult Function(Resend value) resend,
  }) {
    return resend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Validate value)? validate,
    TResult? Function(Resend value)? resend,
  }) {
    return resend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Validate value)? validate,
    TResult Function(Resend value)? resend,
    required TResult orElse(),
  }) {
    if (resend != null) {
      return resend(this);
    }
    return orElse();
  }
}

abstract class Resend implements OtpVerificationEvent {
  const factory Resend() = _$ResendImpl;
}

/// @nodoc
mixin _$OtpVerificationState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpVerificationStateCopyWith<OtpVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationStateCopyWith<$Res> {
  factory $OtpVerificationStateCopyWith(OtpVerificationState value,
          $Res Function(OtpVerificationState) then) =
      _$OtpVerificationStateCopyWithImpl<$Res, OtpVerificationState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$OtpVerificationStateCopyWithImpl<$Res,
        $Val extends OtpVerificationState>
    implements $OtpVerificationStateCopyWith<$Res> {
  _$OtpVerificationStateCopyWithImpl(this._value, this._then);

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
abstract class _$$OtpVerificationStateImplCopyWith<$Res>
    implements $OtpVerificationStateCopyWith<$Res> {
  factory _$$OtpVerificationStateImplCopyWith(_$OtpVerificationStateImpl value,
          $Res Function(_$OtpVerificationStateImpl) then) =
      __$$OtpVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$OtpVerificationStateImplCopyWithImpl<$Res>
    extends _$OtpVerificationStateCopyWithImpl<$Res, _$OtpVerificationStateImpl>
    implements _$$OtpVerificationStateImplCopyWith<$Res> {
  __$$OtpVerificationStateImplCopyWithImpl(_$OtpVerificationStateImpl _value,
      $Res Function(_$OtpVerificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$OtpVerificationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OtpVerificationStateImpl
    with DiagnosticableTreeMixin
    implements _OtpVerificationState {
  const _$OtpVerificationStateImpl({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpVerificationState(isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpVerificationState'))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationStateImplCopyWith<_$OtpVerificationStateImpl>
      get copyWith =>
          __$$OtpVerificationStateImplCopyWithImpl<_$OtpVerificationStateImpl>(
              this, _$identity);
}

abstract class _OtpVerificationState implements OtpVerificationState {
  const factory _OtpVerificationState({required final bool isLoading}) =
      _$OtpVerificationStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$OtpVerificationStateImplCopyWith<_$OtpVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
