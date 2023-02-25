library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity DECIZIE_ORG is
	port(A, Q: in STD_LOGIC_VECTOR (3 downto 0);
	     U: out STD_LOGIC);
end DECIZIE_ORG;



architecture DECIZIE_ORG of DECIZIE_ORG is
begin

	process(A, Q)
	begin
		if A = Q then
			U <= '0';
		else 
		    U <= '1';
		end if;
	end process;

end DECIZIE_ORG;
