## It seems I need to write this file myself
## The code is mainly inspired by
##   - Source of BinDeps.jl
##   - https://github.com/JuliaOpt/NLopt.jl/blob/master/src/NLopt.jl
##

# get the current path
currentFilePath = @__FILE__()
currentDirPath = dirname(currentFilePath)

# function to mkdir lib dir
function mklibdir()
    usrdir = joinpath(currentDirPath, "usr");

    if isdir(usrdir) == false
        mkdir(usrdir);
    end

    libdir = joinpath(usrdir, "lib");
    if isdir(libdir) == false
        mkdir(libdir);
    end
end

#run make file
function runmake()
    usrdir = joinpath(currentDirPath, "usr", "lib");
    try
        run(`make OUTPUTDIR=$(usrdir)`)
    catch err
        @warn "The error" err
        run(`sudo make OUTPUTDIR=$(usrdir)`)
    end
end

mklibdir()
runmake()
