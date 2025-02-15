export default interface Event{
    id: string;
    type: 'Mission' | 'Question' | 'Level' | 'Exercise',
    isCompleted: boolean,
    dateTime: Date,
    userId: string,
    value: string,
    reference: string
}