## API:


 - url and method: GET https://cash-machine-api.herokuapp.com/withdrawal
  - query parameters: 
    - amount: amount of money to be withdrawn (not required)
  - request/response example
    - valid input
        `GET  https://cash-machine-api.herokuapp.com/withdrawal?amount=180`
        
           
            {
               "amount":"180",
               "validation_context":null,
               "errors":{},
               "banknotes":{  
                  "100":1,
                  "50":1,
                  "20":1,
                  "10":1
                }
            }
            
    - invalid input:
        `GET https://cash-machine-api.herokuapp.com/withdrawal?amount=-15`
        
        
            {  
               "amount":"-15",
               "validation_context":null,
               "errors":{  
                  "amount":[  
                     "must be greater than or equal to 0",
                     "must be issued in multiples of $10."
                  ]
               }
            }
        
    - run locally
      - ruby version 2.4.1 is required
      - rails version 5.1.4 is required
      - run `bundle install` from project directory
      - run `rails s` from project directory to run local server
      - to test, open localhost:3000/withdrawal/?amount=180
    - run tests
      - run `rails db:create`
      - run `rails db:test:prepare` 
      - run `rspec spec/` from project directory

