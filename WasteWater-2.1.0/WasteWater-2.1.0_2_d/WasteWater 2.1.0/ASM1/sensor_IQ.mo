within WasteWater.ASM1;
model sensor_IQ "Ideal sensor to measure ammonium nitrogen"

  extends WasteWater.Icons.sensor_IQ;
  WasteWater.ASM1.Interfaces.WWFlowAsm1in i annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}, rotation=0)));

  Real T(start = 1e-3);
  Real IQ(start = 0);
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

  WasteWater.ASM1.Interfaces.WWFlowAsm1out i_out
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));

equation
  SS_e = 0.75 * (i.Xs + i.Xi + i.Xbh + i.Xba + i.Xp);
  Snkj_e = i.Snd + i.Snh + i.Xnd + Ixb*( i.Xbh + i.Xba)  + Ixp*( i.Xp + i.Xi);  // Xxa might be Xba, typo?
  BOD_e = 0.65*(i.Ss + i.Xs + (1 - fp)*(i.Xbh + i.Xba));
  COD_e = i.Ss + i.Si + i.Xs + i.Xi + i.Xbh + i.Xba + i.Xp;

  der(T) = 1.0;
  der(T*IQ) = (Bss*SS_e + Bcod*COD_e + Bnkj*Snkj_e + Bno*i.Sno + Bbod5*BOD_e)*abs(i.Q)/1000;

  i.Q + i_out.Q = 0;
  i.Si = i_out.Si;
  i.Ss = i_out.Ss;
  i.Xi = i_out.Xi;
  i.Xs = i_out.Xs;
  i.Xbh = i_out.Xbh;
  i.Xba = i_out.Xba;
  i.Xp = i_out.Xp;
  i.So = i_out.So;
  i.Sno = i_out.Sno;
  i.Snh = i_out.Snh;
  i.Snd = i_out.Snd;
  i.Xnd = i_out.Xnd;
  i.Salk = i_out.Salk;

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
end sensor_IQ;
