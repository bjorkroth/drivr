import { Mission } from "../missions";

const { MongoClient, ServerApiVersion } = require('mongodb');
const password = encodeURIComponent("");
const uri = "mongodb+srv://drivr:"+password+"@drivr.wycjf.mongodb.net/?retryWrites=true&w=majority&appName=drivr";

const client = new MongoClient(uri, {
    serverApi: {
      version: ServerApiVersion.v1,
      strict: true,
      deprecationErrors: true,
    }
  });
  

export async function fetchMessions() : Promise<Mission[]> {
    try {
        const database = client.db('drivr');
        const missionsCollections = database.collection('missions');

        const missions = await missionsCollections.find().toArray();

        return missions;

      } finally {
        // Ensures that the client will close when you finish/error
        client.close().then(() => {
          console.log("client closed")
        })
      }
} 

