function RC4keyLoad(K)
S:=[i :i in {0..255}];


j:=0;

for i in [0..255] do
	j:=(j+S[i+1]+K[(i mod #K) +1]) mod 256;
	S:=swap(S,i+1,j+1);
end for;
return S;
end function;