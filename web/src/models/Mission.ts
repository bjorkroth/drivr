import MissionQuestion from "./MissionQuestion";

export default interface Mission{
    id:number;
    name:string;
    level:number;
    accomplished:boolean;
    description:string;
    experienceEarned:number;
    canBeDoneMultipleTimes:boolean;
    type:string;
    questions: MissionQuestion[];
}
