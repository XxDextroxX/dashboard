import 'package:dashboard_app/config/router/path_router.dart';
import 'package:dashboard_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: PathRouter.splash, routes: [
  GoRoute(
    path: PathRouter.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: PathRouter.home,
    builder: (context, state) => const HomePage(),
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
]);
