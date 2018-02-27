within WasteWater.ASM1;
model sensor_ME "Ideal sensor to measure dissolved oxygen concentration"
    extends WasteWater.Icons.sensor_ME;

  Modelica.Blocks.Interfaces.RealInput Kla3 annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-41,-97})));
  Modelica.Blocks.Interfaces.RealInput Kla4 annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-1,-97})));
  Modelica.Blocks.Interfaces.RealInput Kla5 annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={41,-97})));

Real ME(start=0);
Real T(start=1e-3);

Real T1;
Real T2;
Real T3;
Real T4;
Real T5;

parameter Real V1 = 1000;
parameter Real V2 = 1333;

  Modelica.Blocks.Interfaces.RealOutput ME_out
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
equation
  der(T) = 1.0;
  T1 = V1;
  T2 = V1;
  T3 = if
         (Kla3 < 20) then V2 else 0;
  T4 = if
         (Kla4 < 20) then V2 else 0;
  T5 = if
         (Kla5 < 20) then V2 else 0;
  der(Me*T) = 24 * 0.005 * (T1 + T2 + T3 + T4 + T5);

  ME_out = ME;

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
end sensor_ME;
