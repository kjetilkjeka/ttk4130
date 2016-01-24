within TwoTanks;
model Pipe
  import SI = Modelica.SIunits;
  // Constants
  constant Real pi = Modelica.Constants.pi;

  // Parameters
  parameter SI.Length L;
  parameter SI.Diameter D;
  parameter SI.DynamicViscosity mu = 2e-3 "Fluid dynamic viscosity";

  // Ports
  FlowPort flowPort_a;
  FlowPort flowPort_b;

  // Variables
  SI.Pressure p1;
  SI.Pressure p2;

equation
  p1 = flowPort_a.p;
  p2 = flowPort_b.p;
  flowPort_a.q = -flowPort_b.q;

  flowPort_b.q = (p1-p2)*(pi * D*D*D*D)/(128*mu*L);

end Pipe;
