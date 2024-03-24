import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/route_module_page.dart';
import 'package:my_go_router_transition_demo/page/y_pages/y_page_1.dart';
import 'package:my_go_router_transition_demo/page/y_pages/y_page_2.dart';
import 'package:my_go_router_transition_demo/page/y_pages/y_page_3.dart';

// ルート名を定義するクラス
class YRouteNames {
  static const String y1 = 'y1'; // ステップ1のルート名
  static const String y2 = 'y2'; // ステップ2のルート名
  static const String y3 = 'y3'; // ステップ3のルート名

  /// ここで独立したサブルートを定義します。独立したサブルートは複数存在し、相互にネストすることもできます。
  static const List<String> stepRoutesModule = [y1, y2, y3];
}

final yRouteConfig = <RouteBase>[
  GoRoute(
    path: YRouteNames.y1,
    name: YRouteNames.y1,
    pageBuilder: (context, state) => yRouteModulePage(
      context,
      fullscreenDialog: true,
      const YPage1(),
    ),
    routes: [
      GoRoute(
        path: YRouteNames.y2,
        name: YRouteNames.y2,
        pageBuilder: (context, state) => yRouteModulePage(
          context,
          const YPage2(),
        ),
        routes: [
          GoRoute(
            path: YRouteNames.y3,
            name: YRouteNames.y3,
            pageBuilder: (context, state) => yRouteModulePage(
              context,
              const YPage3(),
            ),
          ),
        ],
      ),
    ],
  ),
];

RouteModulePage yRouteModulePage(
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
      return !YRouteNames.stepRoutesModule.contains(lastRouteName);
    },
  );
}
