library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity MEMORIE_RAM is
port(A_RAM: in STD_LOGIC_VECTOR (3 downto 0); -- Adresele
     CS_RAM: in STD_LOGIC; -- Semnal selectie cip, „Chip Select” (clock)
     WE: in STD_LOGIC; -- 0 - read; 1 - write
     D1: in STD_LOGIC_VECTOR (3 downto 0);
	 D2: out STD_LOGIC_VECTOR (3 downto 0)); -- Valoare
end MEMORIE_RAM;

architecture MEMORIE_RAM of MEMORIE_RAM is 
type RAM_TYPE is array (0 to 12) of STD_LOGIC_VECTOR (3 downto 0);
signal RAM: RAM_TYPE := (0 => "0000",
						 1 => "0001",
						 2 => "0010",
						 3 => "0011",
						 4 => "0100",
						 5 => "0101",
						 6 => "0110",
						 7 => "0111",
						 8 => "1000",
						 9 => "1001",
						 10 => "1010",
						 11 => "1011",
						 12 => "1100");
begin
	
	D2 <= RAM(conv_integer(A_RAM)) when WE = '0' and CS_RAM = '1';
	RAM(conv_integer(A_RAM)) <= D1 when WE = '1' and CS_RAM = '1';
	

end MEMORIE_RAM;