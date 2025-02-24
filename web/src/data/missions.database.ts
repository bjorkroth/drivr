import Mission from "../models/Mission";

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

    const missions = await missionsCollections.find().toArray();

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

