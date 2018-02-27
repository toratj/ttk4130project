within WasteWater.ASM1;
model sensor_AE "Ideal sensor to measure dissolved oxygen concentration"

  extends WasteWater.Icons.sensor_AE;
  Modelica.Blocks.Interfaces.RealInput Kla3
    annotation (Placement(transformation(extent={{-104,8},{-64,48}})));
  Modelica.Blocks.Interfaces.RealInput Kla5
    annotation (Placement(transformation(extent={{-106,-90},{-66,-50}})));
  Modelica.Blocks.Interfaces.RealInput Kla4
    annotation (Placement(transformation(extent={{-104,-38},{-64,2}})));

    Real T(start=1e-3);
    Real AE(start = 0);
  Modelica.Blocks.Interfaces.RealOutput AE_out
    annotation (Placement(transformation(extent={{86,-16},{116,14}})));
equation
  der(T) = 1.0;
  der(AE*T) = 2/1.8/1000*1333*(Kla3+Kla4+Kla5);
  AE_out = AE;

  annotation (
    Window(
      x=0.13,
      y=0.14,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the dissolved oxygen concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={223,223,159},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,50},{0,38}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-50,0},{38,0}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{50,0},{38,0}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-36,34},{-28,26}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{34,36},{26,28}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{0,0},{26,28}},
          color={0,0,0},
          thickness=0.5),
        Polygon(
          points={{30,32},{10,24},{24,12},{30,32}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(extent={{-36,-10},{36,-32}}, textString=
                                              "O2"),
        Line(
          points={{0,-50},{0,-90}},
          color={0,0,0},
          thickness=0.5),
        Line(points={{50,0},{88,0}}, color={0,0,0}),
        Text(extent={{-80,100},{80,60}}, textString=
                                             "%name")}));
end sensor_AE;
