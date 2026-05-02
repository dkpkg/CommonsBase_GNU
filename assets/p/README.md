# patches

## gawk-mingw-llvm-5.3.1

MinGW LLVM uses `_popen` and `_pclose` (where `popen` and `pclose` may be macros).

But GAWK undefines `popen` and `pclose` so the patch uses `_popen` and `_pclose` directly.

## patched-make-build_win32.bat

From <https://cgit.git.savannah.gnu.org/cgit/make.git/tree/build_w32.bat?h=4.4.1>.

Modifications:

1. `build_win32.bat gcc` now requires the path to the LLVM toolchain in `LLVMTOOLCHAIN` and the name of cross-compiler like `x86_64-w64-mingw32-gcc.exe` in `CROSSGCC`. The full path to the GCC executable is `LLVMTOOLCHAIN \ bin \ CROSSGCC`.
