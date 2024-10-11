import '../../../core/enums/app_enums.dart';

class AuthState {
  final String? errorMessage;
  final BaseApiState state;

  AuthState({this.errorMessage, this.state = BaseApiState.online});

  AuthState copyWith({
    String? errorMessage,
    BaseApiState? state,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      state: state ?? this.state,
    );
  }
}
