import 'dart:math' as math show pi;

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class FaqTile extends StatefulWidget {
  const FaqTile(this.faq, {Key? key}) : super(key: key);

  final FrequentlyAskedQuestion faq;

  @override
  _FaqTileState createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _animation;
  bool isOpen = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: ANIMATION);
    _animation = CurvedAnimation(curve: CURVE, parent: _controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;
    final highlightedTextStyle = textStyle?.copyWith(
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        if (isOpen) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        setState(() => isOpen = !isOpen);
      },
      child: Container(
        margin: const EdgeInsets.all(PADDING),
        padding: const EdgeInsets.all(PADDING / 2),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor.withOpacity(0.5),
          borderRadius: RADIUS,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(PADDING / 1.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: PADDING * 1.5,
                    ),
                    child: Icon(FontAwesomeIcons.comment, size: 24),
                  ),
                  Expanded(
                    child: Text(
                      widget.faq.question,
                      style: highlightedTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: PADDING / 1.5),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: math.pi * _animation.value,
                          child: Icon(FeatherIcons.chevronDown),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: ANIMATION,
              switchInCurve: CURVE,
              child: isOpen
                  ? Padding(
                      padding: const EdgeInsets.all(PADDING),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.faq.answer, style: textStyle),
                          const SizedBox(height: PADDING),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: PADDING / 1.5,
                            runSpacing: PADDING / 2,
                            children: [
                              for (final link in widget.faq.links)
                                TextButton.icon(
                                  icon: Icon(
                                    link.iconData ?? FeatherIcons.link,
                                    size: 16,
                                  ),
                                  label: Text(link.name, style: textStyle),
                                  onPressed: () async {
                                    if (await url.canLaunch(link.url)) {
                                      url.launch(link.url);
                                    }
                                  },
                                )
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
