within WasteWater.ASM1;
model sensor_SP "Ideal sensor to measure ammonium nitrogen"

  extends WasteWater.Icons.sensor_SP;
  Interfaces.WWFlowAsm1in e annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));

  Real T(start = 1e-3);
  Real PE(start = 0);

  Interfaces.WWFlowAsm1in r
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Interfaces.WWFlowAsm1in w
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Interfaces.WWFlowAsm1out w_out
    annotation (Placement(transformation(extent={{80,40},{100,60}})));
  Interfaces.WWFlowAsm1out r_out
    annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  Modelica.Blocks.Interfaces.RealOutput SP_out
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
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
  der(T*SP) = 0.75/1000*(w.Xs + w.Xbh + w.Xba + w.Xi + r.Xi)*abs(w.Q);

  w.Q + w_out.Q = 0;
  w.Si = w_out.Si;
  w.Ss = w_out.Ss;
  w.Xi = w_out.Xi;
  w.Xs = w_out.Xs;
  w.Xbh = w_out.Xbh;
  w.Xba = w_out.Xba;
  w.Xp = w_out.Xp;
  w.So = w_out.So;
  w.Sno = w_out.Sno;
  w.Snh = w_out.Snh;
  w.Snd = w_out.Snd;
  w.Xnd = w_out.Xnd;
  w.Salk = w_out.Salk;

  r.Q + r_out.Q = 0;
  r.Si = r_out.Si;
  r.Ss = r_out.Ss;
  r.Xi = r_out.Xi;
  r.Xs = r_out.Xs;
  r.Xbh = r_out.Xbh;
  r.Xba = r_out.Xba;
  r.Xp = r_out.Xp;
  r.So = r_out.So;
  r.Sno = r_out.Sno;
  r.Snh = r_out.Snh;
  r.Snd = r_out.Snd;
  r.Xnd = r_out.Xnd;
  r.Salk = r_out.Salk;

  SP_out = SP;

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
end sensor_SP;
