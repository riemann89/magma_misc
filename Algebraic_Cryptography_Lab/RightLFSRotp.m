function RightLFSRotp(P,L)
//
//
//Input
//P is the connection polynomial for LFSR
//L is initial state
//
//Output
//L New State
//
//Identifiers
//
dp:=Degree(P);
P:=P;
p:=Reverse(Prune(Coefficients(P)));
//
//Steps
if dp ne #L then
	print "LFSR non puo’ continuare perche’ la lunghezza dello stato iniziale non 		coincide con il grado del polynomial feedback";
else
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
end if;
return L;
end function;