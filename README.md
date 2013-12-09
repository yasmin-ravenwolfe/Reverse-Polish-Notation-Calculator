##Reverse-Polish Calculator

In Reverse Polish notation the operators follow their operands; for instance, to add three and four one would write "3 4 +" rather than "3 + 4". If there are multiple operations, the operator is given immediately after its second operand; so the expression written "3 − 4 + 5" in conventional infix notation would be written "3 4 − 5 +" in RPN: first subtract 4 from 3, then add 5 to that.

Example:

The infix expression "5 + ((1 + 2 + 3) * 4) − 3" can be written down like this in RPN:

5 1 2 + 4 * + 3 -


###Features:

This calculator can handle:

1) At least 4 numbers in sequence

2) The four basic arithmetic operations (+, -, *, /).

3) The use of “standard in” and “standard out” to accept and return data. Pressing “q” should quit the application.


#### To run the app:

To execute the program, from the program directory run:

    calculate

The RPN calculation results from the expression the user inputs on the command line ($stdin).

The program accepts positive and negative numbers, integers and floats.

The expression can be entered in the following two ways:

  The whole expression on one line:

      > 1 2 + -1 *

      -3.0
  
  The expression broken up on multiple lines. Values not calculated persist for the next operation:

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

To run an individual test: 

      rspec spec/<filename>.rb

To run all tests: 

      rspec


###Design

This app has four classes: Calculator, CommandLine, OneLiner, Stack. Each is an abstraction of and performs the duties of the object it is named for. 

1. The CommandLine class is responsible for executing the program by creating a new Calculator instance. User input is accepted through "standard in." The run method calls Calculator#classify, passing in user input. The RPN result is returned using "standard out." The program continues to run until user input is 'q', which exits the program. 

2. The Calculator class uses regular expressions to determine if the input expression is an instance of the OneLiner or Stack classes. Expressions in which the whole line of input is in RPN format and can be evaluated at once pass the one_liner? test. This means that there is the correct ratio of operators to operands, and these are in the correct order, so that the RPN calculation can be performed on this expression repeatedly until there is only one operand (and this is output as the result).

If Calculator#one_liner? is true, a new OneLiner instance is created to return the RPN calculation. If the input does not pass the one_liner? test, a new Stack instance is created to calculate the RPN result.

3. The OneLiner class is responsible for parsing one-line expressions and performing the RPN calculation on them. The OneLiner#calculate method continues to parse and perform the appropriate operation until only one operand remains. This is returned to the console.

4. The Stack class is responsible for calculations in which the line of input is not a complete RPN calculation in itself. The expression is parsed so that operators and operands are pushed into the correct arrays. Once there is at least one operator and two operands, the RPN calculation is performed and the result output to the console. If the conditions to do a RPN calculation are not met (and input is valid) the last operand input will be output to the console.

####Assumptions:
1. Only the following operations can be calculated: + - * /
2. Users will perform all calculations in one session; no data is stored between sessions.

