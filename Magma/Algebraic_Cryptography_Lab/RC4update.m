function RC4update(i,j,S)

i:=(i+1) mod 256;
j:=(j+S[i+1]) mod 256;
S:=swap(S,i+1,j+1);

return i,j,S;
end function;