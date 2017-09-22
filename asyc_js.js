const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function ask () {
  reader.question('Want tea?', (response) => {
    console.log(response);
    reader.question("and dem biscutz", (response2) => {
      console.log(response2);
      console.log(`${response} and ${response2} sounds good`);
      reader.close();
    });
  });
}

ask();
