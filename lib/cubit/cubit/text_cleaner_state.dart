part of 'text_cleaner_cubit.dart';

@freezed
class TextCleanerState with _$TextCleanerState {
  const factory TextCleanerState.loading() = _Loading;
  const factory TextCleanerState.loaded({String? cleanedText}) = _Loaded;
  const factory TextCleanerState.error(String message) = _Error;
}
