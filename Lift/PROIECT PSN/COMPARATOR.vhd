library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity COMPARATOR is 
	port(A, B: in STD_LOGIC_VECTOR (3 downto 0);
	     S: out STD_LOGIC);
end COMPARATOR;

architecture COMP of COMPARATOR is
begin
	process(A, B)
	begin
		if A<B then 
			S <= '1';
		end if;	
		
		if A>B then
			S <= '0';
		end if;	
	end process;
end COMP;
