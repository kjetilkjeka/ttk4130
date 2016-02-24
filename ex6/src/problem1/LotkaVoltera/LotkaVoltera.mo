within LotkaVoltera;
model LotkaVoltera
  // variables
  Real u;
  Real v;
  Real V;

  // parameters

equation
  der(u) = u*(v-3);
  der(v) = v*(2-u);
  V = u - 2*ln(u) + v - 3*ln(v);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LotkaVoltera;
