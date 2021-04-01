# calculator

a simple lisp program for infix calculation in the command line 

## dependencies

1. Any common lisp interpreter

## how to install and run

1. clone repo into your machine
2. open the directory and run calc.LISP using your lisp interpreter

## how to use

1. The expression must be provided as a list 
2. All elements of the list (operands and operators) must be space seperated
        eg: (1 + 2 * 3 / 4 + (10 + 2 -1))
3. The output of the program is the resultant parenthesized expression and the output of that expression 
    NOTE : the program uses early evaluation at certain points so you may not 
           get the parenthesized expression you might expect. Regardless, the answer will be correct, dont worry

