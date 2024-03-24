import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/y_route_module_page.dart';
import 'package:my_go_router_transition_demo/routes/route_config.dart';

class YPage2 extends StatelessWidget {
  const YPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return YRouteModulePage(
      pageIndex: 2,
      targetPageName: YRouteNames.y3,
      bodyBg: Colors.orange,
      closeOnPressed: () => context.goNamed(
        XRouteNames.x3,
      ),
      targetOnPress: () => context.goNamed(
        YRouteNames.y3,
      ),
    );
  }
}
