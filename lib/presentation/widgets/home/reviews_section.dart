// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    required this.reviews,
    Key? key,
  }) : super(key: key);

  final List<AppReview> reviews;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;
    final highlightedTextStyle = textStyle?.copyWith(
      fontWeight: FontWeight.bold,
    );
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).buttonColor.withOpacity(0.5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: PADDING * 1.5,
              ),
              child: Text(
                'Customer Reviews',
                style: ThemeManager.heroHeader(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: PADDING * 0.5,
              ),
              child: Text(
                'Check out what other players are saying about the game.',
                style: ThemeManager.heroSubheader(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(PADDING * 2),
              child: Wrap(
                spacing: PADDING,
                runSpacing: PADDING / 1.5,
                children: [
                  for (final review in reviews)
                    Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: RADIUS * 4),
                      shadowColor: Colors.black12,
                      elevation: 6,
                      child: Container(
                        height: 250,
                        width: 180,
                        margin: const EdgeInsets.symmetric(horizontal: PADDING),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: PADDING),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(PADDING / 2),
                                  child: Icon(
                                    FontAwesomeIcons.quoteLeft,
                                    color: Theme.of(context).accentColor,
                                    size: 18,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '${review.rating}',
                                  style: highlightedTextStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(PADDING / 3),
                                  child: Icon(
                                    FontAwesomeIcons.solidStar,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: PADDING),
                            Flexible(
                              child: AutoSizeText(
                                review.appReviewDescription,
                                style: textStyle,
                              ),
                            ),
                            const SizedBox(height: PADDING / 1.5),
                            Text(
                              review.userFullname,
                              style: highlightedTextStyle,
                            ),
                            const SizedBox(height: PADDING),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: PADDING * 2),
          ],
        ),
      ),
    );
  }
}
