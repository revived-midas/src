require("dotenv");
const { Configuration, OpenAIApi } = require("openai");
const configuration = new Configuration({
  organization: "org-W6gmSilGrnL3RPeHU3bt128Y",
  apiKey: process.env.OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);

const fs = require('fs');
 // define your OpenAI credentials
const OPENAI_API_KEY = process.env.OPENAI_API_KEY;
 // define the model ID and the raw text data file path
const MODEL_ID = 'text-davinci-003';
const RAW_TEXT_DATA_PATH = './zero.txt';
 // read the raw text data file
const rawTextData = fs.readFileSync(RAW_TEXT_DATA_PATH, 'utf-8');
 // setup the OpenAI API client
openai.apiKey = OPENAI_API_KEY;
 // fine-tune the model with the raw text data
async function fineTuneModel() {
  const response = await openai.createFineTune({
    model: MODEL_ID,
    documents: [rawTextData],
    epochs: 3,
    batchSize: 8,
    learningRate: 1e-4,
    validationSet: [rawTextData]
  });
   // print the response from the API
  console.log(response);
}
 // call the fineTuneModel function
fineTuneModel();