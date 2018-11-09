function RSAencrypt(m,N,e)

c:=Modexp(m,e,N);

return c;
end function;