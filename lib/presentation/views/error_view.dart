import 'package:flutter/material.dart';
import 'package:killergames/core/core.dart';
import 'package:killergames/presentation/widgets/shared/widgets.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: PADDING * 1.25),
            alignment: Alignment.center,
            child: SizedBox(
              width: responsive.isDesktop ? 600 : size.width - PADDING * 2,
              height: responsive.isDesktop ? 600 : size.height - PADDING * 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        AppLocals.error404,
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 54),
                          primary: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(PADDING / 1.5),
                          shape: RoundedRectangleBorder(borderRadius: RADIUS),
                        ),
                        child: Text(
                          AppLocals.returnHome,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        onPressed: () => Navigator.of(context)
                            ?.pushReplacementNamed(RouteDelegate.home),
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
