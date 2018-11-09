function ToyA51(S,l)
//INPUT:  (S,l) - S := [R1,R2,R3] a sequence of sequences containing the \\initial states of the three registers               //- l the length of the output list.//OUTPUT: (T,Ks)          //- T := [R1,R2,R3] a sequence of sequences containing the final        	  //states of the three registers          //- a list Ks on GF(2) which contains the keystream.
//Identifiers
B<x,y,z>:=PolynomialRing(GF(2),3);
A<a>:=PolynomialRing(GF(2));

mjf:=x*y+x*z+y*z;

p1 := a^5+a^2+1;p2 := a^7+a+1;p3 := a^5+a^3+1;

R1:=S[1];
R2:=S[2];
R3:=S[3];
k:=[];

Ks:=[];
T:=[];
//Steps

T:=S;



for i in [1..l] do
	
	Rx:=R1[5];
        Ry:=R2[7];
        Rz:=R3[5];

	k[i]:=Evaluate(mjf,[R1[5],R2[3],R3[4] ]);
	//R1
	if k[i]+R1[5] eq 0 then
		//LFSR
		Rx:=R1[5];
		R1:=RightLFSRotp(p1,R1);
	end if;

	//R2
	if k[i]+R2[3] eq 0 then
		//LFSR
		Ry:=R2[7];
		R2:=RightLFSRotp(p2,R2);
	end if;
	
	//R3
	if k[i]+R3[4] eq 0 then
		//LFSR
		Rz:=R3[5];
		R3:=RightLFSRotp(p3,R3);
	end if;
	//keys
	Ks[i]:=Rx+Ry+Rz;
end for;
T:=[R1,R2,R3];

return Ks,T;
end function;