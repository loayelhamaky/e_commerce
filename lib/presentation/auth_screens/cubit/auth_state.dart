
import '../../../core/enums/base_api_state.dart';

class AuthState {
  String? errorMessage;
  BaseApiState state;
  AuthState({this.errorMessage, this.state = BaseApiState.online});
}