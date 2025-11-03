module lapack_interface
    use stduse
    implicit none

    interface
        subroutine dgetrf(m, n, a, lda, ipiv, info)
            import   :: dp
            integer  :: m
            integer  :: n
            real(dp) :: a(lda, *)
            integer  :: lda
            integer  :: ipiv(*)
            integer  :: info
        endsubroutine dgetrf
    endinterface

    interface
        subroutine dlacpy(uplo, m, n, a, lda, b, ldb)
            import    :: dp
            character :: uplo
            integer   :: m
            integer   :: n
            real(dp)  :: a(lda, *)
            integer   :: lda
            real(dp)  :: b(ldb, *)
            integer   :: ldb
        endsubroutine dlacpy
    endinterface

endmodule lapack_interface