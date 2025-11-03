module rng
    use iso_fortran_env, only: real64
    implicit none

    integer, parameter, private :: dp = real64

    type :: randgen
        integer              :: seedlen
        integer, allocatable :: seed(:)
    endtype randgen

    contains

        type(randgen) function newrandgen(constseed) result(rgen)
            integer, optional, intent(in) :: constseed

            integer :: seedlen

            call random_seed(size=seedlen)
            allocate(rgen%seed(seedlen))
            if(present(constseed)) then
                rgen%seed = constseed
                call random_seed(put=rgen%seed)
            endif
        endfunction newrandgen

        subroutine setconstseed(rgen, constseed)
            type(randgen), intent(inout) :: rgen
            integer      , intent(in)    :: constseed

            rgen%seed = constseed
            call random_seed(put=rgen%seed)
        endsubroutine setconstseed

        real(dp) function rando()
            call random_number(rando)
        endfunction rando

endmodule rng