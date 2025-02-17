import Event from "../models/Event";

const { MongoClient, ServerApiVersion } = require('mongodb');
let connectionString = process.env.DB_CONN_STRING;

export async function getUserEvents(userId: string): Promise<Event[]> {
    const client = new MongoClient(connectionString, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });
    try {
        const database = client.db('drivr');
        const eventsCollection = database.collection('events');

        const findQuery = { userId: userId };

        const events = await eventsCollection.find(findQuery).toArray();

        return events;

    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => { })
    }
}

export async function getMissionEvents(missionId: string, userId: string): Promise<Event[]> {
    const client = new MongoClient(connectionString, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });
    try {
        const database = client.db('drivr');
        const eventsCollection = database.collection('events');

        const findQuery = {
            reference: missionId,
            type: "Mission",
            userId: userId
         };

        const events = await eventsCollection.find(findQuery).toArray();

        return events;

    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => { })
    }
}

export async function getQuestionEvents(questionId: string, userId: string): Promise<Event[]> {
    const client = new MongoClient(connectionString, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });
    try {
        const database = client.db('drivr');
        const eventsCollection = database.collection('events');

        const findQuery = {
            reference: questionId,
            type: "Question",
            userId: userId
         };

        const events = await eventsCollection.find(findQuery).toArray();

        return events;

    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => { })
    }
}

export async function saveEvent(event: Event) {
    const client = new MongoClient(process.env.DB_CONN_STRING, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });

    try {
        const database = client.db('drivr');
        const eventsCollection = database.collection('events');
        const eventFromDb = await eventsCollection.insertOne(event)

        return eventFromDb;

    } catch (e) {
        throw new Error((<Error>e).message)
    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => { })
    }
}