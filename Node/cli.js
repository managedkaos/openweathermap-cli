'use strict';

const weather = require('./src/weather.js');

const run = argv => weather(argv);

exports.run = argv => {
  const citycode = argv._.join(' ');
  run(citycode);
};
