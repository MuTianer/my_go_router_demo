import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/custom_app_bar.dart';
import 'package:my_go_router_transition_demo/common/style/text_style.dart';

class XRouteModulePage extends StatelessWidget {
  final int pageIndex;
  final String targetPageName;
  final VoidCallback targetOnPress;
  final VoidCallback closeOnPressed;
  final Color bodyBg;
  const XRouteModulePage({
    super.key,
    required this.pageIndex,
    required this.targetPageName,
    required this.bodyBg,
    required this.closeOnPressed,
    required this.targetOnPress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBg,
      appBar: customAppBar(
        title: 'X Module Page $pageIndex',
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
                    'X Module Page $pageIndex',
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
