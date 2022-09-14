# autophagosome_shapes

Code used in the mathematical model calculations to determine the stable membrane shapes in the paper.\
https://www.biorxiv.org/content/10.1101/2022.07.20.500884v1 \
Figures 6, 7 and S3 in the paper can be computed using this code.\
The stable shape is determined from the elastic bending energy of the membrane using the Euler-Lagrange method.\
Eq. (S3) is solved under the boundary conditions (S4)-(S5) to obtain the membrane coordinates (X, Z) at each s.

Since the code is written in Fortran, it should be executed on a machine with a Fortran compiler installed.
