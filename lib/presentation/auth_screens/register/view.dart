import 'package:e_commerce_app/presentation/auth_screens/register/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/app_enums.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../../core/utils/error/error_strings.dart';
import '../../../di/di.dart';
import '../cubit/auth_state.dart';
import '../cubit/auth_view_models/register_vm.dart';
import '../login/view.dart';
import '../widgets/auth_common_widgets.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const String routeName = 'Register';
  final RegisterVm vm = getIt();

  @override
  Widget build(BuildContext context) {
    vm.emptyFields();

    return BlocProvider(
      create: (context) => vm,
      child: Scaffold(
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
                  AuthCommonWidgets.customTextFormField('enter your full name',
                      vm.userNameController, vm.validateUserName),
                  AuthCommonWidgets.textFieldDescription('Mobile Number'),
                  AuthCommonWidgets.customTextFormField('enter your mobile no.',
                      vm.mobileNumController, vm.validateMobileNumber),
                  AuthCommonWidgets.textFieldDescription('E-mail Address'),
                  AuthCommonWidgets.customTextFormField(
                      'enter your email address',
                      vm.emailController,
                      vm.validateEmail),
                  AuthCommonWidgets.textFieldDescription('Password'),
                  AuthCommonWidgets.customTextFormField('enter your password',
                      vm.passwordController, vm.validatePassword),

                  /// BlocBuilder for button state updates
                  BlocBuilder<RegisterVm, AuthState>(
                    builder: (context, state) {
                      return AuthCommonWidgets.registerButton('Sign up',
                          () async {
                        if (state.state == BaseApiState.offline) {
                          DialogUtils.showSnackBar(context, Colors.red,
                              ErrorStrings.internetErrorMessage);
                        } else {
                          await vm.signUp();
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        }
                      }, context);
                    },
                  ),

                  RegisterWidgets.createAccountLine(() {
                    vm.navigateToLogin(context);
                  }),

                  /// BlocListener to handle navigation and side effects
                  BlocListener<RegisterVm, AuthState>(
                    listener: (context, state) {
                      if (state.state == BaseApiState.offline) {
                        DialogUtils.showSnackBar(context, Colors.red,
                            ErrorStrings.internetErrorMessage);
                      }
                      if (state.state == BaseApiState.online &&
                          vm.connectionWasPreviouslyOffline) {
                        DialogUtils.showSnackBar(context, Colors.green,
                            AppStrings.internetRestoredMessage);
                      }
                      if (state.state == BaseApiState.loading) {
                        DialogUtils.showLoading(context);
                      }
                      if (state.state == BaseApiState.failure) {
                        DialogUtils.hidePopContext(context);
                        DialogUtils.showSnackBar(
                            context,
                            Colors.red,
                            state.errorMessage ??
                                ErrorStrings.errorDefaultMessage);
                      }
                      if (state.state == BaseApiState.success) {
                        DialogUtils.hidePopContext(context);
                      }
                    },
                    child: const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
