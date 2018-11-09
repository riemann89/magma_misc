function exchangeDH(p,g)

a:=Random(2,p-2);
b:=Random(2,p-2);

A:=Modexp(g,a,p);
B:=Modexp(g,b,p);

S:=Modexp(A,b,p);

return a,A,b,B,S;
end function;