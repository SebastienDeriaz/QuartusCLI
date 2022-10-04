-- Top level file
-- Sébastien Deriaz
-- 26.09.2022
--
--
-- This file is part of the Quartus CLi test project
-- The goal is to provide a minimal example that is compilable with the quartus prime lite nix package

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity QuartusCLI is
    port (
        CLOCK_50 : in std_logic;
        KEY_N    : in std_logic_vector(3 downto 0);
        LEDR     : out std_logic_vector(9 downto 0);
        HEX0_N   : out std_logic_vector(6 downto 0);
        HEX1_N   : out std_logic_vector(6 downto 0);
        HEX2_N   : out std_logic_vector(6 downto 0);
        HEX3_N   : out std_logic_vector(6 downto 0);
        HEX4_N   : out std_logic_vector(6 downto 0);
        HEX5_N   : out std_logic_vector(6 downto 0));
end entity;

architecture arch of QuartusCLI is
    signal clk     : std_logic;
    signal reset   : std_logic;
    signal counter : std_logic_vector(32 downto 0);
begin
    clk   <= CLOCK_50;
    reset <= '0';

    process (all)

    begin
        if reset = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            counter <= std_logic_vector(unsigned(counter) + 1);
        end if;

    end process;

    -- Write to 7 segments display (0-1-2-3-4-5)
    -- inverted
    HEX5_N           <= "1000000";
    HEX4_N           <= "1111001";
    HEX3_N           <= "0100100";
    HEX2_N           <= "0110000";
    HEX1_N           <= "0011001";
    HEX0_N           <= "0010010";

    -- Write to LEDR (MSB at 0, LSB at KEY values)
    -- Invert KEY values because of pull-up layout
    LEDR(3 downto 0) <= not KEY_N;
    LEDR(9 downto 4) <= (others => '0');

end arch;