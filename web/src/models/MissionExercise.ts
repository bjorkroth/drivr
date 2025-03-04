export default interface MissionExercise {
    exerciseId: number;
    title: string;
    canBeDoneMultipleTimes:boolean;
    isDone: boolean;
    experienceEarnedFirst:number;
    experienceEarnedRepeat:number;
}
