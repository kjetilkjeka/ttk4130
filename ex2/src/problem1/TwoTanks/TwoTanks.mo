within TwoTanks;
model TwoTanks
  Tank Tank1(A=1.0);
  Tank Tank2(A=2.0);
  Pipe Pipe(L=0.1,D=0.2);

equation
  connect(Tank1.flowPort,Pipe.flowPort_a);
  connect(Tank2.flowPort,Pipe.flowPort_b);

end TwoTanks;
