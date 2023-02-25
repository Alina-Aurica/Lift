library IEEE;
use IEEE.std_logic_1164.all;

entity POARTA_SAU_NU is
	port(S_gr, S_u: in STD_LOGIC;
	     En: out STD_LOGIC);	
end POARTA_SAU_NU;

architecture SAU_NU of POARTA_SAU_NU is
begin
	En<=not(S_gr or S_u);
end SAU_NU;