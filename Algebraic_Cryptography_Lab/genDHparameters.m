function genDHparameters(pbits,qbits)

//generating p

FLAG:=0;

while FLAG eq 0 do
	p:=RandomPrime(pbits+1);
	//checking p has pbits
	if Ilog(2,p)+1 eq pbits then
	//generating q
		qr:=p-1;
		F:=Factorization(qr);
		cF:=#F; //number of prime factor of qr
		//checking a factor with qbits
		i:=1;
		while FLAG eq 0 and i le cF do
			if Ilog(2,F[i][1])+1 eq qbits then
				q:=F[i][1];
				r:=qr div q;
				FLAG:=1;
			else 
				i:=i+1;
			end if;
		end while;
	end if;
end while;

//finding g


g:=1;
while g eq 1 do
	h:=Random(2,p-2);
	g:=Modexp(h,(p-1) div q,p);
end while;

return p,q,g;

end function;
	 