import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iremovebreaklines/utils/extensions/color_extension.dart';
import 'package:sizer/sizer.dart';

class TextCard extends StatelessWidget {
  TextCard({
    required this.textId,
    required this.onChanged,
    super.key,
  });

  final String textId;

  final textEditingController = TextEditingController();
  final void Function(String, String) onChanged;

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
                            onChanged(textId, value);
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
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          readOnly: true,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your text without breaklines',
                          ),
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.normal),
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
