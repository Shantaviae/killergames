// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/domain/entities/entities.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.errorMessage,
    required this.showDrawer,
    this.appId,
    this.setAppId,
    this.apps,
    required this.setPolicyPath,
    required this.policies,
    required this.onReset,
    required this.resetButtonLabel,
    Key? key,
  })  : assert(!showDrawer || (showDrawer && setAppId != null && apps != null)),
        super(key: key);

  final String errorMessage;
  final bool showDrawer;
  final String? appId;
  final Function(String)? setAppId;
  final Function(String) setPolicyPath;
  final Map<String, KillerGamesApp>? apps;
  final Map<String, AppPolicy> policies;
  final VoidCallback onReset;
  final String resetButtonLabel;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
        child: Scaffold(
          drawer: showDrawer ? CustomAppDrawer(appId, setAppId!, apps!) : null,
          body: Center(
            child: Container(
              width: responsive.isDesktop ? 600 : size.width - PADDING * 2,
              height: responsive.isDesktop ? 600 : size.height - PADDING * 2,
              decoration: BoxDecoration(
                borderRadius: RADIUS * 2,
                color: Theme.of(context).buttonColor.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(PADDING),
                      child: AutoSizeText(
                        errorMessage,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(160, 54),
                          primary: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(PADDING / 1.5),
                          shape: RoundedRectangleBorder(borderRadius: RADIUS),
                        ),
                        child: Text(
                          resetButtonLabel,
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                        ),
                        onPressed: onReset,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
