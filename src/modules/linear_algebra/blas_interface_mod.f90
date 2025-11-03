module blas_interface
    use stduse
    implicit none

    interface
        subroutine daxpy(n, da, dx, incx, dy, incy)
            import   :: dp
            integer  :: n
            real(dp) :: da
            real(dp) :: dx(*)
            integer  :: incx
            real(dp) :: dy(*)
            integer  :: incy
        endsubroutine daxpy
    endinterface

endmodule blas_interface