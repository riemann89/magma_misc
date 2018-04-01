function Sbx(t)
Sb:=[["63", "7c", "77", "7b", "f2", "6b", "6f", "c5", "30", "01", "67", "2b", "fe", "d7", "ab", "76"],
["ca", "82", "c9", "7d", "fa", "59", "47", "f0", "ad", "d4", "a2", "af", "9c", "a4", "72", "c0"], 
["b7", "fd", "93", "26", "36", "3f", "f7", "cc", "34", "a5", "e5", "f1", "71", "d8", "31", "15"],
["04", "c7", "23", "c3", "18", "96", "05", "9a", "07", "12", "80", "e2", "eb", "27", "b2", "75"],
["09", "83", "2c", "1a", "1b", "6e", "5a", "a0", "52", "3b", "d6", "b3", "29", "e3", "2f", "84"],
["53", "d1", "00", "ed", "20", "fc", "b1", "5b", "6a", "cb", "be", "39", "4a", "4c", "58", "cf"],
["d0", "ef", "aa", "fb", "43", "4d", "33", "85", "45", "f9", "02", "7f", "50", "3c", "9f", "a8"],
["51", "a3", "40", "8f", "92", "9d", "38", "f5", "bc", "b6", "da", "21", "10", "ff", "f3", "d2"],
["cd", "0c", "13", "ec", "5f", "97", "44", "17", "c4", "a7", "7e", "3d", "64", "5d", "19", "73"],
["60", "81", "4f", "dc", "22", "2a", "90", "88", "46", "ee", "b8", "14", "de", "5e", "0b", "db"],
["e0", "32", "3a", "0a", "49", "06", "24", "5c", "c2", "d3", "ac", "62", "91", "95", "e4", "79"],
["e7", "c8", "37", "6d", "8d", "d5", "4e", "a9", "6c", "56", "f4", "ea", "65", "7a", "ae", "08"],
["ba", "78", "25", "2e", "1c", "a6", "b4", "c6", "e8", "dd", "74", "1f", "4b", "bd", "8b", "8a"],
["70", "3e", "b5", "66", "48", "03", "f6", "0e", "61", "35", "57", "b9", "86", "c1", "1d", "9e"],
["e1", "f8", "98", "11", "69", "d9", "8e", "94", "9b", "1e", "87", "e9", "ce", "55", "28", "df"],
["8c", "a1", "89", "0d", "bf", "e6", "42", "68", "41", "99", "2d", "0f", "b0", "54", "bb", "16"]]; 
return &*[Sb[StringToInteger(t[2*k-1],16)+1][StringToInteger(t[2*k],16)+1]:k in [1..4]];
end function;

function Sb(t)
SbM:=[["63", "7c", "77", "7b", "f2", "6b", "6f", "c5", "30", "01", "67", "2b", "fe", "d7", "ab", "76"],
["ca", "82", "c9", "7d", "fa", "59", "47", "f0", "ad", "d4", "a2", "af", "9c", "a4", "72", "c0"], 
["b7", "fd", "93", "26", "36", "3f", "f7", "cc", "34", "a5", "e5", "f1", "71", "d8", "31", "15"], 
["04", "c7", "23", "c3", "18", "96", "05", "9a", "07", "12", "80", "e2", "eb", "27", "b2", "75"],
["09", "83", "2c", "1a", "1b", "6e", "5a", "a0", "52", "3b", "d6", "b3", "29", "e3", "2f", "84"],
["53", "d1", "00", "ed", "20", "fc", "b1", "5b", "6a", "cb", "be", "39", "4a", "4c", "58", "cf"],
["d0", "ef", "aa", "fb", "43", "4d", "33", "85", "45", "f9", "02", "7f", "50", "3c", "9f", "a8"],
["51", "a3", "40", "8f", "92", "9d", "38", "f5", "bc", "b6", "da", "21", "10", "ff", "f3", "d2"],
["cd", "0c", "13", "ec", "5f", "97", "44", "17", "c4", "a7", "7e", "3d", "64", "5d", "19", "73"],
["60", "81", "4f", "dc", "22", "2a", "90", "88", "46", "ee", "b8", "14", "de", "5e", "0b", "db"],
["e0", "32", "3a", "0a", "49", "06", "24", "5c", "c2", "d3", "ac", "62", "91", "95", "e4", "79"],
["e7", "c8", "37", "6d", "8d", "d5", "4e", "a9", "6c", "56", "f4", "ea", "65", "7a", "ae", "08"],
["ba", "78", "25", "2e", "1c", "a6", "b4", "c6", "e8", "dd", "74", "1f", "4b", "bd", "8b", "8a"],
["70", "3e", "b5", "66", "48", "03", "f6", "0e", "61", "35", "57", "b9", "86", "c1", "1d", "9e"],
["e1", "f8", "98", "11", "69", "d9", "8e", "94", "9b", "1e", "87", "e9", "ce", "55", "28", "df"],
["8c", "a1", "89", "0d", "bf", "e6", "42", "68", "41", "99", "2d", "0f", "b0", "54", "bb", "16"]];
return StringToInteger(&*[SbM[StringToInteger(t[2*k-1],16)+1][StringToInteger(t[2*k],16)+1]:k in [1..4]],16);
end function;

function KE(k)
Z:=IntegerRing();
P<x>:=PolynomialRing(Z);
Rcon:=[16777216,33554432,67108864,134217728,268435456,536870912,1073741824];
w:=[Substring(k,1,8),Substring(k,9,8),Substring(k,17,8),Substring(k,25,8),Substring(k,33,8),Substring(k,41,8),Substring(k,49,8),Substring(k,57,8)];
l:=1;
for i in [9..60] do 
	temp:=w[i-1];
	if ((i-1) mod 8 eq 0) then
		temp:=Substring(temp,3,2)*Substring(temp,5,2)*Substring(temp,7,2)*Substring(temp,1,2);
		temp:=Sb(temp);
		temp:=IntegerToString(BitwiseXor(temp,Rcon[l]),16); // ho esadecimali
		while (#temp lt 8) do temp:="0"*temp; end while;
		l:=l+1;
	elif ((i-1) mod 8 eq 4) then
		temp:=IntegerToString(Sb(temp),16);
		while #temp lt 8 do temp:="0"*temp;end while;
	end if;
	w[i]:=IntegerToString(BitwiseXor(StringToInteger(w[i-8],16),StringToInteger(temp,16)),16); 
	while #w[i] lt 8 do w[i]:="0"*w[i];end while; 
end for;


return w;
end function;

Z:=IntegerRing();
P<x>:=PolynomialRing(GF(2));
MC2:=[];
MC3:=[];
for i in [1..256] do
	e02:=ElementToSequence((x*(P!Intseq(i-1,2))) mod (x^8+x^4+x^3+x+1));
	MC2[i]:=SequenceToInteger([Z!e02[j]:j in [1..#e02]],2);
	e03:=ElementToSequence(((x+1)*(P!Intseq(i-1,2))) mod (x^8+x^4+x^3+x+1));
	MC3[i]:=SequenceToInteger([Z!e03[j]:j in [1..#e03]],2);
end for; 
function mixcol(state)
v:=[];
for j in [1..4] do 
	c:=[];
	for k in [1..4] do
		v[k]:=StringToInteger(Substring(state[j],2*k-1,2),16);
	end for;
	c[1]:=IntegerToString(BitwiseXor(BitwiseXor(BitwiseXor(MC2[v[1]+1],MC3[v[2]+1]),v[3]),v[4]),16);
	while #c[1] ne 2 do c[1]:="0"*c[1]; end while;
	
	c[2]:=IntegerToString(BitwiseXor(BitwiseXor(BitwiseXor(MC2[v[2]+1],MC3[v[3]+1]),v[4]),v[1]),16);
	while #c[2] ne 2 do c[2]:="0"*c[2]; end while;
	
	c[3]:=IntegerToString(BitwiseXor(BitwiseXor(BitwiseXor(MC2[v[3]+1],MC3[v[4]+1]),v[1]),v[2]),16);
	while #c[3] ne 2 do c[3]:="0"*c[3]; end while;
	
	c[4]:=IntegerToString(BitwiseXor(BitwiseXor(BitwiseXor(MC2[v[4]+1],MC3[v[1]+1]),v[3]),v[2]),16);
	while #c[4] ne 2 do c[4]:="0"*c[4]; end while;
	state[j]:=&*[c[k]: k in [1..4]];
end for;
return state;
end function;


function encryptAES(kk,m)
state2:=[];
state:=[];
k:=[];
temp:=[];
for i in [1..4] do
	state[i]:=IntegerToString(BitwiseXor(StringToInteger(Substring(m,8*i-7,8),16),StringToInteger(Substring(kk,8*i-7,8),16)),16);
while #state[i] lt 8 do state[i]:="0"*state[i]; end while;
end for;
kk:=KE(kk);
for i in [1..60] do
	k[i]:=StringToInteger(kk[i],16);
end for;
for j in [1..13] do 
	for i in [1..4] do 
		state[i]:= Sbx(state[i]);
	end for;
	//seconda riga
	state2[1]:=Substring(state[1],1,2)*Substring(state[2],3,2)*Substring(state[3],5,2)*Substring(state[4],7,2);
	state2[2]:=Substring(state[2],1,2)*Substring(state[3],3,2)*Substring(state[4],5,2)*Substring(state[1],7,2);
	state2[3]:=Substring(state[3],1,2)*Substring(state[4],3,2)*Substring(state[1],5,2)*Substring(state[2],7,2);
	state2[4]:=Substring(state[4],1,2)*Substring(state[1],3,2)*Substring(state[2],5,2)*Substring(state[3],7,2);
	for i in [1..4] do
		state[i]:=state2[i];
 	end for;
	state:=mixcol(state);
	w:=[];
	for i in [1..4] do 
		temp[i]:=StringToInteger(state[i],16);
	end for;
	temp:=[BitwiseXor(temp[i],k[4*j+i]) : i in [1..4]];
	state:=[];
	for i in [1..4] do
		state[i]:=IntegerToString(temp[i],16);
		while #state[i] lt 8 do
			state[i]:="0"*state[i];
		end while;
	end for;
end for;
	for i in [1..4] do 
		state[i]:= Sbx(state[i]); //out hex
	end for;
	state2[1]:=Substring(state[1],1,2)*Substring(state[2],3,2)*Substring(state[3],5,2)*Substring(state[4],7,2);
	state2[2]:=Substring(state[2],1,2)*Substring(state[3],3,2)*Substring(state[4],5,2)*Substring(state[1],7,2);
	state2[3]:=Substring(state[3],1,2)*Substring(state[4],3,2)*Substring(state[1],5,2)*Substring(state[2],7,2);
	state2[4]:=Substring(state[4],1,2)*Substring(state[1],3,2)*Substring(state[2],5,2)*Substring(state[3],7,2);
	for i in [1..4] do
		state[i]:=state2[i];
 	end for;
	for i in [1..4] do 
		temp[i]:=StringToInteger(state[i],16);
	end for;
	temp:=[BitwiseXor(temp[i],k[56+i]) : i in [1..4]]; 
	state:=[];
	for i in [1..4] do
		state[i]:=IntegerToString(temp[i],16);
		while #state[i] lt 8 do //controllo che temp abbia 8 elementi
			state[i]:="0"*state[i];
		end while;
	end for;
return &*[state[k]:k in [1..4]];
end function;