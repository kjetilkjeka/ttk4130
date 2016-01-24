within TwoTanks;
connector FlowPort
  import SI = Modelica.SIunits;

  flow SI.VolumeFlowRate q
    "Volume flow rate from the connection point into the component";

  SI.Pressure p "Thermodynamic pressure in the connection point";
end FlowPort;
