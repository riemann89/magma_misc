/*
* DESCRIPTION: Magma implementation of SHA256 algorithm.
* AUTHOR: Giuseppe Giffone
* REF: FIPS PUB 180-4
* LINKS: http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf
*/

function hashSHA2(M)

//Variable init
H:=[[]];
K:=[];
k:=0;

H[1][1]:=1779033703;
H[1][2]:=3144134277;
H[1][3]:=1013904242;
H[1][4]:=2773480762;
H[1][5]:=1359893119;
H[1][6]:=2600822924;
H[1][7]:=528734635;
H[1][8]:=1541459225;


K:=[1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616, 659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298];

M:=Intseq(StringToInteger(M,16),2);
while (#M mod 8) ne 0  do
	M:=Append(M,0);
end while;

M:=Reverse(M);

aus:=(#M+1) mod 512;
if aus le 448 then
	k:=448-aus;
else
	k:=960-aus;
end if;

L:=Intseq(#M,2);
for i in [1..64-#L] do
	L:=Append(L,0);
end for;
L:=Reverse(L);

M:=Append(M,1);
for i in [1..k] do
	M:=Append(M,0);
end for;

M cat:= L;
N:=#M div 512;

//Parsing e integer conversion
M:=Partition([Seqint(Reverse(M[i*32+1..(i+1)*32]),2) : i in [0..(#M div 32)-1]],16);
for i in [1..N] do
	W:=[];
	for t in [1..16] do
		W[t]:=M[i][t];
	end for;
	for t in [17..64] do
		W[t]:=(BitwiseXor(BitwiseXor(BitwiseOr(ShiftRight(W[t-2],17),ShiftLeft(W[t-2],15)),BitwiseOr(ShiftRight(W[t-2],19),ShiftLeft(W[t-2],13))),ShiftRight(W[t-2],10))+W[t-7]+(BitwiseXor(BitwiseXor(BitwiseOr(ShiftRight(W[t-15],7),ShiftLeft(W[t-15],25)),BitwiseOr(ShiftRight(W[t-15],18),ShiftLeft(W[t-15],14))),ShiftRight(W[t-15],3)))+W[t-16]) mod 2^32;
	end for;
	a:=H[i][1];
	b:=H[i][2];
	c:=H[i][3];
	d:=H[i][4];
	e:=H[i][5];
	f:=H[i][6];
	g:=H[i][7];
	h:=H[i][8];
	for t in [1..64] do
		T1:=(h+BitwiseXor(BitwiseXor(BitwiseOr(ShiftRight(e,6),ShiftLeft(e,26)),BitwiseOr(ShiftRight(e,11),ShiftLeft(e,21))),BitwiseOr(ShiftRight(e,25),ShiftLeft(e,7)))+ BitwiseXor(BitwiseAnd(e,f),BitwiseAnd(BitwiseNot(e),g))+K[t]+W[t]) mod 2^32;
		T2:=BitwiseXor(BitwiseXor(BitwiseOr(ShiftRight(a,2),ShiftLeft(a,30)),BitwiseOr(ShiftRight(a,13),ShiftLeft(a,19))),BitwiseOr(ShiftRight(a,22),ShiftLeft(a,10)))+BitwiseXor(BitwiseXor(BitwiseAnd(a,b),BitwiseAnd(a,c)),BitwiseAnd(b,c)) mod 2^32;
		h:=g;
		g:=f;
		f:=e;
		e:=(d + T1) mod 2^32;
		d:=c;
		c:=b;
		b:=a;
		a:=(T1+T2) mod 2^32;
	end for;
	H:=Append(H,[(a+H[i][1]) mod 2^32]);
	H[i+1]:=Append (H[i+1],(b+H[i][2]) mod 2^32); 
	H[i+1]:=Append (H[i+1],(c+H[i][3]) mod 2^32);
	H[i+1]:=Append (H[i+1],(d+H[i][4]) mod 2^32);
	H[i+1]:=Append (H[i+1],(e+H[i][5]) mod 2^32);
	H[i+1]:=Append (H[i+1],(f+H[i][6]) mod 2^32);
	H[i+1]:=Append (H[i+1],(g+H[i][7]) mod 2^32);
	H[i+1]:=Append (H[i+1],(h+H[i][8]) mod 2^32);
end for;
HN:=[];
for j in [1..8] do
	HN[j]:=IntegerToString(H[N+1][j],16);
end for;
c:=[];
for j in [1..8] do
	c[j]:=#HN[j] mod 8;
end for;
for i in [1..8] do
	if c[i] ne 0 then
			HN[i]:=&*["0": k in [1..8-c[i]] ]*HN[i]; 
	end if;
end for;
return &*[HN[1],HN[2],HN[3],HN[4],HN[5],HN[6],HN[7],HN[8]];
end function;
