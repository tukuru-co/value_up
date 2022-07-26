import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:value_up/app/modules/auth/bindings/auth_bindings.dart';
import 'package:value_up/app/modules/auth/views/login1.dart';
import 'package:value_up/app/modules/auth/views/login2.dart';
import 'package:value_up/app/modules/auth/views/login3.dart';
import 'package:value_up/app/modules/home/views/home.dart';
import 'package:value_up/app/modules/home/views/home_detail1.dart';
import 'package:value_up/app/modules/home/views/home_detail3.dart';
import 'package:value_up/app/modules/root/views/root_view.dart';
import 'package:value_up/app/routes/app_routes.dart';

import '../modules/home/views/home_detail2.dart';

class Theme1AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: Routes.ROOT, page: () => RootView(), binding: AuthBinding()),
    GetPage(name: Routes.LOGIN, page: () => LoginView(), binding: AuthBinding()),
    GetPage(name: Routes.LOGIN2, page: () => LoginView2(), binding: AuthBinding()),
    GetPage(name: Routes.LOGIN3, page: () => LoginView3(), binding: AuthBinding()),
    GetPage(name: Routes.LOGIN3, page: () => LoginView3(), binding: AuthBinding()),
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: AuthBinding()),
    GetPage(name: Routes.HOME_DETAIL1, page: () => HomeDetail1(), binding: AuthBinding()),
    GetPage(name: Routes.HOME_DETAIL2, page: () => HomeDetail2(), binding: AuthBinding()),
    GetPage(name: Routes.HOME_DETAIL3, page: () => HomeDetail3(), binding: AuthBinding()),
  ];
}