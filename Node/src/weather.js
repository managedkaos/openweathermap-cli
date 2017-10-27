'use strict';

const chalk = require('chalk');
const figures = require('figures');
const ora = require('ora');
const api = require('./api.js');

const weather = citycode => {
  const city = api(citycode);

  if (!city) {
    return false;
  }

  const spinner = ora(`Searching for ${chalk.yellow(citycode)}`).start();
  return city.then(result => {
    spinner.stop();
    if (!result) {
      return console.log(chalk.yellow.bold('Location not found on Web :('));
    }

    const weatherRes = `
  ${chalk.black.bgYellow.bold(citycode)} on WeatherAPI:

  Name: ........ ${result.name} min
  Temperature: . ${result.main.temp}
  Weather: ...... ${result.weather[0].main}
    `;

    console.log(weatherRes);
  }).catch(err => {
    spinner.stop();
    console.error(chalk.red.bold('Something went wrong :('));
    console.error(err);
  });
};

module.exports = weather;
