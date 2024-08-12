import 'package:e_commerce_app/presentation/auth_screens/login/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/enums/base_api_state.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/constants/app_text_styles.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../../di/di.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_common_widgets.dart';
import '../cubit/auth_view_models/login_vm.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String routeName = 'login';
  final LoginVm vm = getIt<LoginVm>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginVm>(
      create: (context) => vm,
      child: BlocConsumer<LoginVm, AuthState>(
        listener: (context, state) {
          if (state.state == BaseApiState.offline) {
            DialogUtils.showOfflineSnackBar(context);
          }
          if (state.state == BaseApiState.online &&
              vm.connectionWasPreviouslyOffline) {
            DialogUtils.showOnlineSnackBar(context);
          }
          if (state.state == BaseApiState.loading) {
            DialogUtils.showLoading(context);
          }
          if (state.state == BaseApiState.failure) {
            DialogUtils.hidePopContext(context);
            DialogUtils.showErrorSnackBar(
                context, state.errorMessage ?? AppStrings.errorDefaultMessage);
          }
          if (state.state == BaseApiState.success) {
            DialogUtils.hidePopContext(context);
            vm.navigateToHome(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            body: Form(
              key: vm.formKey,
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Column(
                        children: [
                          LoginWidgets.routeImgInLogin(context),
                          LoginWidgets.loginWelcomeTitle(context),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(bottom: 10.h, top: 20.h),
                            child: Text(
                              'Email',
                              style: AppTextStyles.registrationDescription
                                  .copyWith(fontSize: 20.sp),
                            ),
                          ),
                          AuthCommonWidgets.customTextFormField(
                              'enter your email address',
                              vm.emailController,
                              vm.validateEmail),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 25.h, bottom: 10.h),
                            child: Text(
                              'Password',
                              style: AppTextStyles.registrationDescription
                                  .copyWith(fontSize: 20.sp),
                            ),
                          ),
                          AuthCommonWidgets.customTextFormField(
                            'enter your password',
                            vm.passwordController,
                            vm.validatePassword,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text('Forgot password ?',
                                  style: AppTextStyles.registrationDescription),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          AuthCommonWidgets.registerButton('Login', () {
                            state.state == BaseApiState.offline
                                ? DialogUtils.showErrorSnackBar(context, AppStrings.internetErrorMessage)
                                : vm.login();
                          }, context),
                          LoginWidgets.createAccountLine(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
