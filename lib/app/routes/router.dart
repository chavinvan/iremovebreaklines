import 'package:auto_route/auto_route.dart';
import 'package:iremovebreaklines/app/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomeRoute.page, initial: true)
      ];
}
