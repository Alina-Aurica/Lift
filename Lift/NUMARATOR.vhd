library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity NUMARATOR is
	port(R, CLK, S, ENABLE: in STD_LOGIC;
	     Q: inout STD_LOGIC_VECTOR (3 downto 0) := "0000");
end NUMARATOR;

architecture num of NUMARATOR is
signal timp: TIME := 3000ms;
begin	
	process(R, CLK, S, timp)
	variable val: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	begin
		if R='1' then
			Q <= "0000";
		end if;
		
		if ENABLE = '1' then
			if CLK'event  and  CLK = '1' then
				if S = '0' then 
					Q <= Q + 1;
				else
					Q <= Q - 1;
				end if;
			end if;
		end if;
	end process;
end num;
