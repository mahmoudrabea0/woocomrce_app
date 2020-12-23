abstract class LoginStates{}

class LoginStateInitial extends LoginStates{}

class LoginStateSuccess extends LoginStates
{
  final token;

  LoginStateSuccess(this.token);
}


class LoginStateLoading extends LoginStates{}

class LoginStateError extends LoginStates{
  final error;
  LoginStateError(this.error);
}
