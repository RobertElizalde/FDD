library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity decodificador0 is
  port(
       A, B, C, D: in std_logic;
	   Ao, Bo, Co, Do, Eo, Fo, Go: out std_logic);
end decodificador0;

architecture decodificador of decodificador0 is
begin
  Ao <= (not(A) and not(C) and not(D)) or (not(A) and C and D) or (not(B) and not(C)) or (not(A) and not(B));
  Bo <= (not(B) and not(C)) or (not(A) and B) or (not(A) and not(C)) or (not(A) and D);
  Co <= (not(A) and B and not(C) and D) or (not(B) and not(C) and not(D)) or (A and not(B) and not(C)) or (not(A) and not(B) and not(D)) or (not(A) and C and not(D)) or (not(A) and not(B) and C);
  Do <= (not(A) and C and not(D)) or (not(A) and not(B) and not(D)) or (not(B) and not(C) and not(D));
  Eo <= (not(A) and B and not(D)) or (not(A) and not(C) and not(D)) or (not(B) and not(C) and not(D)) or (not(A) and B and not(C)) or (A and not(B) and not(C));
  Fo <= (not(B) and not(C) and not(D)) or (not(A) and not(B) and not(D)) or (A and not(B) and not(C)) or (not(A) and B and D) or (not(A) and C);
  Go <= (not(A) and B and not(D)) or (not(A) and B and not(C)) or (A and not(B) and not(C)) or (not(A) and not(B) and C) or  (not(A) and C and not(D));

end decodificador; 
