import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iremovebreaklines/cubit/cubit/text_cleaner_cubit.dart';
import 'package:iremovebreaklines/utils/extensions/color_extension.dart';
import 'package:sizer/sizer.dart';

class TextCard extends StatelessWidget {
  TextCard({
    required this.textId,
    super.key,
  });

  final String textId;

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50.h,
        child: Card(
          color: HexColor.fromHex('#F8FAFC'),
          child: Padding(
            padding: EdgeInsets.fromLTRB(4.w, 2.w, 1.w, 1.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your text here',
                  style: GoogleFonts.notoSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          onChanged: (value) {
                            context.read<TextCleanerCubit>().cleanText(value);
                          },
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your text here',
                          ),
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<TextCleanerCubit, TextCleanerState>(
                          builder: (context, state) {
                            return state.when(
                              loading: () {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              error: (message) {
                                return Center(
                                  child: Text(
                                    message,
                                    style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                );
                              },
                              loaded: (cleanedText) {
                                cleanedText = cleanedText ?? '';
                                textEditingController.text = cleanedText;
                                return BlocListener<TextCleanerCubit,
                                    TextCleanerState>(
                                  listener: (context, state) {
                                    state.whenOrNull(
                                      loaded: (cleanedText) {
                                        if (cleanedText != null &&
                                            cleanedText.isNotEmpty) {
                                          Clipboard.setData(
                                            ClipboardData(text: cleanedText),
                                          ).then((_) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('Copied to clipboard'),
                                              ),
                                            );
                                          });
                                        }
                                      },
                                    );
                                  },
                                  child: TextField(
                                    maxLines: null,
                                    expands: true,
                                    readOnly: true,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Your text will be here',
                                    ),
                                    controller: textEditingController,
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
