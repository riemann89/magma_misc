function Mlay(m)

v:=[GF(2)!1,1,1,1,1,0,0,0];
M:=[];
M[1]:=v;
mm:=Matrix(GF(2),8,1,m);

for i in [2..8] do
		v:=shift(v);
		M[i]:=v;
end for;

Mm:=Matrix(GF(2),8,8,M);

//Calcolo il il prodotto 
return ElementToSequence(Mm*mm);

end function;