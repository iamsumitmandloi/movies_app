// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_dto.dart';

part 'movie_response_dto.freezed.dart';
part 'movie_response_dto.g.dart';

@freezed
class MovieResponseDto with _$MovieResponseDto {
  const factory MovieResponseDto({
    required int page,
    required List<MovieDto> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieResponseDto;

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseDtoFromJson(json);
}
