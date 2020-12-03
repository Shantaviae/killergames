import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class CustomAppFooter extends StatelessWidget {
  const CustomAppFooter(this.policies, {Key? key}) : super(key: key);

  final Map<String, AppPolicy> policies;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: Responsive.contentPadding(context) + EdgeInsets.all(PADDING),
        child: Row(
          children: [
            AppName(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: PADDING),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: PADDING,
                  runSpacing: PADDING / 1.5,
                  children: [
                    for (final policy in policies.entries)
                      TextButton(
                        child: Text(
                          policy.value.title,
                          style: Theme.of(context).primaryTextTheme.bodyText2,
                        ),
                        onPressed: () =>
                            RouteDelegate.openPolicy(context, policy.key),
                      ),
                  ],
                ),
              ),
            ),
            if (Responsive(context).isDesktop)
              SelectableText(
                AppLocals.copyright,
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
          ],
        ),
      ),
    );
  }
}
