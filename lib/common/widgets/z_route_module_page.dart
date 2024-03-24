import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/custom_app_bar.dart';
import 'package:my_go_router_transition_demo/common/style/text_style.dart';

class ZRouteModulePage extends StatelessWidget {
  final int pageIndex;
  final Color bodyBg;
  final String targetPageName;
  final VoidCallback targetOnPress;
  final VoidCallback closeOnPressed;
  const ZRouteModulePage({
    super.key,
    required this.pageIndex,
    required this.targetPageName,
    required this.closeOnPressed,
    required this.targetOnPress,
    required this.bodyBg,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBg,
      appBar: customAppBar(
        title: 'Z Module Page $pageIndex',
        closeOnPressed: () {
          closeOnPressed();
        },
        backOnPressed: () => context.pop(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Z Module Page $pageIndex',
                    style: bodyText,
                  ),
                  ElevatedButton(
                    onPressed: targetOnPress,
                    child: Text(
                      'go to $targetPageName',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
