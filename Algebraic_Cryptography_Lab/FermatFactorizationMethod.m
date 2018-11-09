function FermatFactorizationMethod(n);

Z:=IntegerRing();
t:=Ceiling(Sqrt(n));
s:=Sqrt(Power(t,2)-n);

while not(s in Z) do
	t+:=1;
	s:=Sqrt(Power(t,2)-n);
end while;

a:=Z!(t+s);
b:=Z!(t-s);

return a,b;
end function;