# numerical-calculus-octave-scripts
Octave/Matlab functions and scripts related to "Calcolo Numerico e Laboratorio" 
course in UNIFE (University of Ferrara), year 2015-2016.

##What this repository is about

This repository is a collection of Octave/Matlab scripts and functions 
which you can freely use.

To be able to run these scripts with Matlab you may need to change some 
instructions. These scripts, infact, have only been tested with GNU Octave, a 
free (as in freedom) version of Matlab. If you use Matlab you should switch to 
[Octave](http://www.fsf.org/campaigns/priority-projects/gnu-octave-free-software-matlab-replacement) 
instead and maybe even contribute to that project.

Before writing these scripts and functions, there is (usually) a certain amount 
of paper work to be done (i.e. getting paper and pen and, while reading codes 
or theory, think and write about what, why and how it's done). This means that 
to fully understand what is going on you should spend some time on it, unless 
you are very good at maths :) and can grasp all the concepts at first 
glance.

Fell free to contribute to this repository.

##Covered arguments

- General Octave/Matlab training.
- Error evaluations.
  - Relative and absolute errors.
  - Condition number of square matrices.
- Number conversions
  - From base b1 to base b2.
- Linear systems solving
  - Diagonal matrices.
  - Lower matrices.
  - Upper matrices.
- Matrix factorization
  - A = LR
  - PA = LR
    - Non square matrices.
    - Band matrices with bandwidth r.
    - Tridiagonal matrices using Thomas's algorithm.
  - PAQ = LR
  - A = QR (with Givens rotations)
    - Hessenberg matrices.
  - A = RQ (with Givens rotations)
- Iterative methods
  - Iacobi.
  - Gauss Seidel.
  - Parametrized Iacobi.
  - SOR.
- Interpolation
  - Interpolation using Vandermonde matrix.
  - Lagrange polynomial.
  - Chebyshev polynomial
    - Trigonometric formula.
    - Iterative formula.
  - Chebyshev nodes.
  - Divided differences
    - For Newton's polynomial.
    - For Hermite's polynomial.
  - Newton polynomial
    - Standard interpolation.
    - Piecewise interpolation.
  - Hermite polynomial
    - Standard interpolation.
    - Piecewise cubic interpolation.
  - Splines
    - Linear splines.
    - Cubic splines.
- Approximation
  - Linear regression
    - Generic.
    - Polynomial.

##Function file structure

```
  License notice
  
  
  Function prototype
    
  Function prototype (printable)
  
  Brief description of what the function does
  
  [Explanation of mathematical theory]
  
  I: Input[s]
  P: Propriety[es] of input P
  O: Output[s]
  C: Consequence[s]
  
  
  Function code
```

##License

Every file in this repository is covered by the WTFPL. We decided not to use 
the GPL because all these are implemetations of well known mathematical cases, 
so the copyleft clause and others clauses are not necessary here.
