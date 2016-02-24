within LotkaVoltera;
model LotkaVolteraLin
  // variables
  Real u;
  Real v;
  //Real V;

  // parameters

equation
  der(u) = 2*v;
  der(v) = -3*u;
  //V = u - 2*ln(u) + v - 3*ln(v);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LotkaVolteraLin;
