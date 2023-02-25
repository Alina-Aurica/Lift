library IEEE;
use IEEE.std_logic_1164.all;

entity LIFT is
	port(INTRARE: in STD_LOGIC_VECTOR (3 downto 0); --intrari lift
	     CERERE: in STD_LOGIC_VECTOR (3 downto 0);  --adresa de memorie
		 S_gr, S_u: in STD_LOGIC;  --senzori de greutate
		 CLK, R: in STD_LOGIC;
		 ETAJ: out STD_LOGIC_VECTOR (6 downto 0));	--iesire
end LIFT;

architecture LIFT of LIFT is

component ORGANIGRAMA
	port(CLK, RST: in STD_LOGIC;
	     UI, S, UD1, UD2: in STD_LOGIC;
	     A1, A2, A3, A4: out STD_LOGIC);
end component; 

component POARTA_SAU_NU
	port(S_gr, S_u: in STD_LOGIC;
	     En: out STD_LOGIC);	
end component; 

component COMPARATOR
	port(A, B: in STD_LOGIC_VECTOR (3 downto 0);
	     S: out STD_LOGIC);
end component;

component NUMARATOR
	port(R, CLK, S, ENABLE: in STD_LOGIC;
	     Q: inout STD_LOGIC_VECTOR (3 downto 0));
end component;	 

component AFISOR
	port(input: in STD_LOGIC_VECTOR (3 downto 0);
	     output: out std_logic_vector (6 downto 0));
end component;	

component MEMORIE_RAM
	port(A_RAM: in STD_LOGIC_VECTOR (3 downto 0); -- Adresele
	     CS_RAM: in STD_LOGIC; -- Semnal selectie cip, „Chip Select” (clock)
	     WE: in STD_LOGIC; -- 0 - read; 1 - write
	     D1: in STD_LOGIC_VECTOR (3 downto 0);
		 D2: out STD_LOGIC_VECTOR (3 downto 0)); -- Valoare
end component;

component DECIZIE_ORG
	port(A, Q: in STD_LOGIC_VECTOR (3 downto 0);
	     U: out STD_LOGIC);
end component; 	 

signal A: STD_LOGIC_VECTOR (3 downto 0);  --legatura dintre memorie si comparator/numarator 
signal S_nr: STD_LOGIC;  --semnal declansare numarator (legatura dintre comparator si numarator)
signal En_nr: STD_LOGIC;   --semnal pornire numarator (legatura dintre poarta SAU-NU si numarator
signal B: STD_LOGIC_VECTOR (3 downto 0);   --legatura dintre numarator si afisor	 
signal UD: STD_LOGIC;
signal A1: STD_LOGIC; 
signal A2: STD_LOGIC; 
signal A3: STD_LOGIC;
signal A4: STD_LOGIC;
signal WE: STD_LOGIC:='0';

begin
	
	leg1: MEMORIE_RAM port map (CERERE, '1', WE, INTRARE, A);
	leg3: COMPARATOR port map (A, B, S_nr);
	leg4: POARTA_SAU_NU port map (S_gr, S_u, En_nr);
	leg5: NUMARATOR port map (R, CLK, S_nr, En_nr, B);
	leg6: DECIZIE_ORG port map (A, B, UD);
	leg7: ORGANIGRAMA port map (CLK, R, En_nr, S_nr, UD, UD, A1, A2, A3, A4);
	leg8: AFISOR port map (B, ETAJ);

end LIFT;
