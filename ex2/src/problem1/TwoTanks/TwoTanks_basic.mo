within TwoTanks;
model TwoTanks_basic
  // Constants
  constant Real pi = 3.14;
  constant Real g = 9.81;

  // Parameters
  parameter Real A1 = 1.0 "Area of tank 1";
  parameter Real A2 = 2.0 "Area of tank 2";
  parameter Real L = 0.1 "Pipe length";
  parameter Real D = 0.2 "Pipe diameter";
  parameter Real rho = 0.2 "Fluid density";
  parameter Real mu = 2e-3 "Fluid dynamic viscosity";

  // Variables
  Real p1 "Pressure in tank 1";
  Real p2 "Pressure in tank 2";
  Real h1 "Liquid level in tank 1";
  Real h2 "Liquid level in tank 2";
  Real q "Volume flow rate between tanks";

equation
  // Relation pressure and height
  p1 = rho * g * h1;
  p2 = rho * g * h2;

  der(h1) = -q/A1;
  der(h2) = q/A2;

  q = (p1 - p2) * (pi*D^4)/(128*mu*L);

  // Flow between tanks (positive out of tank 1)
  // Mass balances for each tank

end TwoTanks_basic;
