# README
This app depends on a postgres instance running on your machine and Ruby 2.5.3

It is deployed [here](https://thawing-taiga-27950.herokuapp.com/)

Setup after cloning from root, run:
`bundle`
`rake db:create`
`rake db:migrate`
`rails s`

Testing from root, run:
`rspec`

known issues:
Testing is light for front-end gameplay mechanics due to the unpredictable nature of random numbers ;-)
The gameplay algorithm is maybe too simple, and maybe should be abstracted into its own class
