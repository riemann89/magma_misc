//This function implements the Berlekamp algorithm to factorize polynomials in Finite Fields. It works in the case f has no repeated factors 

function Berlekamp(f);

R<x>:=Parent(f);
Z:=IntegerRing();
n:=Degree(f);
q:=#Parent(LeadingCoefficient(f));
A:=[];
hc:=[];
h:=[];

//Constructing the linear system
for j in [1..n] do
	A[j]:=Coefficients(x^((j-1)*q)mod f);
	while #A[j] ne n do
		A[j]:=Append(A[j],0);
	end while;
end for;

B:=Matrix(GF(q),n,n,A);//Casting into a matrix
I:=Id(GeneralLinearGroup(n,GF(q))); //Identity matrix
base:=Basis(Kernel(B-I)); //It gives a base of the kernel subspace

if #base eq 1 then //f is irreducible.
	return [<f,1>]; 
else
	//f is reducble
	for i in [2..#base] do  //First element is always the "identity". So I discard it.
		hc[i-1]:=ElementToSequence(base[i]); //Casting each vector into sequence.
	end for;

	//Constructing h's from vectors 
	for i in [1..#hc] do
		h[i]:=R!hc[i];
	end for;

	// Finding k different factors.
	fattori:={f};
	i:=1;
	while #fattori ne (#h+1) do
		fattori:={GCD(g,h[i]-c):c in GF(q),g in fattori} diff {1}; // Using sets permits us to avoid repetition factors. Using "diff" to discart trivial factor 1.
		i:=i+1;
	end while;
end if;
fattori:=Setseq(fattori);// Casting into sequences.

return [<fattori[i],1> : i in [1..#fattori]]; //Returning factorization and relative multiplicity (obviously 1).

end function;
