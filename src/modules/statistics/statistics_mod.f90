module statistics
    use stduse
    implicit none

    contains

        real(dp) function davg(x)
            real(dp), intent(in) :: x(:)

            davg = sum(x) / size(x)
        endfunction davg

endmodule statistics