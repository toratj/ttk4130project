within WasteWater.ASM1;
model sensor_OCI "Ideal sensor to measure ammonium nitrogen"

  extends WasteWater.Icons.sensor_OCI;
  Real OCI(start=0);
  Modelica.Blocks.Interfaces.RealInput PE
    annotation (Placement(transformation(extent={{-120,18},{-80,58}})));
  Modelica.Blocks.Interfaces.RealInput SP
    annotation (Placement(transformation(extent={{-120,-18},{-80,22}})));
  Modelica.Blocks.Interfaces.RealInput ME
    annotation (Placement(transformation(extent={{-120,-82},{-80,-42}})));
  Modelica.Blocks.Interfaces.RealInput AE
    annotation (Placement(transformation(extent={{-120,50},{-80,90}})));
  Modelica.Blocks.Interfaces.RealOutput OCI_out
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));
equation

  OCI = AE + PE + 5 * SP + ME;
  OCI_out = OCI;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the ammonium nitrogen concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics));
end sensor_OCI;
