module simulate
    use stduse
    use utilities
    use statistics
    use linear_algebra
    use simulationsetup
    use rng
    implicit none

    contains

        subroutine simulate(S, constseed)
            type(Simulation), intent(inout) :: S
            integer         , intent(in)    :: constseed

            integer       :: i, j
            type(randgen) :: rgen
            real(dp)      :: diag, sum

            rgen = newrandgen(constseed)
            
            associate(n => S%n, A => S%A, B => S%B, result => S%result)
                diag = 0.0_dp
                do i = 1, n
                    diag = diag + A(i, i)
                enddo
                call random_number(A)
                call dlacpy('a', n, n, A, n, B, n)
                call daxpy(n, rando(), A(1, 1), 1, B(1, n), 1)
                call duppertri(B, A)
                sum = 0.0_dp
                do j = 1, n
                    do i = 1, n
                        sum = sum + del(i, j) * A(i, j)
                    enddo
                enddo
                result = diag * sum
            endassociate
        endsubroutine simulate

endmodule simulate