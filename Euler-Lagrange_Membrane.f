*     ********************************************************
*     ***          Solving Euler–Lagrange equation         ***
*     ********************************************************
      program main
      implicit real*8 (a-h,l-z)
      integer igL, iU
      real*8 pi, ds, Xs, U0
      real*8 S, T, U, X, Z, F, A, kG, gA, gL
      real*8 U0_ans, kG_ans, gL_ans, gA_ans
*
      open(1,file='Euler-Lagrange_A40R05.dat',position='append')
*     ********************************************************
      pi = 4.0d0*datan(1.0d0)
*     **************************
*     *   Model Parameters     *
*     **************************
      A0 = 4.d0*pi  ;  Xs = 0.50d0  ;  k0 = -0.2d0
      ds = 1.d-4
*     **************************
*     Lagrange multiplier for Length of rim : gL
      do 1 igL = -200, 0, 1  ;  gL = iL*1.d-3
*     Initial curvature at s=0 : U0
      do 2 iU = 100, 200, 1  ;  U0 = iU*1.d-2
*     *************************************
*     initial condition (s, X, T -> 0)
*     tilt angle : T,   each derivative : d
*     *************************************
      dT = U0  ;  dU = 0.d0  ;  dX = 1.d0  ;  dZ = 0.d0

      S = 0.d0 + ds     ;  T = 0.d0 + dT*ds  ;  U = U0 + dU*ds
      X = 0.d0 + dX*ds  ;  Z = 0.d0 + dZ*ds
      
      A = 0.d0 + 2.d0*pi*X*ds
*     ************
*     integration
*     ************
      do while( A <= A0)
         dT = U  ;  dX = dcos(T)  ;  dZ = dsin(T)
         dU = - dtan(T)*U*U/2.d0 - dcos(T)*U/X + dsin(2.d0*T)/(2.d0*X*X)
     &        + dtan(T)/2.d0*(dsin(T)/X)**2 + gL*dtan(T)

         S = S + ds     ;  T = T + dT*ds  ;  U = U + dU*ds
         X = X + dX*ds  ;  Z = Z + dZ*ds
         
         A = A + 4.d0*pi*X*ds
      enddo
*     *******************

*     *******************
*     boundary conditions
*     *******************
*     Gaussian Modulus : kG (normalized by kb)
      kG = - X/dsin(T)*( U + dsin(T)/X)
*     Lagrange multiplier for Area : gA
      gA = X/dcos(T)*( (1.d0 + kG/2.d0)*kG*(dsin(T)/X)**2 - gL )
*     *******************
      if ( dabs(X - Xs) < 1.d-3 .and. dabs(kG-k0) < 1.d-3 ) then
         U0_ans = U0  ;  X_ans = X
         kG_ans = kG  ;  gL_ans = gL  ;  gA_ans = gA
      endif

 2    continue

      X_ans = X_ans/dsqrt(A0/(2.d0*pi))
      write(*,'(6(1pe13.5))') gL_ans, U0_ans, X_ans, kG_ans, gA_ans, A

 1    continue

*     ******************************************************
*     Stable Membrane Configuration
*     ******************************************************
      U0 = U0_ans
      dT = U0  ;  dU = 0.d0  ;  dX = 1.d0  ;  dZ = 0.d0

      S = 0.d0 + ds     ;  T = 0.d0 + dT*ds  ;  U = U0 + dU*ds
      X = 0.d0 + dX*ds  ;  Z = 0.d0 + dZ*ds

      A = 2.d0*pi*X*ds
*     **************************
      do while( A <= 4.d0*pi )
         dT = U  ;  dX = dcos(T)  ;  dZ = dsin(T)
         dU =- dtan(T)*U*U/2.d0 - dcos(T)*U/X + dsin(2.d0*T)/(2.d0*X*X)
     &        + dtan(T)/2.d0*(dsin(T)/X)**2 + gL*dtan(T)

         S = S + ds     ;  T = T + dT*ds  ;  U = U + dU*ds
         X = X + dX*ds  ;  Z = Z + dZ*ds

         A = A + 4.d0*pi*X*ds

         write(1,'(4(1pe18.10))') X, Z ,U, dsin(T)/X

      enddo
*     ******************************************************

      close (1)
      stop
      end

