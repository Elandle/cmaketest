module stduse
    use iso_fortran_env, only: stdin  => input_unit ,   &
                               stdout => output_unit,   &
                               sp     => real32     ,   &
                               dp     => real64
    implicit none
endmodule stduse