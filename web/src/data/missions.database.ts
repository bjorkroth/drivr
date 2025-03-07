import { query } from "express";
import Mission from "../models/Mission";
import MissionExercise from "../models/MissionExercise";

const { MongoClient, ServerApiVersion } = require('mongodb');
let connectionString = process.env.DB_CONN_STRING;

export async function fetchMessions(): Promise<Mission[]> {
  const client = new MongoClient(connectionString, {
    serverApi: {
      version: ServerApiVersion.v1,
      strict: true,
      deprecationErrors: true,
    }
  });

  try {
    const database = client.db('drivr');
    const missionsCollections = database.collection('missions');

    const missions = await missionsCollections.find().sort({ "id": 1}).toArray();

    return missions;

  } finally {
    // Ensures that the client will close when you finish/error
    client.close().then(() => {})
  }
}

export async function getSingleMission(missionId: number): Promise<Mission> {
  const client = new MongoClient(connectionString, {
    serverApi: {
      version: ServerApiVersion.v1,
      strict: true,
      deprecationErrors: true,
    }
  });
  try {
    const database = client.db('drivr');
    const missionsCollections = database.collection('missions');

    const findQuery = { id: missionId };

    const mission = await missionsCollections.findOne(findQuery);

    return mission;

  } finally {
    // Ensures that the client will close when you finish/error
    client.close().then(() => {})
  }
}

export async function updateMissionExercise(exercise:MissionExercise) {
  const client = new MongoClient(process.env.DB_CONN_STRING, {
      serverApi: {
          version: ServerApiVersion.v1,
          strict: true,
          deprecationErrors: true,
      }
  });

  try {
      const database = client.db('drivr');
      const missionsCollections = database.collection('missions');
      const findQuery = { id: exercise.missionId };
      const currentMissionFromDb : Mission = await missionsCollections.findOne(findQuery);

      let exercisesOnMission = currentMissionFromDb.exercises;
      exercisesOnMission.push(exercise);

      const result = await missionsCollections.updateOne({
        id: exercise.missionId
      }, {
        $set: {
          exercises: exercisesOnMission
        }
      });

      if(result.matchedCount > 1){
        throw new Error("Updated more than one.");
      }
  } catch (e) {
      throw new Error((<Error>e).message)
  } finally {
      // Ensures that the client will close when you finish/error
      client.close().then(() => { })
  }
}

