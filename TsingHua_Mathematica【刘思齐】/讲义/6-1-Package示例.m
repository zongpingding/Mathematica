(* ::Package:: *)

BeginPackage["CounterCreator`"]

CounterCreator::usage="CounterCreator[first, delta] creates a counter
starting from first with step delta. Both first and delta has default
value 1."

Begin["`Private`"]

CounterCreator[first_:1,delta_:1]:=Module[{i=first-delta},(i+=delta)&]

End[]

EndPackage[]



