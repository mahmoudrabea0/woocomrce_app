abstract class SearchStates{}
class SearchinitialgState extends SearchStates{}
class SearchLoadingState extends SearchStates{}
class SearchSuccessState extends SearchStates{}
class SearchFailedState extends SearchStates{
  final error;
  SearchFailedState(this.error);
}

