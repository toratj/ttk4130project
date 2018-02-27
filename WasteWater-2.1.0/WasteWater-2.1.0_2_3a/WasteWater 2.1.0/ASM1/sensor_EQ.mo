within WasteWater.ASM1;
model sensor_EQ "Ideal sensor to measure ammonium nitrogen"

  extends WasteWater.Icons.sensor_EQ;
  Interfaces.WWFlowAsm1in e annotation (Placement(transformation(extent={{-90,-10},
            {-70,10}},       rotation=0)));

  Real T(start = 1e-3);
  Real EQ(start = 0);
  Real SS_e;
  Real Snkj_e;
  Real BOD_e;
  Real COD_e;

  parameter Real Ixb = 0.08;
  parameter Real Ixp = 0.06;
  parameter Real fp = 0.08;
  parameter Real Bss = 2;
  parameter Real Bcod = 1;
  parameter Real Bnkj = 30;
  parameter Real Bno = 10;
  parameter Real Bbod5 = 2;

  Modelica.Blocks.Interfaces.RealOutput EQ_out
    annotation (Placement(transformation(extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,104})));
  Interfaces.WWFlowAsm1out e_out
    annotation (Placement(transformation(extent={{76,-10},{96,10}})));
equation
  Snkj_e = e.Snh + e.Snd + e.Xnd + Ixb*( e.Xbh + e.Xba) + Ixp*(e.Xp + e.Xi);
  SS_e = 0.75 * (e.Xs + e.Xi + e.Xbh + e.Xba + e.Xp);
  BOD_e = 0.25*(e.Ss + e.Xs + (1 - fp)*(e.Xbh + e.Xba));
  COD_e = e.Ss + e.Si + e.Xs + e.Xi + e.Xbh + e.Xba + e.Xp;

  der(T) = 1.0;
  der(T*EQ) = (Bss*SS_e + Bcod*COD_e + Bnkj*Snkj_e + Bno*e.Sno + Bbod5*BOD_e)*abs(e.Q)/1000;

  EQ_out = EQ;

  e.Q + e_out.Q = 0;
  e.Si = e_out.Si;
  e.Ss = e_out.Ss;
  e.Xi = e_out.Xi;
  e.Xs = e_out.Xs;
  e.Xbh = e_out.Xbh;
  e.Xba = e_out.Xba;
  e.Xp = e_out.Xp;
  e.So = e_out.So;
  e.Sno = e_out.Sno;
  e.Snh = e_out.Snh;
  e.Snd = e_out.Snd;
  e.Xnd = e_out.Xnd;
  e.Salk = e_out.Salk;

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
end sensor_EQ;
