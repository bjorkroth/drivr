class MissionExercise {
  final int exerciseId;
  final int missionId;
  final String title;
  final bool canBeDoneMultipleTimes;
  final bool isDone;
  final int experienceEarnedFirst;
  final int experienceEarnedRepeat;

  MissionExercise(this.exerciseId, this.missionId, this.title,
      this.canBeDoneMultipleTimes, this.isDone, this.experienceEarnedFirst, this.experienceEarnedRepeat);

  factory MissionExercise.fromJson(Map<String, dynamic> data) {
    final int exerciseId = data['exerciseId'];
    final int missionId = data['missionId'];
    final String title = data['title'];
    final bool canBeDoneMultipleTimes = data['canBeDoneMultipleTimes'];
    final bool isDone = data['isDone'];
    final int experienceEarnedFirst = data['experienceEarnedFirst'];
    final int experienceEarnedRepeat = data['experienceEarnedRepeat'];


    return MissionExercise(
        exerciseId, missionId, title, canBeDoneMultipleTimes, isDone, experienceEarnedFirst, experienceEarnedRepeat);
  }
}
