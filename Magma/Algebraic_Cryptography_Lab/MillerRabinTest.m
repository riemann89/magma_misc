function MillerRabinTest(n)

//Checking n is odd or even
if n mod 2 eq 0 then
	return printf “n is not prime”;
else
	x:=Random(2,n);
	gcd:=Gcd(x,n);
	if gcd ne 1 then
		return printf “n is not prime”;
	else
		if x^(n-1) mod n ne 1 then
			return printf “n is not prime”;
		else
			[k,m]:=km(n);
			i:=1;
			while x^(m*2^i) mod n ne 1 do
				i:=i+1;
			end while;
			if x^ 
			
	
		
end
