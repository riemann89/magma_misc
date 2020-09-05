function RC4keyStream(S,b)

i:=0;
j:=0;
KS:=[];
for r in [1..b] do 
	i,j,S:=RC4update(i,j,S);
	t:=(S[i+1]+S[j+1]) mod 256;
	KS[r]:=S[t+1];
end for;
return KS;
end function;