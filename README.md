# Message Board API

### _Epicodus Practice in Ruby on Rails, December 11, 2017_

### By Kelsey Langlois

## Description

_This is an API for an example message board. It allows users to sign up, view groups and messages, log in, and create/update/delete their own messages._

## Installation and Setup

To install on your own machine, follow the instructions below:

* Clone this repository.
* Run the following commands in the project root directory:
  ```
  bundle update
  rake db:setup
  rails db:seed
  rails s -p 3001
  ```
* Open ```localhost:3001``` in your web browser

## Specifications

### Version 1

#### Authorization

All API calls besides creating a new user require an api key.

Posting, editing, and deleting messages requires an authentication token acquired from the ```Post /authenticate``` in addition to the api key.

Limited to 1000 requests per day per api key.

#### API calls:

Preface all api calls with ```/api/v1```
* ```Post /users```
  * **Parameters**
    * email: ```string``` (required)
    * name: ```string``` (required)
    * password: ```string``` (required)
  * Creates an account with the given user name, email, and password, and returns the user's api key.
* ```POST /authenticate```
  * **Parameters**
    * key: ```string``` (required)
    * email: ```string``` (required)
    * password: ```string``` (required)
  * Returns an authentication token for the user with provided email and password.
* ```GET /groups```
  * **Parameters**
    * key: ```string``` (required)
  * Returns all groups.
* ```GET /groups/{group_id}```
  * **Parameters**
    * key: ```string``` (required)
  * Returns information about the group with provided group_id.
* ```GET /groups/{group_id}/messages```
  * **Parameters**
    * key: ```string``` (required)
    * start_time: ```timestamp``` (optional)
    * end_time: ```timestamp``` (optional)
  * Returns all messages for the group with provided group_id. Limits to messages created between start_time and end_time if both params are provided.
* ```POST /groups/{group_id}/messages```
  * **Headers**
    * Authorization: ```string``` (required)
  * **Parameters**
    * key: ```string``` (required)
  * Posts a new message to the group with provided group_id.
* ```PUT /groups/{group_id}/messages/{message_id}```
  * **Headers**
    * Authorization: ```string``` (required)
  * **Parameters**
    * key: ```string``` (required)
  * Edits the message with provided message_id in group with group_id.
* ```DELETE /groups/{group_id}/messages/{message_id}```
  * **Headers**
    * Authorization: ```string``` (required)
  * **Parameters**
    * key: ```string``` (required)
  * Deletes the message with provided message_id in group with group_id.

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Rack::Throttle

_Token-Based Authentication from [this tutorial](https://www.pluralsight.com/guides/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api)._

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
