# Predicting Email Addresses
An application built in the Ruby language that predicts email addresses for an advisor. 

### How it works
When a new advisor's name and email domain are given, the application looks up historical data to determine the likely format for the advisor's email address.

### To run the application

1. Clone this repo
2. Bundle install
3. In the console type `irb -Ilib -rrun`

# Improvements / Bugs
In its current state the the application can return more than one email format for an advisor if the historical data is inconclusive, however I coded it in such a way that this will only work for the use case supplied. I think this is because of a flaw in the design of my app (for which I apologise). I will try and remedy this over the coming days. Also, formatting needs to be fixed for this particular scenario when printing to the console.