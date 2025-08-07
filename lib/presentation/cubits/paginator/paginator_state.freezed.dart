// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginatorState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  PaginatorDataType? get dataType => throw _privateConstructorUsedError;

  /// Create a copy of PaginatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatorStateCopyWith<PaginatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatorStateCopyWith<$Res> {
  factory $PaginatorStateCopyWith(
          PaginatorState value, $Res Function(PaginatorState) then) =
      _$PaginatorStateCopyWithImpl<$Res, PaginatorState>;
  @useResult
  $Res call(
      {List<Movie> movies,
      bool isLoading,
      bool isLoadingMore,
      bool hasReachedMax,
      int page,
      Failure? error,
      PaginatorDataType? dataType});
}

/// @nodoc
class _$PaginatorStateCopyWithImpl<$Res, $Val extends PaginatorState>
    implements $PaginatorStateCopyWith<$Res> {
  _$PaginatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasReachedMax = null,
    Object? page = null,
    Object? error = freezed,
    Object? dataType = freezed,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      dataType: freezed == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as PaginatorDataType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatorStateImplCopyWith<$Res>
    implements $PaginatorStateCopyWith<$Res> {
  factory _$$PaginatorStateImplCopyWith(_$PaginatorStateImpl value,
          $Res Function(_$PaginatorStateImpl) then) =
      __$$PaginatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Movie> movies,
      bool isLoading,
      bool isLoadingMore,
      bool hasReachedMax,
      int page,
      Failure? error,
      PaginatorDataType? dataType});
}

/// @nodoc
class __$$PaginatorStateImplCopyWithImpl<$Res>
    extends _$PaginatorStateCopyWithImpl<$Res, _$PaginatorStateImpl>
    implements _$$PaginatorStateImplCopyWith<$Res> {
  __$$PaginatorStateImplCopyWithImpl(
      _$PaginatorStateImpl _value, $Res Function(_$PaginatorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasReachedMax = null,
    Object? page = null,
    Object? error = freezed,
    Object? dataType = freezed,
  }) {
    return _then(_$PaginatorStateImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      dataType: freezed == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as PaginatorDataType?,
    ));
  }
}

/// @nodoc

class _$PaginatorStateImpl implements _PaginatorState {
  const _$PaginatorStateImpl(
      {required final List<Movie> movies,
      required this.isLoading,
      required this.isLoadingMore,
      required this.hasReachedMax,
      required this.page,
      this.error,
      this.dataType})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final bool isLoading;
  @override
  final bool isLoadingMore;
  @override
  final bool hasReachedMax;
  @override
  final int page;
  @override
  final Failure? error;
  @override
  final PaginatorDataType? dataType;

  @override
  String toString() {
    return 'PaginatorState(movies: $movies, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax, page: $page, error: $error, dataType: $dataType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatorStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      isLoading,
      isLoadingMore,
      hasReachedMax,
      page,
      error,
      dataType);

  /// Create a copy of PaginatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatorStateImplCopyWith<_$PaginatorStateImpl> get copyWith =>
      __$$PaginatorStateImplCopyWithImpl<_$PaginatorStateImpl>(
          this, _$identity);
}

abstract class _PaginatorState implements PaginatorState {
  const factory _PaginatorState(
      {required final List<Movie> movies,
      required final bool isLoading,
      required final bool isLoadingMore,
      required final bool hasReachedMax,
      required final int page,
      final Failure? error,
      final PaginatorDataType? dataType}) = _$PaginatorStateImpl;

  @override
  List<Movie> get movies;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get hasReachedMax;
  @override
  int get page;
  @override
  Failure? get error;
  @override
  PaginatorDataType? get dataType;

  /// Create a copy of PaginatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatorStateImplCopyWith<_$PaginatorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
