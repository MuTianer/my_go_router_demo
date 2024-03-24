import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/route_module_page.dart';
import 'package:my_go_router_transition_demo/page/x_pages/x_page_1.dart';
import 'package:my_go_router_transition_demo/page/x_pages/x_page_2.dart';
import 'package:my_go_router_transition_demo/page/x_pages/x_page_3.dart';
import 'package:my_go_router_transition_demo/routes/y_route_config.dart';

// ルート名を定義するクラス
class XRouteNames {
  static const String x1 = 'x1'; // ステップ1のルート名
  static const String x2 = 'x2'; // ステップ2のルート名
  static const String x3 = 'x3'; // ステップ3のルート名

  /// ここで独立したサブルートを定義します。独立したサブルートは複数存在し、相互にネストすることもできます。
  static const List<String> stepRoutesModule = [x1, x2, x3];
}

final xRouteConfig = <RouteBase>[
  GoRoute(
    path: XRouteNames.x1,
    name: XRouteNames.x1,
    pageBuilder: (context, state) => xRouteModulePage(
      context,
      fullscreenDialog: true,
      const XPage1(),
    ),
    routes: [
      GoRoute(
        path: XRouteNames.x2,
        name: XRouteNames.x2,
        pageBuilder: (context, state) => xRouteModulePage(
          context,
          const XPage2(),
        ),
        routes: [
          GoRoute(
            path: XRouteNames.x3,
            name: XRouteNames.x3,
            pageBuilder: (context, state) => xRouteModulePage(
              context,
              const XPage3(),
            ),
            routes: yRouteConfig,
          ),
        ],
      ),
    ],
  ),
];

RouteModulePage xRouteModulePage(
  BuildContext context,
  Widget child, {
  bool fullscreenDialog = false,
}) {
  return RouteModulePage(
    child: child,
    fullscreenDialog: fullscreenDialog,
    // 目標ルート名を取得して、
    // 現在の遷移アクションが現在の画面が含まれる独立したサブルートから退出したものかどうかを判断します。
    routeModuleExit: () {
      // 目標ルート名
      final lastRouteName = GoRouter.of(context)
              .routerDelegate
              .currentConfiguration
              .last
              .route
              .name ??
          '';
      return !XRouteNames.stepRoutesModule.contains(lastRouteName);
    },
  );
}
