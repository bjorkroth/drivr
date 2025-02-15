import { User } from "../models/User";

const { MongoClient, ServerApiVersion } = require('mongodb');
let connectionString = process.env.DB_CONN_STRING;

export async function getUserById(userId: string): Promise<User> {
    const client = new MongoClient(connectionString, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });

    try {
        const database = client.db('drivr');
        const usersCollection = database.collection('users');
        const findQuery = { id: userId };

        const user = await usersCollection.findOne(findQuery);

        return user;

    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => {})
    }
}

export async function getUserByProfileName(profileName: string): Promise<User> {
    const client = new MongoClient(connectionString, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });

    try {
        const database = client.db('drivr');
        const usersCollection = database.collection('users');
        const findQuery = { profileName: profileName };

        const user = await usersCollection.findOne(findQuery);

        return user;

    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => {})
    }
}

export async function addExperienceById(userId: string, experienceEarned: number): Promise<number> {
    const client = new MongoClient(process.env.DB_CONN_STRING, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });

    try {
        const database = client.db('drivr');
        const usersCollection = database.collection('users');
        const result = await usersCollection.updateOne({
            id: userId
        }, {
            $set: {
                progressExperience: experienceEarned
            }
        });

        return result.matchedCount;

    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => {})
    }
}

export async function setUserProgressLevel(userId: string, progressLevel: number): Promise<number> {
    const client = new MongoClient(process.env.DB_CONN_STRING, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });

    try {
        const database = client.db('drivr');
        const usersCollection = database.collection('users');
        const result = await usersCollection.updateOne({
            id: userId
        }, {
            $set: {
                progressLevel: progressLevel
            }
        });

        return result.matchedCount;

    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => {})
    }
}


export async function saveNewUser(user: User): Promise<User> {
    const client = new MongoClient(process.env.DB_CONN_STRING, {
        serverApi: {
            version: ServerApiVersion.v1,
            strict: true,
            deprecationErrors: true,
        }
    });

    try {
        const database = client.db('drivr');
        const usersCollection = database.collection('users');
        const userFromDb = await usersCollection.insertOne(user)

        return userFromDb;

    } catch (e) {
        throw new Error((<Error>e).message)
    } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => {})
    }
} 
