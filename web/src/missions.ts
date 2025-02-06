interface MissionQuestion{
    questionId:number;
    question:string;
    answer:string;
    alternatives:string[]
}

export interface Mission{
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
