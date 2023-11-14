import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_cleaner_state.dart';
part 'text_cleaner_cubit.freezed.dart';

class TextCleanerCubit extends Cubit<TextCleanerState> {
  TextCleanerCubit() : super(const TextCleanerState.loaded());

  Future<void> cleanText(String text) async {
    emit(const TextCleanerState.loading());
    try {
      // TODO: Change to call to a provider
      // remove breaklines when they are not after a dot
      var cleanedText = text.replaceAll(RegExp(r'(?<!\.)\n'), ' ');

      // remove spaces before and after
      cleanedText = cleanedText.trim();
      // remove hyphens when they are at the end of the line
      cleanedText = cleanedText.replaceAll(RegExp(r'-\s'), '');
      // replace ’ with '
      cleanedText = cleanedText.replaceAll('’', "'");
      // replace “ with "
      cleanedText = cleanedText.replaceAll('“', '"');
      // replace ” with "
      cleanedText = cleanedText.replaceAll('”', '"');
      // replace – with -
      cleanedText = cleanedText.replaceAll('–', '-');
      // replace … with ...
      cleanedText = cleanedText.replaceAll('…', '...');

      emit(TextCleanerState.loaded(cleanedText: cleanedText));
    } catch (e) {
      emit(TextCleanerState.error(e.toString()));
    }
  }
}
