!-- Younghwa Cho
!-- Fortran-C++ Binding TEST1
!-- Array
program main
    use, intrinsic :: iso_c_binding
    implicit none

    interface
        subroutine modify_array_cpplang(nspec, Yi1, Yi2) bind(c, name="modify_array")
            import :: C_INT, C_DOUBLE ! Must be declared
            
            !-- intent added, better
            integer(C_INT), intent(in) :: nspec(1)
            real(C_DOUBLE), intent(inout) :: Yi1(*), Yi2(*)
            
            !-- GNU(g++ & gfortran), INTEL(icx, ifort) Normally works
            !-- But, not the best
            !integer(C_INT) :: nspec(1)
            !real(C_DOUBLE) :: Yi1(*), Yi2(*)
        end subroutine modify_array_cpplang
    end interface 

    integer(C_INT) :: nspec(1)
    real(C_DOUBLE), allocatable :: Yi1(:), Yi2(:)

    integer :: i

    nspec(1) = 3
    write(*,*) 'nspec(1) = ', nspec(1)

    !-- Different Allocation Styles
    allocate(Yi1(nspec(1)))
    allocate(Yi2(0:nspec(1)-1))

    !-- Yi1 = (/ 1, 2, 3 /)
    do i = 1, nspec(1)
        Yi1(i) = dble(i)
        Yi2(i-1) = dble(i)
    end do

    write(*,*) '[Before] Yi1 = ', Yi1(1:nspec(1))
    write(*,*) '[Before] Yi2 = ', Yi2(0:nspec(1)-1)

    !-- C++ Function (void modify_array) 
    call modify_array_cpplang(nspec, Yi1, Yi2)
    
    write(*,*) '[After] Yi1 = ', Yi1(1:nspec(1))
    write(*,*) '[After] Yi2 = ', Yi2(0:nspec(1)-1)

    deallocate(Yi1)
    deallocate(Yi2)
end program main
