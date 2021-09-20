# Lbfgsb.jl

## Update by [@brunowu](https://github.com/brunowu)

This is a fork of a Julia wrapper of the L-bfgs-b fortran code from [jey/Lbfgsb.jl](https://github.com/jey/Lbfgsb.jl).

The only change is to support the installation of package trough ```Pkg.add``` rather than ```Pkg.clone```. The latter was
deprecated since Julia 1.0.

### New installation
run ```Pkg.add(PackageSpec(url="https://github.com/brunowu/Lbfgsb.jl", rev="master"))```

[![Build Status](https://travis-ci.org/yuhonglin/Lbfgsb.jl.png?branch=master)](https://travis-ci.org/yuhonglin/Lbfgsb.jl)


This is wrapper of the famous [lbfgsb fortran library] of Julia language inspired by [this wrapper]

## version
0.0.1 (just usable)

## Platform
Currently only for Linux with ```gfortran``` installed


## Copyright Notice
  File fotran routine is written by the authors of the following papers,
  - R. H. Byrd, P. Lu and J. Nocedal. A Limited Memory Algorithm for Bound Constrained Optimization, (1995), SIAM Journal on Scientific and Statistical Computing , 16, 5, pp. 1190-1208.
  - C. Zhu, R. H. Byrd and J. Nocedal. L-BFGS-B: Algorithm 778: L-BFGS-B, FORTRAN routines for large scale bound constrained optimization (1997), ACM Transactions on Mathematical Software, Vol 23, Num. 4, pp. 550 - 560.
  - J.L. Morales and J. Nocedal. L-BFGS-B: Remark on Algorithm 778: L-BFGS-B, FORTRAN routines for large scale bound constrained optimization (2011), to appear in ACM Transactions on Mathematical Software.

## Warning
I am new to Julia language so the code will be cleaned gradually

## usage
  - First, run ```Pkg.clone("https://github.com/yuhonglin/Lbfgsb.jl")```, then run ```Pkg.build("Lbfgsb")```
  - Currently only provide a function called ```lbfgsb```, see its option below,

# Options
  - ```ogFunc``` :  Objective and gradient function. It accept current ```x``` and a gradient array ```g```. It should return the objective function value and put the gradient into into ```g```.
  - ```x``` : Initial value of ```x```.
  - ```lb``` : lower bounds of each dimension of ```x```. Set to ```-Inf``` if equals to ```[]```.
  - ```ub``` : upper bounds of each dimension of ```x```. Set to ```Inf``` if equals to ```[]```.
  - ```btype``` : boundary types, see below,


| btype | boundary type of corresponding dimension |
| :---: |:----------------------------------------:|
|     0 | unbounded                                |
|     1 | only lower bound                         |
|     2 | both lower and upper bound               |
|     3 | only upper bound                         |


  - Other parameters : see the paper above for reference (mostly does not need to modify)
  - ```iprint``` : printing level of the fortran routine, set to ```-1``` if you does not want to print anything

License
----
BSD-3

[lbfgsb fortran library]:http://users.iems.northwestern.edu/~nocedal/lbfgsb.html
[this wrapper]:http://hannes.nickisch.org/code/glm-ie/pls/lbfgsb/README.html
