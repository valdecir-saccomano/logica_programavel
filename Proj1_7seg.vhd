LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity SS_controller is
generic(
fclk : natural := 100; -- frequencia do clk (Mhz)
f7s : natural := 100 -- frequencia de atualizacao dos displays (Hz)
);
port(
clk : in STD_LOGIC;
btnCpuReset : in STD_LOGIC;
led : out STD_LOGIC_VECTOR (15 downto 0);
seg : out STD_LOGIC_VECTOR (6 downto 0);
an : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
dp : out STD_LOGIC
);
end SS_controller;

ARCHITECTURE bhv OF SS_controller IS
-- Constantes que definem o valor mostrado no display
signal SS1 : integer range 0 to 9 := 2;

signal seg_atual : std_logic_vector (6 downto 0);

BEGIN

with ss1 select
    
        seg_atual <= "1000000" when 0, -- digito 0
                      "1111001" when 1, -- digito 1
                      "0100100" when 2, -- digito 2
                      "0110000" when 3, -- digito 3
                      "0011001" when 4, -- digito 4
                      "0010010" when 5, -- digito 5
                      "0000010" when 6, -- digito 6
                      "1111100" when 7, -- digito 7
                      "0000000" when 8, -- digito 8
                      "0001100" when others; -- digito 9

seg <= seg_atual;
an <= "11111110";

END bhv;