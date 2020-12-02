import 'package:flutter/widgets.dart';

class Link {
  Link({
    required this.name,
    required this.url,
    this.iconData,
  });

  final String name;
  final String url;
  final IconData? iconData;
}
