library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

package mult_pkg is

    constant n : integer := 2;

    type t_in_col is array (0 to n) of unsigned(15 downto 0);
    type t_in_mat is array(0 to n) of t_in_col;
    type t_out_col is array (0 to n) of unsigned(31 downto 0);
    type t_out_mat is array(0 to n) of t_out_col;
    

    function row_col_mul (a : t_in_col; b : t_in_col) return unsigned;

    component mult_top is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in t_in_mat;
                i_B         : in t_in_mat;
                o_C         : out t_out_mat
            );
    end component;
end package mult_pkg;

package body mult_pkg is

    function row_col_mul (a : t_in_col; b : t_in_col) return unsigned is
        variable res : unsigned(31 downto 0) := (others =>'0');
        variable i : integer := 0;
    
        begin
            for i in 0 to a'length-1 loop
                res := res + (a(i)*b(i));
            end loop;
        return res;
    end row_col_mul;
end mult_pkg;