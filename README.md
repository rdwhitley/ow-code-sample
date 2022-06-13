# ow-code-sample
Orbweaver Code Sample Project for Candidates 

# Goals 
* To see how you approach problem solving 
* To see how you structure your code 
* To see how you interpret requirements

# Setup 
This is a Ruby on Rails project.  TODO: What else to add here. 

## Installing Ruby  
You will need to install Ruby version 2.7.4. This is done using a tool called [RVM](https://rvm.io) that separates this new Ruby install from from any other that might be on your system. 

### macOS 

### Windows 

### Linux

## Installing Ruby Dependencies
From the project directory, run the following command. 
```
bundle install
```

# Requirements 
This project is a small scale example of the kind of work we are frequently required to do. The goal is for you to write the code that will transform each non-header csv row into a JSON document. 

To complete this effort, the following items are required:

* Build a JSON Schema based on the structure of each CSV row.
    - Columns sku -> part_status should be at the top level.
    - Columns image -> 3d_model_iges should be part of an array with key 'images'.
    - Columns eu_rohs_y -> voltage_rating should be part of an array with key 'attributes'. Each entry should be a key/value pair.
* Create a JSON document from each CSV row, validate it using the schema and save it to the file system.
* Write tests to show that your code works as you expect. Your approach to testing is as important to us as your approach to coding.

## Bonus points 
If you would like to go further than the example above, you can try the following items 
* Configure ActiveRecord / SQLite to save each record to the database

# Coding
We have stubbed an [RSpec](https://rspec.info) test for you. When you have everything setup correctly, you can run 
```
rspec
```

The last output from that command will be
```ruby
Finished in 0.02701 seconds (files took 1.54 seconds to load)
1 example, 0 failures
```

# Wrapping Up
When you have finished coding and wish to create the final set of JSON documents, you can run this Rake command
```
rake ow:transform_csv
```
