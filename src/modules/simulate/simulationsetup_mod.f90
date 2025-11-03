module simulationsetup
    use stduse
    use utilities
    implicit none

    type :: Simulation
        integer               :: n
        real(dp), allocatable :: A(:, :)
        real(dp), allocatable :: B(:, :)
        real(dp)              :: result
    endtype Simulation

    contains

        type(Simulation) function setup_simulation(n) result(S)
            integer, intent(in) :: n

            S%n = n
            associate(A => S%A, B => S%B)
                allocate(A(n, n), B(n, n))
                A = 0.0_dp; B = 0.0_dp
                block
                    integer :: i, j
                    do i = 1, n
                        do j = 1, n
                            A(i, j) = del(i, j)
                        enddo
                    enddo
                endblock
            endassociate
            S%result = 0.0_dp
        endfunction setup_simulation

endmodule simulationsetup