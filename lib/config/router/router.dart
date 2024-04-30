import 'package:dashboard_app/config/router/path_router.dart';
import 'package:dashboard_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: PathRouter.splash, routes: [
  GoRoute(
    path: PathRouter.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: PathRouter.login,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: PathRouter.editProfile,
    builder: (context, state) => const EditProfile(),
  ),
  GoRoute(
      path: PathRouter.adminUsers,
      builder: (context, state) => const AdminUsers()),
  GoRoute(
    path: PathRouter.resetPassword,
    builder: (context, state) => const ResetPasswordPage(),
  ),
  GoRoute(
    path: PathRouter.forgetPassword,
    builder: (context, state) => const ForgetPasswordPage(),
  ),
  GoRoute(
    path: PathRouter.ordersBuys,
    builder: (context, state) => const OrdersBuysPage(),
  ),
  GoRoute(
    path: PathRouter.controlExpenses,
    builder: (context, state) => const DashBoardPage(),
  ),
  GoRoute(
    path: PathRouter.editProfile,
    builder: (context, state) => const EditProfile(),
  ),
  GoRoute(
    path: PathRouter.theme,
    builder: (context, state) => const ThemeScreen(),
  ),
  GoRoute(
    path: PathRouter.viewCountLevel5,
    builder: (context, state) => ViewAccountsLevel5Page(
      id: state.pathParameters['id']!,
    ),
  ),
]);
