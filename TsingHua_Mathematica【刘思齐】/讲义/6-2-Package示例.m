(* ::Package:: *)

BeginPackage["StateMachine`"]

StateMachine::usage="Generate a simple state machine."

Begin["`Private`"]

StateMachine = Module[{i}, Function[func, i = 0;
    Switch[func, 0, i &, 1, ++i &, 2, --i &, 3, (i = 0) &, _, 
     Print["Illegal function!"]]]];

End[]

EndPackage[]
