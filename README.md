# Experimental determination and mathematical modeling of standard shapes of forming autophagosomes.

## Yuji Sakai, Satoru Takahashi, Ikuko Koyama-Honda, Chieko Saito, Noboru Mizushima

This Code is used in the model calculations to determine the membrane shapes in the paper,\
https://www.biorxiv.org/content/10.1101/2022.07.20.500884v1. \
Figures 5-7, S1, S4 and S6-8 in the paper were calculated using this code.

The membrane shape is determined from the elastic bending energy using the Euler-Lagrange equation (14).\
Eq. (14) is solved under the boundary conditions (15)-(16) to obtain the membrane coordinates (X, Z) at each s.\
A calculation with one fixed boundary conditions takes roughly a few minutes.\
An example output is shown in the output.dat file, \
where the first, second, and third columns are s, x-coordinates, and y-coordinates, respectively.

Since the code is written in Fortran, it should be executed on a machine with a Fortran compiler installed.


# Summary
The formation of autophagosomes involves dynamic morphological changes of a phagophore from a flat membrane cisterna into a cup-shaped intermediate and a spherical autophagosome. However, the physical mechanism behind these morphological changes remains elusive. Here, we determine the average shapes of phagophores by statistically investigating three-dimensional electron micrographs of more than 100 phagophores. The results show that the cup-shaped structures adopt a characteristic morphology; they are longitudinally elongated, and the rim is catenoidal with an outwardly recurved shape. To understand these characteristic shapes, we establish a theoretical model of the shape of entire phagophores. The model quantitatively reproduces the average morphology and reveals that the characteristic shape of phagophores is primarily determined by the relative size of the open rim to the total surface area. These results suggest that the seemingly complex morphological changes during autophagosome formation follow a stable path determined by elastic bending energy minimization.
