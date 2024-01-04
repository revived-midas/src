const fs = require("fs");
const path = require("path");

(async () => {
    const files = fs.readdirSync("./dump/");

    for (const file of files) {
        if (!file.includes(".jpg")) {
            fs.renameSync("./dump/" + file, "./dump/" + file + ".jpg");
        }
    }
})();