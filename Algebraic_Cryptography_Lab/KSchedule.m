function KSchedule(K,n)

//INPUT:	- A list, K, of 8 bits
// 		      - A natural number, n, which is the number of rounds
//	
//OUTPUT:	- A list of n+1 lists: KS=[K1,...,K_{n+1}], where K_i is a list of 8 bits.

//Identifiers
V4:=VectorSpace(GF(2),4);
V:={v: v in V4};
Sy4:=SymmetricGroup(V);
S1 := Sy4 ! (V4 ! [1, 1, 0, 1], V4 ! [0, 1, 0, 1], V4 ! [1, 0, 1, 1], V4 ! [1, 0, 0, 1], V4 ! [0, 1, 1, 1], V4 ! [0, 0, 1, 0], V4 ! [0, 0, 0, 1])(V4 ! [1, 0, 1, 0], V4 ! [1, 1, 1, 1], V4 ! [1, 1, 1, 0], V4 ! [0, 1, 1, 0], V4 ! [0, 0, 1, 1])(V4 ! [0, 1, 0, 0], V4 ! [1, 0, 0, 0]);
S2 := Sy4 ! (V4 ! [1, 1, 0, 0], V4 ! [1, 1, 1, 0], V4 ! [0, 0, 0, 0], V4 ! [1, 1, 0, 1], V4 ! [1, 1, 1, 1], V4 ! [1, 0, 0, 1], V4 ! [0, 1, 0, 0], V4 ! [0, 0, 0, 1], V4 ! [0, 0, 1, 0], V4 ! [0, 1, 1, 0], V4 ! [1, 0, 1, 1], V4 ! [0, 1, 1, 1], V4 ! [0, 0, 1, 1], V4 ! [0, 1, 0, 1])(V4 ! [1, 0, 1, 0], V4 ! [1, 0, 0, 0]);

KS:=[K];

//Process

for i in [2..n+1] do
	ImS2:=V4! [K[5],K[6],K[7],K[8]] ^S2;
	ImS1:=V4! [K[1],K[2],K[3],K[4]] ^S1;

	for i in [1..4] do
		K[i]:=ImS2[i];
	end for;

	for i in [1..4] do
		K[i+4]:=ImS1[i];
	end for;

	KS[i]:=K;
end for;

return KS;
end function;
