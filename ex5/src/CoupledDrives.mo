within ;
package CoupledDrives

  model Drive

      Modelica.Blocks.Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-96,-20},{-56,20}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
        annotation (Placement(transformation(extent={{62,-10},{82,10}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.001)
        annotation (Placement(transformation(extent={{-22,-10},{-2,10}})));
      Modelica.Mechanics.Rotational.Components.Damper damper(d=0.1)
        annotation (Placement(transformation(extent={{4,-10},{24,10}})));
      Modelica.Mechanics.Rotational.Sources.Torque torque
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
      Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(ratio=10)
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

  model Pulley
    extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;

    import SI = Modelica.SIunits;

    // variables
    SI.Velocity v1 "Velocity section belt 1";
    SI.Velocity v2 "Velocity section belt 2";
    SI.Velocity vk "Vertical velocity pulley";
    SI.Position xk "Spring deflection/vertical position pulley";
    SI.Force Fk "Spring force";
    SI.Force F1 "Pulley Force, F1 = F2";
    SI.Force F2 "Pulley Force, F1 = F2";
    SI.Force F "Pulley Force, F1 = F2";

    // parameters
    parameter Real k "Spring constant";
    parameter Real theta "Angle";

    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{64,52},{84,72}})));
  equation
    F1 = flange_a.f;
    F2 = flange_b.f;
    F = F1;
    F = F2;
    v1 = der(-flange_a.s);
    v2 = der(flange_b.s);

    y = xk;

    vk = (v1 - v2) / (2 * Modelica.Math.cos(theta));
    vk = der(xk);
    F = Fk / (2 * Modelica.Math.cos(theta));
    Fk = k*xk;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Pulley;

  model CoupledDrive
    Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c=50,
        d=0.5)
      annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
    Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c=50,
        d=0.5) annotation (Placement(transformation(extent={{28,-10},{48,10}})));
    Drive drive
      annotation (Placement(transformation(extent={{80,-10},{60,10}})));
    Drive drive1
      annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
    Pulley pulley(k=200, theta=3.141592/4)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Interfaces.RealInput T1
      annotation (Placement(transformation(extent={{-98,30},{-58,70}})));
    Modelica.Blocks.Interfaces.RealInput T2
      annotation (Placement(transformation(extent={{-94,-76},{-54,-36}})));
    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{52,54},{72,74}})));
    Modelica.Blocks.Math.Gain gain(k=-1)
      annotation (Placement(transformation(extent={{-36,40},{-16,60}})));
  equation
    connect(springDamper1.flange_a, pulley.flange_b)
      annotation (Line(points={{28,0},{19,0},{10,0}}, color={0,127,0}));
    connect(pulley.flange_a, springDamper.flange_b)
      annotation (Line(points={{-10,0},{-19,0},{-28,0}}, color={0,127,0}));
    connect(drive1.flange_b, springDamper.flange_a)
      annotation (Line(points={{-58.8,0},{-53.4,0},{-48,0}}, color={0,127,0}));
    connect(drive.flange_b, springDamper1.flange_b)
      annotation (Line(points={{62.8,0},{62.8,0},{48,0}}, color={0,127,0}));
    connect(drive.u, T2) annotation (Line(points={{77.6,0},{94,0},{94,-56},{-74,
            -56}}, color={0,0,127}));
    connect(pulley.y, y) annotation (Line(points={{7.4,6.2},{7.4,6},{22,6},{22,
            64},{62,64}}, color={0,0,127}));
    connect(gain.u, T1)
      annotation (Line(points={{-38,50},{-58,50},{-78,50}}, color={0,0,127}));
    connect(gain.y, drive1.u) annotation (Line(points={{-15,50},{-10,50},{-10,
            24},{-82,24},{-82,0},{-73.6,0}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end CoupledDrive;
  annotation (uses(Modelica(version="3.2.1")));
end CoupledDrives;
