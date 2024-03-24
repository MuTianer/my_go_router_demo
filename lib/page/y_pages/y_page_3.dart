import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/y_route_module_page.dart';
import 'package:my_go_router_transition_demo/routes/route_config.dart';
import 'package:my_go_router_transition_demo/routes/z_route_config.dart';

class YPage3 extends StatelessWidget {
  const YPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return YRouteModulePage(
      pageIndex: 3,
      targetPageName: ZRouteNames.z1,
      bodyBg: Colors.purple,
      closeOnPressed: () => context.goNamed(
        XRouteNames.x3,
      ),
      targetOnPress: () => context.goNamed(
        ZRouteNames.z1,
      ),
    );
  }
}
