within WasteWater.ASM1;
model sensor_PE "Ideal sensor to measure ammonium nitrogen"

  extends WasteWater.Icons.sensor_PE;
  Interfaces.WWFlowAsm1in e annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));

  Real T(start = 1e-3);
  Real PE(start = 0);
  Modelica.Blocks.Interfaces.RealInput Qa annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-41,-97})));
  Modelica.Blocks.Interfaces.RealInput Qr annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-1,-97})));
  Modelica.Blocks.Interfaces.RealInput Qw annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={41,-97})));
  Modelica.Blocks.Interfaces.RealOutput PE_out
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));

equation
  der(T) = 1.0;
  der(T*PE) = 0.004*abs(Qa) + 0.0008*(Qr) + 0.05*abs(Qw);
  PE_out = PE;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component measures the ammonium nitrogen concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_PE;
