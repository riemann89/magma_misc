function RSAdecrypt(c,N,d)

m:=Modexp(c,d,N);

return m;
end function;