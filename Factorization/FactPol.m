//This function implements the Berlekamp algorithm to factorize polynomials in Finite Fields of order q. It works using the function "Berlekamp" where is implemented a factorization algorithm due to Berlekamp.

function FactPol(f)
//Declarations
R:=Parent(f);
q:=#Parent(LeadingCoefficient(f));
Z:=IntegerRing();
c:=Characteristic(GF(q));//calculating the caracteristic of GF(q)
d:=0;
vf:=[<f,1>]; //vector representing polynomial must be factorized.
i:=1;
temp2:=[];
fattori:=[];

//Check if the polynomial has degree 0 or 1
if Degree(f) eq -1 then 
	print "Il polinomio è nullo";
	return f;
elif Degree(f) eq 0 then
	print "Il polinomio è una costante";
		return f;
elif Degree(f) eq 1 then
	print "Il polinomio è irriducibile";
	return vf;
end if;

//Proceding to construct a vector with non repetition factors of f.
while d ne 1 do
	//Making monic f
	lf:=LeadingCoefficient(vf[i][1]);
	vf[i][1]:=(vf[i][1]) div R!(lf);

	//Checking if f has multiple roots 
	d:=GCD(vf[i][1],Derivative(vf[i][1]));

	//CASES
	if d eq 1 then
		// Do Nothing - f has no multiple roots
	elif d eq vf[i][1] then
		vf[i][1]:=Root(vf[i][1],c);
		vf[i][2]:=vf[i][2]*c;
	else
		vf[i]:=<vf[i][1] div d, vf[i][2]>; //To this factor I can perform Berlekamp
		vf:=Append(vf,<d,vf[i][2]>); //Adding d, with the multiplicity, to the vector vf on which we check if it has multiple roots.			 
		i:=i+1;
	end if;
end while;


//Now the vector vf contains pairs (f_i,e_i) s.t. their product gives f, for each f_i are have no multiple roots. This f_i are not irreducible, so we have to perform Berlekamp.

//Applying Berlekamp for each polynomial.
for i in [1..#vf] do
	temp:=Berlekamp(vf[i][1]);
	for j in [1..#temp] do
		temp[j][2]:=vf[i][2]*temp[j][2];// adding the multiplicity, of f_i, to each factor of f_i.
	end for;
	temp2:=temp2 cat temp; //In temp2 we collect all irreducible factors that we find step by step.
end for;

//Sorting the factors 
temp2:=Sort(temp2);

//Assembling duplicated factors and updating the multiplicity.
fattori[1]:=temp2[1];

for i in [2..#temp2] do
	copied:=0;
	for j in [1..#fattori] do
		if temp2[i][1] eq fattori[j][1] then
			fattori[j][2]:=fattori[j][2]+temp2[i][2];
			copied:=1;
		end if;
	end for;
	if copied eq 0 then
		fattori[#fattori+1]:=temp2[i];
	end if;
end for;
return fattori;

end function;
