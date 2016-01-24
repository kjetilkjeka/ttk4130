within TwoTanks;
model TwoTanks_SI
  import SI = Modelica.SIunits;

  // Constants
  constant Real pi = Modelica.Constants.pi;
  constant Real g = Modelica.Constants.g_n;

  // Parameters
  parameter SI.Area A1 = 1.0 "Area of tank 1";
  parameter SI.Area A2 = 2.0 "Area of tank 2";
  parameter SI.Length L = 0.1 "Pipe length";
  parameter SI.Diameter D = 0.2 "Pipe diameter";
  parameter SI.Density rho = 0.2 "Fluid density";
  parameter SI.DynamicViscosity mu = 2e-3 "Fluid dynamic viscosity";

  // Variables
  SI.Pressure p1 "Pressure in tank 1";
  SI.Pressure p2 "Pressure in tank 2";
  SI.Height h1 "Liquid level in tank 1";
  SI.Height h2 "Liquid level in tank 2";
  SI.VolumeFlowRate q "Volume flow rate between tanks";

equation
  // Relation pressure and height
  p1 = rho * g * h1;
  p2 = rho * g * h2;

  der(h1) = -q/A1;
  der(h2) = q/A2;

  q = (p1 - p2) * (pi*D^4)/(128*mu*L);

  // Flow between tanks (positive out of tank 1)
  // Mass balances for each tank

end TwoTanks_SI;
