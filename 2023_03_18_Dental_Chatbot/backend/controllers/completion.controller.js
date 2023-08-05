require("dotenv").config();

const { Configuration, OpenAIApi } = require("openai");
const configuration = new Configuration({
  organization: "org-W6gmSilGrnL3RPeHU3bt128Y",
  apiKey: process.env.OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);

exports.getCompletion = async (req, res) => {
  const { prompt } = req.body;
  const body = await openai.createCompletion({
    // model: "curie:ft-personal-2023-03-09-19-36-39",
    model: "ada",
    prompt: prompt,
    max_tokens: 1,
    temperature: 0,
  });
  const { data } = body;

  res.send(JSON.stringify(data.choices));
};
