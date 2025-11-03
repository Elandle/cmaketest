module utilities
    use stduse
    implicit none

    contains

        integer function del(i, j)
            integer, intent(in) :: i
            integer, intent(in) :: j

            if (i .eq. j) then
                del = 1
            else
                del = 0
            endif
        endfunction del

endmodule utilities