-- Top level file
-- Sébastien Deriaz
-- 26.09.2022
--
--
-- This file is part of the Quartus CLi test project
-- The goal is to provide a minimal example that is compilable with the quartus prime lite nix package
-- This is from https://www.intel.com/content/www/us/en/docs/programmable/683475/19-4/example-top-level-vhdl-module.html

library ieee;
use ieee.std_logic_1164.all;
library altera_mf;
use altera_mf.altera_mf_components.all;

entity QuartusCLI is
    port (
        clock, sel  : in std_logic;
        a, b, datab : in std_logic_vector(31 downto 0);
        result      : out std_logic_vector(31 downto 0));
end entity;

architecture arch of QuartusCLI is
    signal wire_dataa : std_logic_vector(31 downto 0);
begin

    wire_dataa <= a when (sel = '1') else
        b;