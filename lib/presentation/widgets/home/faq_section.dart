import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/home/faq_tile.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({
    required this.faqs,
    Key? key,
  }) : super(key: key);

  final List<FrequentlyAskedQuestion> faqs;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: Responsive.screenWidth(context, 1000),
          padding: const EdgeInsets.all(PADDING * 4),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: PADDING * 2),
                child: Text(
                  'Frequently Asked Questions',
                  style: ThemeManager.heroHeader(context),
                ),
              ),
              for (final faq in faqs) FaqTile(faq),
            ],
          ),
        ),
      ),
    );
  }
}
