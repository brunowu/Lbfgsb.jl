import Libdl

# get the current path
currentFilePath = @__FILE__()
currentDirPath = dirname(currentFilePath)
libpath = joinpath(currentDirPath, "usr", "lib", "liblbfgsbf.so")

macro checked_lib(libname, path)
    #(Libdl.dlopen_e(path) == C_NULL) && error("Unable to load \n\n$libname ($path)

    #Please re-run Pkg.build(package), and restart Julia.")
    quote const $(esc(libname)) = $path end
end
@checked_lib liblbfgsbf "$libpath"
