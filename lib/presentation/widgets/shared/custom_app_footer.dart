import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class CustomAppFooter extends StatelessWidget {
  const CustomAppFooter(
    this.policies,
    this.setPolicyPath, {
    this.asSliver = true,
    Key? key,
  }) : super(key: key);

  final Map<String, AppPolicy> policies;
  final Function(String) setPolicyPath;
  final bool asSliver;

  @override
  Widget build(BuildContext context) {
    if (asSliver) {
      return SliverToBoxAdapter(
        child: _FooterContent(policies, setPolicyPath),
      );
    } else {
      return _FooterContent(policies, setPolicyPath);
    }
  }
}

class _FooterContent extends StatelessWidget {
  const _FooterContent(
    this.policies,
    this.setPolicyPath, {
    Key? key,
  }) : super(key: key);

  final Map<String, AppPolicy> policies;
  final Function(String) setPolicyPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: Responsive.contentPadding(context) +
          EdgeInsets.symmetric(horizontal: PADDING),
      child: Row(
        children: [
          AppName(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: PADDING),
              child: Wrap(
                children: [
                  for (final policy in policies.entries)
                    TextButton(
                      child: Text(
                        policy.value.title,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onPressed: () => setPolicyPath(policy.key),
                    ),
                ],
              ),
            ),
          ),
          SelectableText(
            AppLocals.copyright,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
