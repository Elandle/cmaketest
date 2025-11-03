module linear_algebra
    use stduse
    use blas_interface
    use lapack_interface
    implicit none


    contains

        subroutine duppertri(A, B)
            real(dp), intent(in)  :: A(:, :)
            real(dp), intent(out) :: B(:, :)
            
            B = 0.0_dp
            call dlacpy('U', size(A, 1), size(A, 2), A, size(A, 1), B, size(B, 1))
        endsubroutine duppertri

endmodule linear_algebra