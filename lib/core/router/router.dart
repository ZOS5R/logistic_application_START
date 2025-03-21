import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_app/Feuthers/auth/presentation/cubit/auth_cubit.dart';
import 'package:logistic_app/Feuthers/auth/presentation/screen/sign_in_screen.dart';
import 'package:logistic_app/Feuthers/driver/presentation/screens/driver_home_screen.dart';
import 'package:logistic_app/Feuthers/driver/presentation/screens/map_screen.dart';
import 'package:logistic_app/Feuthers/driver/presentation/screens/order_details_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/attendance/attendance_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/contact/contact_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/home/employee_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/job_info/job_info_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/profile/profile_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/rating_and_performance/performance_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/requests/requests_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/rewards/rewards_screen.dart';
import 'package:logistic_app/Feuthers/employe/presentation/screens/statistics_and_points/statistics_state_screen.dart';
import 'package:logistic_app/core/di/di.dart';
import 'package:logistic_app/core/router/rotue_names.dart';
import 'package:logistic_app/core/router/transaction.dart';

abstract class GoRouterApp {
  static bool isChecked = false;

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: RouteNames.signIn,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(
                child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<AuthCubit>()),
              ],
              child: const SignInScreen(),
            ));
          }),
//Employee
 GoRoute(
          path: RouteNames.employeeHome,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: const EmployeeHome());
          }),
//1
      GoRoute(
          path: RouteNames.personalInfo,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(
                child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<AuthCubit>()),
              ],
              child: ProfileScreen(),
            ));
          }),
      GoRoute(
          path: RouteNames.personalInfo,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(
                child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<AuthCubit>()),
              ],
              child: ProfileScreen(),
            ));
          }),
//2
      GoRoute(
          path: RouteNames.contactInfo,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: ContactInfoScreen());
          }),
      //3
      GoRoute(
          path: RouteNames.performanceStats,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: PerformanceStatsScreen());
          }),
      //4
      GoRoute(
          path: RouteNames.jobInfo,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: JobInfoScreen());
          }),
      //5
      GoRoute(
          path: RouteNames.statistics,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: StatisticsStateScreen());
          }),
      //6
      GoRoute(
          path: RouteNames.requests,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: RequestsScreen());
          }),
      //7
      GoRoute(
          path: RouteNames.attendance,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: AttendanceScreen());
          }),
      //8
      GoRoute(
          path: RouteNames.performanceStats,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: PerformanceStatsScreen());
          }),
      //9
      GoRoute(
          path: RouteNames.pointsRewards,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: PointsRewardsScreen());
          }),

      // DRiVER

      GoRoute(
          path: RouteNames.driverHome,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: const DriverHomeScreen());
          }),
      GoRoute(
          path: RouteNames.orderDetails,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: const OrderDetailsScreen());
          }),
      GoRoute(
          path: RouteNames.googleMap,
          pageBuilder: (
            context,
            state,
          ) {
            return CustomSlideTransition(child: GoogleMapScreen());
          }),
    ],
  );
}
