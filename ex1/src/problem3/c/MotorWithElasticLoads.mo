within ;
model MotorWithElasticLoads
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-62,2},{-42,22}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{-36,2},{-16,22}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c=0.5, d=
        0.01)
    annotation (Placement(transformation(extent={{-10,2},{10,22}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=1)
    annotation (Placement(transformation(extent={{16,2},{36,22}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c=0.5, d=
        0.01)
    annotation (Placement(transformation(extent={{44,2},{64,22}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J=1)
    annotation (Placement(transformation(extent={{70,2},{90,22}})));
  Modelica.Blocks.Sources.Step step
    annotation (Placement(transformation(extent={{-92,2},{-72,22}})));
equation
  connect(torque.tau, step.y)
    annotation (Line(points={{-64,12},{-71,12},{-71,12}}, color={0,0,127}));
  connect(inertia.flange_a, torque.flange)
    annotation (Line(points={{-36,12},{-39,12},{-42,12}}, color={0,0,0}));
  connect(springDamper.flange_a, inertia.flange_b)
    annotation (Line(points={{-10,12},{-13,12},{-16,12}}, color={0,0,0}));
  connect(inertia1.flange_a, springDamper.flange_b)
    annotation (Line(points={{16,12},{10,12}},         color={0,0,0}));
  connect(springDamper1.flange_a, inertia1.flange_b)
    annotation (Line(points={{44,12},{40,12},{36,12}}, color={0,0,0}));
  connect(inertia2.flange_a, springDamper1.flange_b)
    annotation (Line(points={{70,12},{64,12}},         color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    uses(Modelica(version="3.2.1")));
end MotorWithElasticLoads;
