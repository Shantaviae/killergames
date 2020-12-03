import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:html/parser.dart' show parse;
import 'package:killergames/core/core.dart';

class DisplayHtml extends StatelessWidget {
  const DisplayHtml({
    required this.htmlContent,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final String htmlContent;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final document = parse(htmlContent);
    return HtmlWidget(
      document.outerHtml,
      hyperlinkColor: Colors.lightBlue[100],
      textStyle: textStyle ?? ThemeManager.heroSubheader(context),
    );
  }
}
