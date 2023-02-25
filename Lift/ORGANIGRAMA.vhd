library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity ORGANIGRAMA is
	port(CLK, RST: in STD_LOGIC;
	     UI, S, UD1, UD2: in STD_LOGIC;
	     A1, A2, A3, A4: out STD_LOGIC);
end ORGANIGRAMA;   

architecture corp of ORGANIGRAMA is
type type_states is (S1, S2, S3, S4);
signal st, nx_st: type_states; 
begin
	
	CLS: process(CLK, RST)
	begin
		if RST = '1' then
			st <= S1;
		elsif CLK'event and CLK = '1' then 
			st<=nx_st;
		end if;
	end process;
	
	CLC: process(st, UI, S, UD1, UD2)
	begin
		A1 <= '0';
		A2 <= '0';
		A3 <= '0';
		A4 <= '0';
		
		case st is
			when S1 =>
			if UI = '0' then nx_st <= S1;
			   else nx_st <= S2;
			end if; 
			
			when S2 =>
			if S = '0' then nx_st <= S3;
			   else nx_st <= S4; 
			end if;
			
			when S3 =>
			if UD1 = '0' then 
				nx_st <= S1 after 15000ms;
				A1 <= '1';
			else 
				A3 <= '1';
				nx_st <= S2;
			end if;
			
		    when S4 => 
			if UD2 = '0' then 
				nx_st <= S1 after 15000ms;
				A2 <= '1';
			else nx_st <= S2;
				 A4 <= '1';
			end if;	 
		end case;
	end process;	
end corp;