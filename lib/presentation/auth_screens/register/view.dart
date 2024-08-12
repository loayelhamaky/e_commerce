import 'package:e_commerce_app/presentation/auth_screens/register/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/base_api_state.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../../di/di.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_common_widgets.dart';
import '../cubit/auth_view_models/register_vm.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const String routeName = 'Register';
  final RegisterVm vm = getIt();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    vm.emptyFields();
    return BlocProvider(
      create: (context) => vm,
      child: BlocConsumer<RegisterVm, AuthState>(
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
        builder: (context, state) => Scaffold(
          backgroundColor: AppColors.primary,
          body: Form(
            key: vm.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    RegisterWidgets.routeImgInRegister(context),
                    AuthCommonWidgets.textFieldDescription('Full Name',
                        topMargin: 0),
                    AuthCommonWidgets.customTextFormField(
                        'enter your full name',
                        vm.userNameController,
                        vm.validateUserName),
                    AuthCommonWidgets.textFieldDescription(
                        'Mobile Number'),
                    AuthCommonWidgets.customTextFormField(
                        'enter your mobile no.',
                        vm.mobileNumController,
                        vm.validateMobileNumber),
                    AuthCommonWidgets.textFieldDescription(
                        'E-mail Address'),
                    AuthCommonWidgets.customTextFormField(
                        'enter your email address',
                        vm.emailController,
                        vm.validateEmail),
                    AuthCommonWidgets.textFieldDescription('Password'),
                    AuthCommonWidgets.customTextFormField(
                        'enter your password',
                        vm.passwordController,
                        vm.validatePassword),
                    AuthCommonWidgets.registerButton('Sign up', () {
                      state.state == BaseApiState.offline
                          ? DialogUtils.showErrorSnackBar(context, AppStrings.internetErrorMessage)
                          : vm.signUp();
                    }, context),
                    RegisterWidgets.createAccountLine(() {
                      vm.navigateToLogin(context);
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
