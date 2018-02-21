within WasteWater.ASM1;
model WWSourceConstant "Wastewater source"

  extends WasteWater.Icons.WWSource;
  Interfaces.WWFlowAsm1out Out annotation (Placement(transformation(extent={{88,
            -80},{108,-60}}, rotation=0)));
equation

  Out.Q =-18446;
  Out.Si =30;
  Out.Ss =69.5;
  Out.Xi =51.20;
  Out.Xs =202.32;
  Out.Xbh =28.17;
  Out.Xba =0;
  Out.Xp =0;
  Out.So =0;
  Out.Sno =0;
  Out.Snh =31.56;
  Out.Snd =6.95;
  Out.Xnd =10.59;
  Out.Salk =7;

  annotation (
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="This component provides all ASM1 data at the influent of a wastewater treatment plant.
The dimension of InPort is 14.

  1 volumeflowrate Q of incoming wastewater [m3/d]
  2 Si  [g COD/m3]
  3 Ss  [g COD/m3]
  4 Xi  [g COD/m3]
  5 Xs  [g COD/m3]
  6 Xbh [g COD/m3]
  7 Xba [g COD/m3]
  8 Xp  [g COD/m3]
  9 So  [g O2/m3]
 10 Sno [g N/m3]
 11 Snh [g N/m3]
 12 Snd [g N/m3]
 13 Xnd [g N/m3]
 14 Salk[mmol/l]
"));
end WWSourceConstant;
