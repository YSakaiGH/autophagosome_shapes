# Mathematical modeling of standard shapes of forming autophagosomes

## Calculation of stable membrane shapes

This Code is used in the model calculations to determine the membrane shapes in the paper,\
https://www.biorxiv.org/content/10.1101/2022.07.20.500884v1. \
Figures 6, 7 and S3 in the paper were calculated using this code.

The membrane shape is determined from the elastic bending energy using the Euler-Lagrange equation (S3).\
Eq. (S3) is solved under the boundary conditions (S4)-(S5) to obtain the membrane coordinates (X, Z) at each s.

Since the code is written in Fortran, it should be executed on a machine with a Fortran compiler installed.
