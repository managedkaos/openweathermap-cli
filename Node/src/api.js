'use strict';

const got = require('got');
const helpers = require('./helpers');

const provider = 'http://api.openweathermap.org/data/2.5/weather?';
const headers = {
  'user-agent': 'https://www.github.com/singhalpiyush12/openweathermap-cli'
};

const api = (citycode) => {
  if (!citycode) {
    return false;
  }

  const normalizedName = helpers.normalizeName(citycode);


  const city = got(`${provider}q=${normalizedName}&units=imperial&appid=912c3cc936f5af8ac68f22cba2616f8a`, {headers, json: true})
    .then(response => {
      const result = response.body;
      return result;
      //return result === null ? false : result[0];
    })
    .catch(err => {
      return err.body;
    });

  return city;
};

module.exports = api;
