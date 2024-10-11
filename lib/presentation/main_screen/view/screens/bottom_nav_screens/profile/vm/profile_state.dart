import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/enums/app_enums.dart';

class ProfileState {
  final String name;
  final String email;
  final String number;
  final String address;
  final bool isFieldChanged;
  final BaseApiState apiState;
  final String? errorMessage;
  final bool resetFields;

  ProfileState({
    this.name = '',
    this.email = '',
    this.number = '',
    this.address = '',
    this.errorMessage = '',
    this.resetFields = false,
    this.isFieldChanged = false,
    this.apiState = BaseApiState.loading,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    String? number,
    String? address,
    String? errorMessage,
    bool? isFieldChanged,
    bool? resetFields,
    BaseApiState? apiState,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
      address: address ?? this.address,
      errorMessage: errorMessage?? this.errorMessage,
        isFieldChanged: isFieldChanged ?? this.isFieldChanged,
      apiState: apiState ?? this.apiState,
      resetFields: resetFields ?? this.resetFields
    );
  }
}
