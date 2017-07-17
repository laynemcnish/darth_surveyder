# Darth Surveyder

### Features
This is a simple survey application stolen from the Empire by the Rebel forces to help manage their needs for consensus.

Within the application, you can:

- Create new surveys
- View your existing surveys
- Search for existing surveys by partial word search in the question OR the survey categories
- Categorize your surveys by using existing categories sorted by your most frequently used categories or creating a new one
- Respond to existing surveys as many times as you desire
- See the results of the existing surveys
- Visit the `/about` page to see more information behind the Rebel forces’ motivations to retrieve this project. It is also accessible from the index page by clicking on the Darth Vader icon.

### Setup Instructions
If you do not have ruby installed on your machine, you can use the installation method of your choice or follow the instructions listed [here](https://www.ruby-lang.org/en/documentation/installation/).

To set up the application, please run:

`bin/setup`

The setup script will:

- Install gems
- Check your ruby version matches the project's expectations
- Check that you have Homebrew installed
- Install Elasticsearch if you don't have it already and make sure it's running
- Setup your database
- Seed your database with test data

If you run into any errors with Elasticsearch not starting correctly, you may see the following error:

`Failed to open TCP connection to localhost:9200`

Try running: `$ elasticsearch` in another tab and once it starts up, run the setup script again.  There are known ongoing issues with newer versions of Homebrew and how they manage their services so this is hopefully just a temporary patch around the problem until it is resolved.

### Running the application
To run the application in development:

`$ foreman start`

or you can run the following services separately:

`$ rails server`

`$ elasticsearch` If you don't have it running in the background already.

### Tests

For testing, this project uses RSpec and requires elasticsearch to be running.

To run the tests:

`$ elasticsearch` If you don't have it running in the background already.

`$ rspec spec/`
