abstract class CoursesStates{}
class CoursesinitialgState extends CoursesStates{}
class CoursesLoadingState extends CoursesStates{}
class CoursesSuccessState extends CoursesStates{}
class CoursesFailedState extends CoursesStates{
  final error;
  CoursesFailedState(this.error);
}
