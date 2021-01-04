abstract class ProfileStates{}
class ProfileinitialgState extends ProfileStates{}
class ProfileLoadingState extends ProfileStates{}
class ProfileSuccessState extends ProfileStates{}
class ProfileFailedState extends ProfileStates{
  final error;
  ProfileFailedState(this.error);
}
