function RightLFSR(P,L,t)
//
//
//Input
//P is the connection polynomial for LFSR
//L is a list for the initial state (note that Degree(P) eq #L)
//t the length of the keystream that we get from the initial state
//
//Output
//
//Ks is a List of length t which contains the keystream
//S is a list of length t+1 which contains the states of LFSR (so S is a list of a lists)
//
//Process
//
B<x>:=PolynomialRing(GF(2));
dp:=Degree(P);
P:=P;
p:=Reverse(Prune(Coefficients(P)));
S:=[L]; //I add initial state to the list off all states.
Ks:=[];
if dp ne #L then
	print "LFSR non puo’ continuare perche’ la lunghezza dello stato iniziale non 		coincide con il grado del polynomial feedback";
else
	for i in [1..t] do
		Append(~Ks,L[dp]);//adding new key
		//computing first element of new state xor(p,L)
		temp:=GF(2)!0;
		for j in [1..dp] do
			temp:=temp+p[j]*L[j];
		end for;
		//shifting all remaining values
		for j:=dp to 2 by -1 do
			//shift to the right L_(i-1);
			L[j]:=L[j-1];
                end for;
		L[1]:=temp;
		S:=Append(S,L);
	end for;
return Ks,S;
end if;
end function;