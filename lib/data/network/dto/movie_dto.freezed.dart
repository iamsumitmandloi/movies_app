// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) {
  return _MovieDto.fromJson(json);
}

/// @nodoc
mixin _$MovieDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String get originalTitle => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;

  /// Serializes this MovieDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieDtoCopyWith<MovieDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDtoCopyWith<$Res> {
  factory $MovieDtoCopyWith(MovieDto value, $Res Function(MovieDto) then) =
      _$MovieDtoCopyWithImpl<$Res, MovieDto>;
  @useResult
  $Res call(
      {int id,
      String title,
      String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      bool adult,
      double popularity});
}

/// @nodoc
class _$MovieDtoCopyWithImpl<$Res, $Val extends MovieDto>
    implements $MovieDtoCopyWith<$Res> {
  _$MovieDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? releaseDate = null,
    Object? genreIds = null,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? adult = null,
    Object? popularity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      genreIds: null == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieDtoImplCopyWith<$Res>
    implements $MovieDtoCopyWith<$Res> {
  factory _$$MovieDtoImplCopyWith(
          _$MovieDtoImpl value, $Res Function(_$MovieDtoImpl) then) =
      __$$MovieDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      bool adult,
      double popularity});
}

/// @nodoc
class __$$MovieDtoImplCopyWithImpl<$Res>
    extends _$MovieDtoCopyWithImpl<$Res, _$MovieDtoImpl>
    implements _$$MovieDtoImplCopyWith<$Res> {
  __$$MovieDtoImplCopyWithImpl(
      _$MovieDtoImpl _value, $Res Function(_$MovieDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? releaseDate = null,
    Object? genreIds = null,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? adult = null,
    Object? popularity = null,
  }) {
    return _then(_$MovieDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      genreIds: null == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieDtoImpl extends _MovieDto {
  const _$MovieDtoImpl(
      {required this.id,
      required this.title,
      required this.overview,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'vote_average') required this.voteAverage,
      @JsonKey(name: 'vote_count') required this.voteCount,
      @JsonKey(name: 'release_date') required this.releaseDate,
      @JsonKey(name: 'genre_ids') required final List<int> genreIds,
      @JsonKey(name: 'original_language') required this.originalLanguage,
      @JsonKey(name: 'original_title') required this.originalTitle,
      required this.adult,
      required this.popularity})
      : _genreIds = genreIds,
        super._();

  factory _$MovieDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final List<int> _genreIds;
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds {
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreIds);
  }

  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  final bool adult;
  @override
  final double popularity;

  @override
  String toString() {
    return 'MovieDto(id: $id, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate, genreIds: $genreIds, originalLanguage: $originalLanguage, originalTitle: $originalTitle, adult: $adult, popularity: $popularity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      overview,
      posterPath,
      backdropPath,
      voteAverage,
      voteCount,
      releaseDate,
      const DeepCollectionEquality().hash(_genreIds),
      originalLanguage,
      originalTitle,
      adult,
      popularity);

  /// Create a copy of MovieDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDtoImplCopyWith<_$MovieDtoImpl> get copyWith =>
      __$$MovieDtoImplCopyWithImpl<_$MovieDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieDtoImplToJson(
      this,
    );
  }
}

abstract class _MovieDto extends MovieDto {
  const factory _MovieDto(
      {required final int id,
      required final String title,
      required final String overview,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'vote_average') required final double voteAverage,
      @JsonKey(name: 'vote_count') required final int voteCount,
      @JsonKey(name: 'release_date') required final String releaseDate,
      @JsonKey(name: 'genre_ids') required final List<int> genreIds,
      @JsonKey(name: 'original_language')
      required final String originalLanguage,
      @JsonKey(name: 'original_title') required final String originalTitle,
      required final bool adult,
      required final double popularity}) = _$MovieDtoImpl;
  const _MovieDto._() : super._();

  factory _MovieDto.fromJson(Map<String, dynamic> json) =
      _$MovieDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  bool get adult;
  @override
  double get popularity;

  /// Create a copy of MovieDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieDtoImplCopyWith<_$MovieDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
