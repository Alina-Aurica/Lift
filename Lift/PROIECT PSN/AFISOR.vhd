library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity AFISOR is
	port(input: in STD_LOGIC_VECTOR (3 downto 0);
	     output: out STD_LOGIC_VECTOR (6 downto 0));
end AFISOR;

architecture af of AFISOR is   
begin
	process(input)
	begin
			case input is
				when "0000" => output  <= "1111110"; -- 0 -- 7E
				when "0001" => output  <= "1100000"; -- 1 -- 60
				when "0010" => output  <= "1011011"; -- 2 -- 5B
				when "0011" => output  <= "1110011"; -- 3 -- 73
				when "0100" => output  <= "1100101"; -- 4 -- 65  
				when "0101" => output  <= "0110111"; -- 5 -- 37
				when "0110" => output  <= "0111111"; -- 6 -- 3F
				when "0111" => output  <= "1100010"; -- 7 -- 62
				when "1000" => output  <= "1111111"; -- 8 -- 7F
				when "1001" => output  <= "1110111"; -- 9 -- 77 
				when "1010" => output  <= "1101111"; -- 10 -- 6F
				when "1011" => output  <= "0111101"; -- 11 -- 3D
				when "1100" => output  <= "0011110"; -- 12 -- 1E
				when others => output  <= "0000000"; -- altele -- 00
			end case;	
	end process; 
end af;