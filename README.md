Programming Exercise: Code a Reverse-Polish Calculator

In Reverse Polish notation the operators follow their operands; for instance, to add three and four one would write "3 4 +" rather than "3 + 4". If there are multiple operations, the operator is given immediately after its second operand; so the expression written "3 − 4 + 5" in conventional infix notation would be written "3 4 − 5 +" in RPN: first subtract 4 from 3, then add 5 to that.

Example:

The infix expression "5 + ((1 + 2 + 3) * 4) − 3" can be written down like this in RPN:

5 1 2 + 4 * + 3 -


Instructions:

Your Calculator should handle:

1) At least 4 numbers in sequence

2) The four basic arithmetic operations (+, -, *, /).

3) Use “standard in” and “standard out” to accept and return data. Pressing “q” should quit the application.


#### To run the app:

To execute the program, from the program directory run:

    calculate

The RPN expression is read from what the user inputs on the command line ($stdin). 

The expression can be entered in the following two ways:

  The whole expression on one line:
> 1 2 + -1 *
  
  The expression broken up on mutiple lines:
> 1
1
> 2
2
> +
3.0
> -1
-1
> *
-3.0

To exit the program, type 'q':  
> q
goodbye

###Testing:
Testing was done using RSpec. Each class has a corresponding test file in the spec folder.

Run bundle install to install the RSpec testing gem.

To run an individual test: rspec spec/"filename".rb

To run all tests:
Testing was done using RSpec. Each class has a corresponding test file in the spec folder.

Run bundle install to install the RSpec testing gem.

To run an individual test: rspec spec/"filename".rb

To run all tests: rspec


###Design

This app has four classes: Calculator, CommandLine, Sanitizer, Stack. Each is an abstraction of and performs the duties of the object it is named for. 

1. The CommandLine class is responsible for executing the program by creating a new Calculator instance. Data is accepted through "standard in." The run method calls the classify method on the Calculator, passing in user input. The RPN result is returned using "standard out." The program continues to run until user input is 'q' which exits the program. 

2. The Calculator class matches the user input to determine if the expression is an instance of the Sanitizer or Stack classes. Expressions in which the whole line of input is in RPN format and can be evaluated pass the sanitizer? test. A new Sanitizer


