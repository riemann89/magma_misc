function genRSAkeys(bitlength)

flag:=0;

while flag eq 0 do 
	p:=RandomPrime(bitlength-2);
		while flag eq 0 do
		q:=RandomPrime(bitlength-Ilog(2,p));
		if bitlength eq Ilog(2,p*q)+1 then
			flag:=1;
		end if;
	end while;
end while;
N:=p*q;

flag:=0;
phiN:=(p-1)*(q-1);
while flag eq 0 do
	e:=Random(2,phiN-1);
	if Gcd(e,phiN) eq 1 then
		flag:=1;
	end if;
end while;

d:=InverseMod(e,phiN);
	
return N,p,q,e,d;
end function;
	
