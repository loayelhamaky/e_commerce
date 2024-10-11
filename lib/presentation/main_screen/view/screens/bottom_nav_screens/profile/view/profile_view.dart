import 'package:e_commerce_app/core/utils/error/error_strings.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/profile/view/widgets/apply_and_ignore_buttons.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/profile/view/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/profile/view/widgets/profile_text_field.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../core/utils/dialog_utils.dart';
import '../../../../../../../di/di.dart';
import '../../../../main_ui_component/header_search_bar.dart';
import '../../../../../../../core/utils/constants/app_strings.dart'; // Added import
import '../vm/profile_state.dart';
import '../vm/profile_vm.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const String routeName = 'profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileVm profileVm = getIt();

  @override
  void initState() {
    super.initState();
    profileVm.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<ProfileVm, ProfileState>(
          bloc: profileVm,
          listener: (context, state) {
            if (state.apiState == BaseApiState.loading) {
              DialogUtils.showLoading(context);
            }
            if (state.apiState == BaseApiState.success) {
              DialogUtils.hidePopContext(context);
            }
            if (state.apiState == BaseApiState.failure) {
              DialogUtils.hidePopContext(context);
              DialogUtils.showSnackBar(context, Colors.red,
                  state.errorMessage ?? ErrorStrings.errorDefaultMessage);
            }
          },
          child: BlocBuilder<ProfileVm, ProfileState>(
            bloc: profileVm,
            builder: (context, state) {
              return Column(
                children: [
                  const HeaderSearchBar(),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      children: [
                        ProfileScreenTextField(
                          label: AppStrings.yourFullName,
                          value: state.name,
                          resetField: state.resetFields,
                          onChanged: (newValue) {
                            profileVm.onFieldChanged(name: newValue);
                          },
                        ),
                        ProfileScreenTextField(
                          label: AppStrings.yourEmail,
                          value: state.email,
                          resetField: state.resetFields,
                          onChanged: (newValue) {
                            profileVm.onFieldChanged(email: newValue);
                          },
                          inputType: TextInputType.emailAddress,
                        ),
                        ProfileScreenTextField(
                          label: AppStrings.yourMobileNumber,
                          value: state.number,
                          resetField: state.resetFields,
                          onChanged: (newValue) {
                            profileVm.onFieldChanged(number: newValue);
                          },
                          inputType: TextInputType.phone,
                        ),
                        ProfileScreenTextField(
                          label: AppStrings.yourAddress,
                          value: state.address,
                          resetField: state.resetFields,
                          isAddress: true,
                          onChanged: (newValue) {
                            profileVm.onFieldChanged(address: newValue);
                          },
                        ),
                        const LogoutButton(),
                      ],
                    ),
                  ),

                  /// buttons wrapped with visibility to apply or ignore changes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileApplyIgnoreButton(
                        label: AppStrings.ignore,
                        visible: state.isFieldChanged,
                        onPressed: () {
                          profileVm.onIgnoreTap();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      ProfileApplyIgnoreButton(
                          label: AppStrings.apply,
                          visible: state.isFieldChanged,
                          onPressed: () {
                            profileVm.updateUserData();
                            FocusScope.of(context).unfocus();
                          })
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}