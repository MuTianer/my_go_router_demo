import 'package:flutter/cupertino.dart';

/// 独立したサブルートの単一ページのアニメーションオブジェクトは、
/// Pageを継承し、createRouteメソッドをオーバーライドしています。
///
/// ページ遷移時に、[routeModuleExit] パラメーターの判定を追加しました。
///
/// [routeModuleExit] は、
/// 現在のページが含まれる独立したサブルートが終了しているかどうかを判断するために使用されます。
///
/// サブルートモジュールのページアニメーション関連オブジェクトを作成します。
///
/// [fullscreenDialog]
/// フルスクリーンダイアログであるかどうか、画面全体を覆うモーダルで、
/// 入場および退場アニメーションは縦方向です[Cupertino SlideTransition アニメーション]
///
/// 任意の独立したサブルート内のページを開くとき、
/// topPage => context.goNamed(step1)
/// topPage => context.goNamed(step2)
/// topPage => context.goNamed(step3),
/// これは独立したサブルートに入ることと同等です。
/// したがって、この時のstepX画面の入場アニメーションは、
/// 画面下部から上方向にスライドする[Cupertino SlideTransition メインアニメーション]であるべきです。
///
/// 任意の独立したサブルートからtopPageに戻るとき、
/// step1 => context.goNamed(topPage)
/// step2 => context.goNamed(topPage)
/// step3 => context.goNamed(topPage)
/// これは独立したサブルートからの退出と同等です。
/// したがって、この時のstepX画面の退場アニメーションは、
/// 画面中央から下方向にスライドアウトする[Cupertino SlideTransition メインアニメーション]であるべきです。
///
/// 独立したサブルート画面間の切り替え時、
/// サブルート内のページ間の切り替えと同等であり、以下の2つのケースがあります。
///
/// 1. ルートの進行: step1 => step2 => step3
/// step1 => step2の場合を例に取ります。この時、
/// step2のアニメーションは画面右側から中央にスライドインする[Cupertino SlideTransition メインアニメーション]であるべきです。
/// 同時に、step1のsecondaryAnimationを無視しないでください。
/// この時、step2のアニメーションは画面中央から右側にスライドアウトする[Cupertino SlideTransition セカンダリアニメーション]であるべきです。
///
/// 2. ルートの後退: step3 => step2 => step1
/// step3 => step2の場合を例に取ります。
/// この時、step2のアニメーションは画面中央から右側にスライドアウトする[Cupertino SlideTransition メインアニメーション]であるべきです。
class RouteModulePage<T> extends Page<T> {
  const RouteModulePage({
    required this.child,
    required this.routeModuleExit,
    this.maintainState = true,
    this.title,
    this.fullscreenDialog = false,
    this.allowSnapshotting = true,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;

  final String? title;

  final bool maintainState;

  final bool fullscreenDialog;

  final bool allowSnapshotting;

  final bool Function() routeModuleExit;

  @override
  Route<T> createRoute(BuildContext context) {
    return _PageBasedRouteModule<T>(
      page: this,
      routeModuleExit: routeModuleExit,
      allowSnapshotting: allowSnapshotting,
    );
  }
}

/// PageRouteを継承し、CupertinoRouteTransitionMixinを使用して、
/// Cupertinoのページ遷移アニメーション効果を保持し、[routeModuleExit] パラメーターを追加しました。
/// [routeModuleExit] は、現在のページが含まれる独立したサブルートが終了しているかどうかを判断するために使用されます。
///
/// buildTransitionsメソッドをオーバーライドしました：
/// 現在のページが終了している場合、
/// 主要な [animation] と [routeModuleExit] を判断して、表示する必要があるトランジションアニメーション効果を選択します。
class _PageBasedRouteModule<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  final bool Function() routeModuleExit;
  _PageBasedRouteModule({
    required RouteModulePage<T> page,
    required this.routeModuleExit,
    super.allowSnapshotting,
  }) : super(settings: page) {
    assert(opaque);
  }

  RouteModulePage<T> get _page => settings as RouteModulePage<T>;

  @override
  Widget buildContent(BuildContext context) => _page.child;

  @override
  String? get title => _page.title;

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // 現在のルートアクションが後退で、かつ目標ページが現在の独立したサブルートに存在しない場合、
    // フルスクリーンダイアログのトランジションアニメーション効果を使用します。
    if (routeModuleExit() && animation.status == AnimationStatus.reverse) {
      return CupertinoFullscreenDialogTransition(
        primaryRouteAnimation: animation,
        secondaryRouteAnimation: secondaryAnimation,
        linearTransition: popGestureInProgress,
        child: child,
      );
    } else {
      return super.buildTransitions(
        context,
        animation,
        secondaryAnimation,
        child,
      );
    }
  }
}
