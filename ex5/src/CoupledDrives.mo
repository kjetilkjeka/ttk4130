within ;
package CoupledDrives

  model Drive

      Modelica.Blocks.Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-96,-20},{-56,20}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
        annotation (Placement(transformation(extent={{62,-10},{82,10}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia
        annotation (Placement(transformation(extent={{-22,-10},{-2,10}})));
      Modelica.Mechanics.Rotational.Components.Damper damper
        annotation (Placement(transformation(extent={{4,-10},{24,10}})));
      Modelica.Mechanics.Rotational.Sources.Torque torque
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
      Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T
        annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  equation
      connect(flange_b, idealGearR2T.flangeT)
        annotation (Line(points={{72,0},{72,0},{50,0}}, color={0,127,0}));
      connect(u, torque.tau)
        annotation (Line(points={{-76,0},{-62,0},{-48,0}}, color={0,0,127}));
      connect(torque.flange, inertia.flange_a)
        annotation (Line(points={{-26,0},{-24,0},{-22,0}}, color={0,0,0}));
      connect(inertia.flange_b, damper.flange_a)
        annotation (Line(points={{-2,0},{1,0},{4,0}}, color={0,0,0}));
      connect(damper.flange_b, idealGearR2T.flangeR)
        annotation (Line(points={{24,0},{27,0},{30,0}}, color={0,0,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
              extent={{-58,16},{18,-14}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{-4,36},{64,-36}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Ellipse(
              extent={{22,10},{40,-8}},
              pattern=LinePattern.None,
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0})}),                                  Diagram(
            coordinateSystem(preserveAspectRatio=false)));
  end Drive;
  annotation (uses(Modelica(version="3.2.1")));
end CoupledDrives;
