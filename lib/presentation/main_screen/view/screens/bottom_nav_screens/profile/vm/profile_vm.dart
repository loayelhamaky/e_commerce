import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/shared_prefs_utils/shared_prefs_utils.dart';
import '../../../../../../../domain/interface_repos/profile_repo.dart';
import 'profile_state.dart';

/// using api and sharedPrefs to save data
/// api only has fields to save email and name so saved all fields in sharedPrefs as well

@injectable
class ProfileVm extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileVm(this.profileRepo) : super(ProfileState());

  Future<void> getUserData() async {
    emit(state.copyWith(apiState: BaseApiState.loading));

    Map userData = await SharedPrefsUtils.getUserData();
    emit(state.copyWith(
      name: userData['fullName'] ?? 'enter your full name here',
      email: userData['email'] ?? 'enter your e-mail here',
      number: userData['number'] ?? 'enter your number here',
      address: userData['address'] ?? 'enter your address here',
      apiState: BaseApiState.success,
      isFieldChanged: false,
    ));
  }

  void onFieldChanged({
    String? name,
    String? email,
    String? number,
    String? address,
  }) {
    final bool isFieldChanged = (name ?? state.name) != state.name ||
        (email ?? state.email) != state.email ||
        (number ?? state.number) != state.number ||
        (address ?? state.address) != state.address;

    emit(state.copyWith(
      name: name ?? state.name,
      email: email ?? state.email,
      number: number ?? state.number,
      address: address ?? state.address,
      isFieldChanged: isFieldChanged,
    ));
  }

  Future<void> updateUserData() async {
    emit(state.copyWith(apiState: BaseApiState.loading));

    String? updatedName = state.name.isEmpty ? null : state.name;
    String? updatedEmail = state.email.isEmpty ? null : state.email;
    String? updatedNumber = state.number.isEmpty ? null : state.number;
    String? updatedAddress = state.address.isEmpty ? null : state.address;
    Map prefsData = await SharedPrefsUtils.getUserData();
    if (updatedName != prefsData['fullName'] ||
        updatedEmail != prefsData['email']) {
      var response = await profileRepo.updateUserData(
        name: updatedName,

        /// api shouldn't receive email if no change or will give response error
        email: updatedEmail == prefsData['email'] ? '' : updatedEmail,
      );
      response.fold((error) {
        emit(state.copyWith(
            apiState: BaseApiState.failure, errorMessage: error));
      }, (user) async {
        updatedName = user?.name ?? updatedName;
        updatedEmail = user?.email ?? updatedEmail;
        await SharedPrefsUtils.saveUserData(
          email: updatedEmail,
          address: updatedAddress ?? state.address,
          fullName: updatedName,
          number: updatedNumber ?? state.number,
        );
        emit(state.copyWith(
          name: updatedName,
          email: updatedEmail,
          number: updatedNumber,
          address: updatedAddress,
          isFieldChanged: false,
          apiState: BaseApiState.success,
          resetFields: true,
        ));
      });
    }
  }

  void onIgnoreTap() async {
    emit(state.copyWith(apiState: BaseApiState.loading));
    await getUserData();
    emit(state.copyWith(
      apiState: BaseApiState.success,
      isFieldChanged: false,
      resetFields: true,
    ));
  }
}
