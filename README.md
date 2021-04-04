# about-me-clone

<p align="center">
  <img src="readme/homepage.gif" />
</p>

## About this project
 
This web app is a clone of [about.me](https://about.me/), that is, it allows you to create a personal presentation page. I started this project to improve my Ruby and Ruby on Rails skills, so i will be very happy if you can provide me with any feedback on the project, code, structure or anything you can report that can make me a better developer!

See the app working [here](https://about-me-clone.herokuapp.com/).

Send me an email: g2_ribeiro@hotmail.com

Connect with me on [LinkedIn](https://www.linkedin.com/in/gustavo-ribeiro-488b4a17a/).

## Functionalities
- Create your custom presentation page
- Change your information and page design (WIP)

## Running the app locally
### Prerequisites

To execute this project you will need:
    
  1. Ruby 2.6.3
  2. Ruby on Rails 6.0.3
  3. PostgreSQL

### Cloning the Repository

Run these commands to clone and enter the project directory:

```
  $ git clone https://github.com/gustavothecoder/about-me-clone.git

  $ cd about-me-clone
```

### Installing dependencies

Run this command to install all dependencies:

```
  $ bundle install
  
  $ yarn install
```

### Create and populate the database

Run these commands to create and populate the database:

```
  $ rails db:create
  
  $ rails db:migrate && rails db:migrate RAILS_ENV=test
  
  $ rails db:seed && rails db:seed RAILS_ENV=test
```

### Testing

Run the test suite with `rspec` to check that everything is OK.

### Running app

With all dependencies installed and the environment properly configured, you can now run the app:

```
  $ rails s
```

Then open the browser of your choice and access the address __localhost:3000__.
