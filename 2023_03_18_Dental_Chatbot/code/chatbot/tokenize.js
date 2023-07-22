const fs = require('fs');
const natural = require('natural');
const tokenizer = new natural.AggressiveTokenizer();
 // define the raw text data path
const RAW_TEXT_DATA_PATH = './zero.txt';
const PREPROCESSED_DATA_PATH = './preprocessed/preprocessed_data.jsonl';
 // read the raw text data file
const rawTextData = fs.readFileSync(RAW_TEXT_DATA_PATH, 'utf-8');
 // define a function to preprocess the raw text data
function preprocessText(text) {
  const tokens = tokenizer.tokenize(text);
  console.log(tokens);
  return tokens.join(' ');
}
 // preprocess the raw text data and write to a JSONL file
const preprocessedData = rawTextData
  .split('\n')
  .map((line) => ({ text: preprocessText(line) }))
  .filter((obj) => obj.text.trim().length > 0)
  .map((obj) => JSON.stringify(obj))
  .join('\n');
fs.writeFileSync(PREPROCESSED_DATA_PATH, preprocessedData);