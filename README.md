##Notes

####How to Run

Run `bundle install` in the project directory to install the gems.  

Please add your own OpenWeather API Key in the `.env` file, then run `shotgun
config.ru` - the server will start on `localhost:9393`  

To run the tests, copy the `.env` file to `.env.test`.  The test suite can be run 
with `rake` - the tests are the default task.  

####Things to improve

* The OpenWeather API defaults units to Kelvin (why..?) so in this app, I made the default
metric - it would be nice to pick your units, or default to the units used by
the country requested.  
* Add sunrise/sunset times, ideally in local time - although as far as I can
  see, OpenWeather does not include a location offset/timezone, and the times
  are given in UTC
* Caching the forecast could be very simply done if a DB was hooked up in the
  application - using PostgreSQL's json type, the data from the `WeatherFetcher`
  class could be dumped completely into a column.  Popular locations could be
  added to a small task so that they are fetched at a certain time each day (or
  each hour) so fresh information is always available while minimizing API calls.

Welcome to the interview task :)
===============================

If something is not clear or you need help - just ask :smile:. Nobody knows everything!

1. Read the task
2. Create a project
3. Please implement the project according to your own best standards, possibly
   - Tests, tdd
   - Code guidelines
   - Structure / architecture
   - Refactoring
   - Conventions
4. For the layout bootstrap or plain design is enough.
5. Make sure to commit frequently and feel free to stop working on it after 1-2 hours
6. Provide an overview which points you would improve if you had more time to work on the project

Scenario - Weathermap api client
---------------------------

Your app should be a client for the [Open Weather Map API](http://openweathermap.org/API#weather) JSON api

Features that should work:

* Display the weather at random geographic coordinates
* A form with city and country that fetches and displays the weather in this city
  - optional: cache the fetched weather data
* Gracefully handle the case where the city could not be found (display the information to the user)

Have fun!
