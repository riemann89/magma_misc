function shift(v);

k:=v[8];
 
for j:=8 to 2 by -1 do
	v[j]:=v[j-1];
end for;
v[1]:=k;

return v;

end function;
