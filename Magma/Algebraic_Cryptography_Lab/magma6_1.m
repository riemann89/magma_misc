function genDHparameters(pbits,qbits)

   

q:=RandomPrime(qbits+1);




while Ilog(2,q) ne qbits do
	//checking q has pbits
	
q:=RandomPrime(qbits+1);

end while;	

r:=RandomBits(pbits-qbits+1);
p:=q*r+1;

while not((IsPrime(p)) and (Ilog(2,p) eq pbits)) do
r:=RandomBits(pbits-qbits+1);
p:=q*r+1;
end while;

h:=Random(2,p-2);
g:=Modexp(h,(p-1) div q,p);

while (g eq 1) and (Modexp(g,q,p) ne 1) do
h:=Random(2,p-2);
g:=Modexp(h,(p-1) div q,p);
end while;

return p,q,g;


end function; 