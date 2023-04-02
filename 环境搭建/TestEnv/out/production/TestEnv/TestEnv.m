BeginPackage["TestEnv`"];
(* Exported symbols added here with SymbolName::usage *)

Begin["`Private`"];
  plotfun[fun_, xlimits_, ylimits_] := ContourPlot[fun,
    xlimits, ylimits,
    ContourStyle->{
      RGBColor["#00C0A3"],
      Thickness[0.004]
    },
    AspectRatio->((xlimits[[2]]//Abs) + (xlimits[[3]]//Abs))/((ylimits[[2]]//Abs) + (ylimits[[3]]//Abs)),
    AxesOrigin->{0,0},
    Axes->True,
    Frame->False,
    AxesStyle->Arrowheads[{0, 0.03}],
    (* 0 -> 在正半轴； 1-> 同时在正负半轴*)
    (* 0.03 -> 箭头的大小 *)
    AxesLabel->{"x", "y"}
  ];
End[]; (* `Private` *)
EndPackage[]