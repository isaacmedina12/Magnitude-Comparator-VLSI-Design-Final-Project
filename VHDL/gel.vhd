library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity GEL is 
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
end GEL;

architecture dataflow of GEL is

    signal E1_out_int : STD_LOGIC;
    signal G1_out_int : STD_LOGIC;
    signal E2_out_int : STD_LOGIC;
    signal G2_out_int : STD_LOGIC;
    signal E3_out_int : STD_LOGIC;
    signal G3_out_int : STD_LOGIC;
    signal X : STD_LOGIC;
    signal G_int : std_logic;
    signal L_int : std_logic;

  
begin

    -- First implementation 50 transistors + 16 transistor inverter buffer: 
    E1_out_int <= not ((A1 xnor B1) nand (A0 xnor B0));
    G1_out_int <= (not ((A1 xnor B1) nand (not (A0 nand (not B0))))) or (not (A1 nand (not B1)));
    L1_out     <= E1_out_int nor G1_out_int;
    E1_out     <= E1_out_int;
    G1_out     <= G1_out_int;

    -- Second implementation 44 transistors + 16 transistor inverter buffer:
    E2_out_int <= not (((not A1) xnor (not B1)) nand ((not A0) xnor (not B0)));
    G2_out_int <= (((not A1) xnor (not B1)) nand (not (A0 nand (not B0)))) nand (A1 nand (not B1));
    L2_out     <= E2_out_int nor G2_out_int;
    E2_out     <= E2_out_int;
    G2_out     <= G2_out_int;

    -- Third implementation 42 transistors + 16 transistor inverter buffer:
    E3_out_int <= not ((A1 xnor B1) nand ((not A0) xnor (not B0)));
    G3_out_int <= ((A1 xnor B1) nand ((not A0) nor B0)) nand (A1 nand (not B1));
    L3_out     <= E3_out_int nor G3_out_int;
    E3_out     <= E3_out_int;
    G3_out     <= G3_out_int;

    -- Fourth implementation: 
    X <= A1 xnor B1;
    G_int <= (X and A0 and (not B0)) or (A1 and (not B1));
    L_int <= (X and B0 and (not A0)) or (B1 and (not A1));
    E <= G_int nor L_int;
    G <= G_int;
    L <= L_int;
end dataflow;