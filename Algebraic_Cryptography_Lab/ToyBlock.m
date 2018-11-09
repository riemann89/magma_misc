function ToyBlock(K,M,n)

//Idetifiers
V4:=VectorSpace(GF(2),4);
V:={v: v in V4};
Sy4:=SymmetricGroup(V);
S1 := Sy4 ! (V4 ! [1, 1, 0, 1], V4 ! [0, 1, 0, 1], V4 ! [1, 0, 1, 1], V4 ! [1, 0, 0, 1], V4 ! [0, 1, 1, 1], V4 ! [0, 0, 1, 0], V4 ! [0, 0, 0, 1])(V4 ! [1, 0, 1, 0], V4 ! [1, 1, 1, 1], V4 ! [1, 1, 1, 0], V4 ! [0, 1, 1, 0], V4 ! [0, 0, 1, 1])(V4 ! [0, 1, 0, 0], V4 ! [1, 0, 0, 0]);

//Generating key-schedule
K:=KSchedule(K,n);

//adding k0
for i in [1..8] do
	M[i]:=M[i]+K[1][i];
end for;
//OK
for j in [2..n+1] do
	
	//halving and casting in V4
	Mv1:=(V4![M[1],M[2],M[3],M[4]]);
	Mv2:=(V4![M[5],M[6],M[7],M[8]]);

	//applying permutation S1;
	Mv1:=(Mv1)^S1;
	Mv2:=(Mv2)^S1;

	//Re-assembling for Mlayer
	for i in [1..4] do
		M[i]:=Mv1[i];     
		M[i+4]:=Mv2[i];
	end for;

	//Applying Mlay
	M:=Mlay(M);

	//adding K_{i+1}
	for i in [1..8] do
		M[i]:=M[i]+K[j][i];
	end for;
end for;
return M;
end function;















