library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity GEL_tb is
end entity;

architecture behavior of GEL_tb is
    -- DUT component declaration
    component GEL
        port(
            A1      : in  STD_LOGIC;
            A0      : in  STD_LOGIC;
            B1      : in  STD_LOGIC;
            B0      : in  STD_LOGIC;
            G1_out  : out STD_LOGIC;
            E1_out  : out STD_LOGIC;
            L1_out  : out STD_LOGIC;
            G2_out  : out STD_LOGIC;
            E2_out  : out STD_LOGIC;
            L2_out  : out STD_LOGIC;
            G3_out  : out STD_LOGIC;
            E3_out  : out STD_LOGIC;
            L3_out  : out STD_LOGIC;
            G : out STD_LOGIC;
            E : out STD_LOGIC; 
            L : out STD_LOGIC
        );
    end component;

    -- Signals for connecting to DUT
    signal A1, A0, B1, B0 : STD_LOGIC := '0';
    signal G1_out, E1_out, L1_out : STD_LOGIC;
    signal G2_out, E2_out, L2_out : STD_LOGIC;
    signal G3_out, E3_out, L3_out : STD_LOGIC;
    signal G, E, L : std_logic;
    

begin
    -- Instantiate DUT
    uut: GEL
        port map(
            A1 => A1,
            A0 => A0,
            B1 => B1,
            B0 => B0,
            G1_out => G1_out,
            E1_out => E1_out,
            L1_out => L1_out,
            G2_out => G2_out,
            E2_out => E2_out,
            L2_out => L2_out,
            G3_out => G3_out,
            E3_out => E3_out,
            L3_out => L3_out,
            G => G,
            E => E,
            L => L
        );

 -- Manual stepping through all 16 cases
  stim: process
  begin
    -- A=00
    -- B=00
    A1<='0'; A0<='0'; B1<='0'; B0<='0'; wait for 10 ns;
    -- B=01
    A1<='0'; A0<='0'; B1<='0'; B0<='1'; wait for 10 ns;
    -- B=10
    A1<='0'; A0<='0'; B1<='1'; B0<='0'; wait for 10 ns;
    -- B=11
    A1<='0'; A0<='0'; B1<='1'; B0<='1'; wait for 10 ns;

    
    -- A=01
    -- B=00
    A1<='0'; A0<='1'; B1<='0'; B0<='0'; wait for 10 ns;
    -- B=01
    A1<='0'; A0<='1'; B1<='0'; B0<='1'; wait for 10 ns;
    -- B=10
    A1<='0'; A0<='1'; B1<='1'; B0<='0'; wait for 10 ns;
    -- B=11
    A1<='0'; A0<='1'; B1<='1'; B0<='1'; wait for 10 ns;

    -- A=10
    -- B=00
    A1<='1'; A0<='0'; B1<='0'; B0<='0'; wait for 10 ns;
    -- B=01
    A1<='1'; A0<='0'; B1<='0'; B0<='1'; wait for 10 ns;
    -- B=10
    A1<='1'; A0<='0'; B1<='1'; B0<='0'; wait for 10 ns;
    -- B=11
    A1<='1'; A0<='0'; B1<='1'; B0<='1'; wait for 10 ns;

    -- A=11
    -- B=00
    A1<='1'; A0<='1'; B1<='0'; B0<='0'; wait for 10 ns;
    -- B=01
    A1<='1'; A0<='1'; B1<='0'; B0<='1'; wait for 10 ns;
    -- B=10
    A1<='1'; A0<='1'; B1<='1'; B0<='0'; wait for 10 ns;
    -- B=11
    A1<='1'; A0<='1'; B1<='1'; B0<='1'; wait for 10 ns;

    wait; -- stop
  end process;

end behavior;
