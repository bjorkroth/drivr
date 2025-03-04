import MissionExercise from "./MissionExercise";
import MissionQuestion from "./MissionQuestion";

export default interface Mission{
    id:number;
    name:string;
    level:number;
    accomplished:boolean;
    description:string;
    experienceEarned:number;
    type:string;
    questions: MissionQuestion[];
    exercies: MissionExercise[];
}


