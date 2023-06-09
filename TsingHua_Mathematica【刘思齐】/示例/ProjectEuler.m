(* ::Package:: *)

(* Mathematica Package         *)

(* :Title: ProjectEuler     *)
(* :Context: ProjectEuler`  *)
(* :Author: Si-Qi Liu       *)
(* :Date: 2021/8/31         *)

(* :Package Version: 1.0       *)
(* :Mathematica Version:       *)
(* :Copyright:                 *)
(* :Keywords:                  *)
(* :Discussion:                *)

BeginPackage["ProjectEuler`"]
(* Exported symbols added here with SymbolName::usage *)

PE001::usage = "If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The "<>
        "sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000."

PE002::usage = "Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting "<>
        "with 1 and 2, the first 10 terms will be: \n        1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ... \n"<>
        "By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum "<>
        "of the even-valued terms."

PE003::usage = "The prime factors of 13195 are 5, 7, 13 and 29. What is the largest prime factor of the number "<>
        "600851475143?"

PE004::usage = "A palindromic number reads the same both ways. The largest palindrome made from the product of two "<>
        "2-digit numbers is 9009 = 91*99. Find the largest palindrome made from the product of two 3-digit numbers."

PE005::usage = "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any "<>
        "remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?"

PE006::usage = "The sum of the squares of the first ten natural numbers is,\n        12 + 22 + ... + 102 = 385\n"<>
        "The square of the sum of the first ten natural numbers is,\n        (1 + 2 + ... + 10)2 = 552 = 3025\n"<>
        "Hence the difference between the sum of the squares of the first ten natural numbers and the square of the "<>
        "sum is 3025 - 385 = 2640. Find the difference between the sum of the squares of the first one hundred natural "<>
        "numbers and the square of the sum."

PE007::usage = "By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is" <>
        " 13. What is the 10001st prime number?"

PE009::usage = "A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,\n"<>
        "        a^2 + b^2 = c^2\n"<>
        "For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2. There exists exactly one Pythagorean triplet for which a + b + c = 1000. \n"<>
        "Find the product abc."

PE010::usage = "The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17. Find the sum of all the primes below two million."

PE012::usage = "The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle"<>
        " number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:\n"<>
        "        1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...\n"<>
        "Let us list the factors of the first seven triangle numbers:\n"<>
        "       1: 1\n"<>
        "       3: 1,3\n"<>
        "       6: 1,2,3,6\n"<>
        "       10: 1,2,5,10\n"<>
        "       15: 1,3,5,15\n"<>
        "       21: 1,3,7,21\n"<>
        "       28: 1,2,4,7,14,28\n"<>
        "We can see that 28 is the first triangle number to have over five divisors. "<>
        "What is the value of the first triangle number to have over five hundred divisors?"

PE014::usage = "The following iterative sequence is defined for the set of positive integers:\n"<>
        "       n -> n/2 (n is even)\n"<>
        "       n -> 3n + 1 (n is odd)\n"<>
        "Using the rule above and starting with 13, we generate the following sequence:\n"<>
        "       13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1\n"<>
        "It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has "<>
        "not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.\n\n"<>
        "Which starting number, under one million, produces the longest chain? "<>
        "NOTE: Once the chain starts the terms are allowed to go above one million."

PE015::usage = "Starting in the top left corner of a 2*2 grid, and only being able to move to the right and down, "<>
        "there are exactly 6 routes to the bottom right corner. How many such routes are there through a 20*20 grid?"

PE016::usage = "2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26. What is the sum of the digits of "<>
        "the number 2^1000?"

Begin["`Private`"] (* Begin Private Context *)

PE001[] := Plus @@ Select[Range[999], Mod[#, 3] == 0 || Mod[#, 5] == 0 &]

PE002[] := Plus @@ Select[Fibonacci /@ Range[35], # < 4000000 && EvenQ[#] &]

PE003[] := Max @ Transpose[FactorInteger[600851475143]][[1]]

PE004[] := Max @ Select[Flatten[# Range[#, 999] & /@ Range[100, 999]], (#1 == Reverse[#1] &) @ IntegerDigits[#] &]

PE005[] := LCM @@ Range[20]

PE006[] := (Plus @@ #)^2 - Plus @@ (#^2 & /@ #) &[Range[100]]

PE007[] := Prime[10001]

PE009[] := Module[{a, b, c}, a b c /. FindInstance[{a^2 + b^2 == c^2, a + b + c == 1000, a > 0, b > 0, c > 0}, {a, b, c}, Integers][[1]]]

PE010[] := Plus @@ Prime /@ Range[PrimePi[2000000]]

PE012[] := Module[{r}, Block[{$IterationLimit = Infinity}, r[i_] := r[i + 1]; r[i_] := Binomial[i + 1, 2] /; (Length[Divisors[Binomial[i + 1, 2]]] > 500); r[1]]]

PE014[] := Module[{l}, l[1] := 1; l[x_?EvenQ] := l[x] = l[x/2] + 1; l[x_?OddQ] := l[x] = l[3 x + 1] + 1; Position[#, Max[#]] & [Array[l, 1000000]][[1, 1]]]

PE015[] := Module[{n}, n[1, y_] := 1; n[x_, 1] := 1; n[x_, y_] := n[x, y] = n[x - 1, y] + n[x, y - 1]; n[21, 21]]

PE016[] := Plus @@ IntegerDigits[2^1000]

\:5f20\:4e09=1;

End[] (* End Private Context *)

EndPackage[]
