// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placesCubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlacesState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<City> cities) LoadedCity,
    required TResult Function(List<University> universities) LoadedUniviristies,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<City> cities)? LoadedCity,
    TResult? Function(List<University> universities)? LoadedUniviristies,
    TResult? Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<City> cities)? LoadedCity,
    TResult Function(List<University> universities)? LoadedUniviristies,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadedCity<T> value) LoadedCity,
    required TResult Function(LoadedUniviristies<T> value) LoadedUniviristies,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadedCity<T> value)? LoadedCity,
    TResult? Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadedCity<T> value)? LoadedCity,
    TResult Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesStateCopyWith<T, $Res> {
  factory $PlacesStateCopyWith(
          PlacesState<T> value, $Res Function(PlacesState<T>) then) =
      _$PlacesStateCopyWithImpl<T, $Res, PlacesState<T>>;
}

/// @nodoc
class _$PlacesStateCopyWithImpl<T, $Res, $Val extends PlacesState<T>>
    implements $PlacesStateCopyWith<T, $Res> {
  _$PlacesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$PlacesStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PlacesState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<City> cities) LoadedCity,
    required TResult Function(List<University> universities) LoadedUniviristies,
    required TResult Function(String errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<City> cities)? LoadedCity,
    TResult? Function(List<University> universities)? LoadedUniviristies,
    TResult? Function(String errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<City> cities)? LoadedCity,
    TResult Function(List<University> universities)? LoadedUniviristies,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadedCity<T> value) LoadedCity,
    required TResult Function(LoadedUniviristies<T> value) LoadedUniviristies,
    required TResult Function(Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadedCity<T> value)? LoadedCity,
    TResult? Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult? Function(Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadedCity<T> value)? LoadedCity,
    TResult Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements PlacesState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$LoadedCityImplCopyWith<T, $Res> {
  factory _$$LoadedCityImplCopyWith(
          _$LoadedCityImpl<T> value, $Res Function(_$LoadedCityImpl<T>) then) =
      __$$LoadedCityImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<City> cities});
}

/// @nodoc
class __$$LoadedCityImplCopyWithImpl<T, $Res>
    extends _$PlacesStateCopyWithImpl<T, $Res, _$LoadedCityImpl<T>>
    implements _$$LoadedCityImplCopyWith<T, $Res> {
  __$$LoadedCityImplCopyWithImpl(
      _$LoadedCityImpl<T> _value, $Res Function(_$LoadedCityImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
  }) {
    return _then(_$LoadedCityImpl<T>(
      null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ));
  }
}

/// @nodoc

class _$LoadedCityImpl<T> implements LoadedCity<T> {
  const _$LoadedCityImpl(final List<City> cities) : _cities = cities;

  final List<City> _cities;
  @override
  List<City> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  String toString() {
    return 'PlacesState<$T>.LoadedCity(cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedCityImpl<T> &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedCityImplCopyWith<T, _$LoadedCityImpl<T>> get copyWith =>
      __$$LoadedCityImplCopyWithImpl<T, _$LoadedCityImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<City> cities) LoadedCity,
    required TResult Function(List<University> universities) LoadedUniviristies,
    required TResult Function(String errorMessage) error,
  }) {
    return LoadedCity(cities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<City> cities)? LoadedCity,
    TResult? Function(List<University> universities)? LoadedUniviristies,
    TResult? Function(String errorMessage)? error,
  }) {
    return LoadedCity?.call(cities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<City> cities)? LoadedCity,
    TResult Function(List<University> universities)? LoadedUniviristies,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (LoadedCity != null) {
      return LoadedCity(cities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadedCity<T> value) LoadedCity,
    required TResult Function(LoadedUniviristies<T> value) LoadedUniviristies,
    required TResult Function(Error<T> value) error,
  }) {
    return LoadedCity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadedCity<T> value)? LoadedCity,
    TResult? Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult? Function(Error<T> value)? error,
  }) {
    return LoadedCity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadedCity<T> value)? LoadedCity,
    TResult Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (LoadedCity != null) {
      return LoadedCity(this);
    }
    return orElse();
  }
}

abstract class LoadedCity<T> implements PlacesState<T> {
  const factory LoadedCity(final List<City> cities) = _$LoadedCityImpl<T>;

  List<City> get cities;
  @JsonKey(ignore: true)
  _$$LoadedCityImplCopyWith<T, _$LoadedCityImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedUniviristiesImplCopyWith<T, $Res> {
  factory _$$LoadedUniviristiesImplCopyWith(_$LoadedUniviristiesImpl<T> value,
          $Res Function(_$LoadedUniviristiesImpl<T>) then) =
      __$$LoadedUniviristiesImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<University> universities});
}

/// @nodoc
class __$$LoadedUniviristiesImplCopyWithImpl<T, $Res>
    extends _$PlacesStateCopyWithImpl<T, $Res, _$LoadedUniviristiesImpl<T>>
    implements _$$LoadedUniviristiesImplCopyWith<T, $Res> {
  __$$LoadedUniviristiesImplCopyWithImpl(_$LoadedUniviristiesImpl<T> _value,
      $Res Function(_$LoadedUniviristiesImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? universities = null,
  }) {
    return _then(_$LoadedUniviristiesImpl<T>(
      null == universities
          ? _value._universities
          : universities // ignore: cast_nullable_to_non_nullable
              as List<University>,
    ));
  }
}

/// @nodoc

class _$LoadedUniviristiesImpl<T> implements LoadedUniviristies<T> {
  const _$LoadedUniviristiesImpl(final List<University> universities)
      : _universities = universities;

  final List<University> _universities;
  @override
  List<University> get universities {
    if (_universities is EqualUnmodifiableListView) return _universities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_universities);
  }

  @override
  String toString() {
    return 'PlacesState<$T>.LoadedUniviristies(universities: $universities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedUniviristiesImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._universities, _universities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_universities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedUniviristiesImplCopyWith<T, _$LoadedUniviristiesImpl<T>>
      get copyWith => __$$LoadedUniviristiesImplCopyWithImpl<T,
          _$LoadedUniviristiesImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<City> cities) LoadedCity,
    required TResult Function(List<University> universities) LoadedUniviristies,
    required TResult Function(String errorMessage) error,
  }) {
    return LoadedUniviristies(universities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<City> cities)? LoadedCity,
    TResult? Function(List<University> universities)? LoadedUniviristies,
    TResult? Function(String errorMessage)? error,
  }) {
    return LoadedUniviristies?.call(universities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<City> cities)? LoadedCity,
    TResult Function(List<University> universities)? LoadedUniviristies,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (LoadedUniviristies != null) {
      return LoadedUniviristies(universities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadedCity<T> value) LoadedCity,
    required TResult Function(LoadedUniviristies<T> value) LoadedUniviristies,
    required TResult Function(Error<T> value) error,
  }) {
    return LoadedUniviristies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadedCity<T> value)? LoadedCity,
    TResult? Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult? Function(Error<T> value)? error,
  }) {
    return LoadedUniviristies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadedCity<T> value)? LoadedCity,
    TResult Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (LoadedUniviristies != null) {
      return LoadedUniviristies(this);
    }
    return orElse();
  }
}

abstract class LoadedUniviristies<T> implements PlacesState<T> {
  const factory LoadedUniviristies(final List<University> universities) =
      _$LoadedUniviristiesImpl<T>;

  List<University> get universities;
  @JsonKey(ignore: true)
  _$$LoadedUniviristiesImplCopyWith<T, _$LoadedUniviristiesImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$PlacesStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorImpl<T>(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'PlacesState<$T>.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<City> cities) LoadedCity,
    required TResult Function(List<University> universities) LoadedUniviristies,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<City> cities)? LoadedCity,
    TResult? Function(List<University> universities)? LoadedUniviristies,
    TResult? Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<City> cities)? LoadedCity,
    TResult Function(List<University> universities)? LoadedUniviristies,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadedCity<T> value) LoadedCity,
    required TResult Function(LoadedUniviristies<T> value) LoadedUniviristies,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadedCity<T> value)? LoadedCity,
    TResult? Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadedCity<T> value)? LoadedCity,
    TResult Function(LoadedUniviristies<T> value)? LoadedUniviristies,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements PlacesState<T> {
  const factory Error(final String errorMessage) = _$ErrorImpl<T>;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
