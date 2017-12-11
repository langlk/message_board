# Message Board API

# E-Commerce Refactor

### _Epicodus Practice in Ruby on Rails, December 11, 2017_

### By Kelsey Langlois

## Description

## Installation and Setup

To install on your own machine, follow the instructions below:

* Clone this repository.
* Ensure you have ImageMagick installed. Instructions are available [here](https://github.com/thoughtbot/paperclip#image-processor).
* Run the following commands in the project root directory:
  ```
  bundle update
  rake db:setup
  rails db:seed
  rails s
  ```
* Open ```localhost:3000``` in your web browser

## Specifications

### API calls:
* ```POST /authenticate```
  * **Parameters**
    * email: ```string``` (required)
    * password: ```string``` (required)
  * Returns an authentication token for the user with provided email and password.
* ```GET /groups```
  * Returns all groups.
* ```GET /groups/{group_id}```
  * Returns information about the group with provided group_id.
* ```GET /groups/{group_id}/messages```
  * **Parameters**
    * start_time: ```timestamp``` (optional)
    * end_time: ```timestamp``` (optional)
  * Returns all messages for the group with provided group_id. Limits to messages created between start_time and end_time if both params are provided.
* ```POST /groups/{group_id}/messages```
  * Posts a new message to the group with provided group_id.
* ```PUT /groups/{group_id}/messages/{message_id}```
  * Edits the message with provivded message_id in group with group_id.
* ```DELETE /groups/{group_id}/messages/{message_id}```
  * Deletes the message with provivded message_id in group with group_id.

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails

_Token-Based Authentication from [this tutorial](https://www.pluralsight.com/guides/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api)._

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
