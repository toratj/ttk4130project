within WasteWater.ASM1;
model sensor_PE "Ideal sensor to measure ammonium nitrogen"

  extends WasteWater.Icons.sensor_PE;

  Real T(start = 1e-3);
  Real PE(start = 0);
  WasteWater.ASM1.Interfaces.WWFlowAsm1in Qa_in annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-49,-87})));
  WasteWater.ASM1.Interfaces.WWFlowAsm1in Qr_in annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-21,-89})));
  WasteWater.ASM1.Interfaces.WWFlowAsm1in Qw_in annotation (Placement(
        transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={25,-89})));
  Modelica.Blocks.Interfaces.RealOutput PE_out
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));

  WasteWater.ASM1.Interfaces.WWFlowAsm1out Qr_out annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-2,100})));
  WasteWater.ASM1.Interfaces.WWFlowAsm1out Qa_out annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,100})));
  WasteWater.ASM1.Interfaces.WWFlowAsm1out Qw_out annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={58,100})));
equation
  der(T) = 1.0;
  der(T*PE) = 0.004*abs(Qa_in.Q) + 0.0008*(Qr_in.Q) + 0.05*abs(Qw_in.Q);
  PE_out = PE;

  Qa_in = Qa_out;
  Qr_in = Qr_out;
  Qw_in = Qw_out;
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
end sensor_PE;
