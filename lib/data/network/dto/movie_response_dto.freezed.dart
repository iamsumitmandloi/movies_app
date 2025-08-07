// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieResponseDto _$MovieResponseDtoFromJson(Map<String, dynamic> json) {
  return _MovieResponseDto.fromJson(json);
}

/// @nodoc
mixin _$MovieResponseDto {
  int get page => throw _privateConstructorUsedError;
  List<MovieDto> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;

  /// Serializes this MovieResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieResponseDtoCopyWith<MovieResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieResponseDtoCopyWith<$Res> {
  factory $MovieResponseDtoCopyWith(
          MovieResponseDto value, $Res Function(MovieResponseDto) then) =
      _$MovieResponseDtoCopyWithImpl<$Res, MovieResponseDto>;
  @useResult
  $Res call(
      {int page,
      List<MovieDto> results,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class _$MovieResponseDtoCopyWithImpl<$Res, $Val extends MovieResponseDto>
    implements $MovieResponseDtoCopyWith<$Res> {
  _$MovieResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieDto>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieResponseDtoImplCopyWith<$Res>
    implements $MovieResponseDtoCopyWith<$Res> {
  factory _$$MovieResponseDtoImplCopyWith(_$MovieResponseDtoImpl value,
          $Res Function(_$MovieResponseDtoImpl) then) =
      __$$MovieResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      List<MovieDto> results,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class __$$MovieResponseDtoImplCopyWithImpl<$Res>
    extends _$MovieResponseDtoCopyWithImpl<$Res, _$MovieResponseDtoImpl>
    implements _$$MovieResponseDtoImplCopyWith<$Res> {
  __$$MovieResponseDtoImplCopyWithImpl(_$MovieResponseDtoImpl _value,
      $Res Function(_$MovieResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$MovieResponseDtoImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieDto>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieResponseDtoImpl implements _MovieResponseDto {
  const _$MovieResponseDtoImpl(
      {required this.page,
      required final List<MovieDto> results,
      @JsonKey(name: 'total_pages') required this.totalPages,
      @JsonKey(name: 'total_results') required this.totalResults})
      : _results = results;

  factory _$MovieResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieResponseDtoImplFromJson(json);

  @override
  final int page;
  final List<MovieDto> _results;
  @override
  List<MovieDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;

  @override
  String toString() {
    return 'MovieResponseDto(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieResponseDtoImpl &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  /// Create a copy of MovieResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieResponseDtoImplCopyWith<_$MovieResponseDtoImpl> get copyWith =>
      __$$MovieResponseDtoImplCopyWithImpl<_$MovieResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _MovieResponseDto implements MovieResponseDto {
  const factory _MovieResponseDto(
          {required final int page,
          required final List<MovieDto> results,
          @JsonKey(name: 'total_pages') required final int totalPages,
          @JsonKey(name: 'total_results') required final int totalResults}) =
      _$MovieResponseDtoImpl;

  factory _MovieResponseDto.fromJson(Map<String, dynamic> json) =
      _$MovieResponseDtoImpl.fromJson;

  @override
  int get page;
  @override
  List<MovieDto> get results;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;

  /// Create a copy of MovieResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieResponseDtoImplCopyWith<_$MovieResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
