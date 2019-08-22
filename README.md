## The First Odin on Rails Ruby [Project](https://www.theodinproject.com/courses/ruby-programming/lessons/oop)
This project is meant to demonstrate basic knowledge of Ruby.

### Reflections
Note that at this point in the course, largely vanilla Ruby was practiced and encouraged, thus my usage of non rspec for tests.

This was my first time attempting to build any kind of program with Ruby, and I must say that it took me a while to get to a point where I felt like I was at least somewhat idiomatically using the language; I am sure there is still great room for improvement.
More generally speaking, I found forcing myself to write in OOP fashion (in essence, when required to use a class) uncomfortable at first. I feel much better now at the end of it.

If I were to refactor or attempt to create "production" code from this project, I would first remove the hardcoded 'main.rb' game flow control and instead create a class that interacts with `Game`, perhaps an interface called `Player`, which could be sub-classed into `HumanPlayer` and `ComputerPlayer`, if AI was desired.
Also, the code to draw the board and the prompts in general could be much more aesthetic and UX-friendly, but I chose quick and simple lines because the focus of the project was not on terminal presentation.