# TV Network

## Setup Instructions (for Instructors)

* Clone this repo
* remove the turingschool remote
* remove the git history and initialize a new git repo (`rm -rf .git && git init`)
* commit .keep files in the `lib` and `test` directories, and the `##Instructions` from the README, for students.
* create a branch called `spec`
* commit the Gemfile, spec directory, and, optionally, the remainder of the README
* Create a new repo on turingschool-examples called `school_challenge_<cohort number>`
* Add that remote
* Push up both branches


### Spec Harness Instructions

In order to run the spec harness, first create a directory with a `students.txt` file.

In `students.txt`, put a list of your students Github handles.  For example:

```
aziobrow
dionew1
memcmahon
s-espinosa
```

From the command line, run the following script, replacing `<repository_name` with the name of the challenge repo:

```
for i in `cat students.txt`; do
  git clone git@github.com:$i/<repository_name> $i
  cd $i
  git pull origin spec # this will cause a merge commit message
  rspec
  echo
  echo
  read -p 'Press Enter to continue'
  cd ..
done
```

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

## Iteration 1

Use TDD to create a `Character` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/character'
# => true

pry(main)> kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})    
# => #<Character:0x00007f98a4ba8dc8...>

pry(main)> kitt.name
# => "KITT"

pry(main)> kitt.actor
# => "William Daniels"

pry(main)> kitt.salary
# => 1000000
```

## Iteration 2

Use TDD to create a `Show` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/character'
# => true

pry(main)> require './lib/show'
# => true

pry(main)> kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})    
# => #<Character:0x00007f98a4ba8dc8...>

pry(main)> michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
# => #<Character:0x00007f8327213de0...>

pry(main)> knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])    
# => #<Show:0x00007f83280b3288...>

pry(main)> knight_rider.name
# => "Knight Rider"

pry(main)> knight_rider.creator
# => "Glen Larson"

pry(main)> knight_rider.characters
# => [#<Character:0x00007f8327213de0...>, #<Character:0x00007f8326ab57d8...>]

pry(main)> knight_rider.total_salary
# => 2600000

pry(main)> knight_rider.highest_paid_actor
# => "David Hasselhoff"

pry(main)> knight_rider.actors
# => ["David Hasselhoff", "William Daniels"]


```

## Iteration 3

Use TDD to create a `Network` class that responds to the following interaction pattern. A character is a main character for the network if their salary is greater than 500_000 and their character name has no lowercase letters.

```ruby
pry(main)> require './lib/network'
# => true

pry(main)> require './lib/show'
# => true

pry(main)> require './lib/character'
# => true

pry(main)> nbc = Network.new("NBC")    
# => #<Network:0x00007fe5f83ea3b0...>

pry(main)> nbc.name
# => "NBC"

pry(main)> nbc.shows
# => []

pry(main)> michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})    
# => #<Character:0x00007fe5f88721f8...>

pry(main)> kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})    
# => #<Character:0x00007fe5f8448f78...>

pry(main)> knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])    
# => #<Show:0x00007fe5f8398970...>

pry(main)> leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
# => #<Character:0x00007fe5f832bb18...>

pry(main)> ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})    
# => #<Character:0x00007fe5f8172a60...>

pry(main)> parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])    
# => #<Show:0x00007fe5f88b0a20...>

pry(main)> nbc.add_show(knight_rider)

pry(main)> nbc.add_show(parks_and_rec)    

pry(main)> nbc.shows
# => [#<Show:0x00007fe5f8398970...>, #<Show:0x00007fe5f88b0a20...>]

pry(main)> nbc.main_characters
# => [#<Character:0x00007f98a4ba8dc8...>]

pry(main)> nbc.actors_by_show
# => {
      #<Show:0x00007fe5f8398970...> => ["David Hasselhoff", "William Daniels"],
      #<Show:0x00007fe5f88b0a20...> => ["Amy Poehler", "Nick Offerman"]
#    }
```

## Iteration 4

Use TDD to update your `Network` class so that it responds to the following interaction pattern. An actor is considered prolific if they have been in more than one show for that network:

```ruby
pry(main)> require './lib/network'
# => true

pry(main)> require './lib/show'
# => true

pry(main)> require './lib/character'
# => true

pry(main)> nbc = Network.new("NBC")    
# => #<Network:0x00007fe5f83ea3b0...>

pry(main)> michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})    
# => #<Character:0x00007fe5f88721f8...>

pry(main)> kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})    
# => #<Character:0x00007fe5f8448f78...>

pry(main)> knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])    
# => #<Show:0x00007fe5f8398970...>

pry(main)> mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})    
# => #<Character:0x00007fe5f8448f78...>

pry(main)> baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])    
# => #<Show:0x00007fe5f8398970...>

pry(main)> leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
# => #<Character:0x00007fe5f832bb18...>

pry(main)> ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})    
# => #<Character:0x00007fe5f8172a60...>

pry(main)> parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])    
# => #<Show:0x00007fe5f88b0a20...>

pry(main)> parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])    
# => #<Show:0x00007fe5f88b0a20...>

pry(main)> nbc.add_show(knight_rider)

pry(main)> nbc.add_show(baywatch)    

pry(main)> nbc.add_show(parks_and_rec)    

pry(main)> nbc.shows_by_actor
# => {
#      "David Hasselhoff" => [knight_rider, baywatch],  
#      "William Daniels" => [knight_rider],
#      "Amy Poehler" => [parks_and_rec],
#      "Nick Offerman" => [parks_and_rec]
#    }

pry(main)> nbc.prolific_actors
# => ["David Hasselhoff"]

```
