program main
    use stduse
    use simulate
    use simulationsetup
    implicit none

    type(Simulation) :: S
    integer          :: n, constseed

    n         = 4
    constseed = 123
    S         = setup_simulation(n)
    call simulate(S, constseed)
    write(stdout, "(a, f8.4)") "Result = ", S%result

endprogram main