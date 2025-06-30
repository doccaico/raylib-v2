@echo off

setlocal

REM rm *.obj
REM rm thirdparty\raylib\src\*.obj

REM TODO: !!BUG!!
set OPT=-subsystem console

REM set OPT=-subsystem windows -cmain wWinMain
REM set LDFLAGS="/ENTRY:mainCRTStartup /SUBSYSTEM:console /NODEFAULTLIB:libcmt.lib"
REM set LDFLAGS="/ENTRY:mainCRTStartup"
REM set LDFLAGS="/NODEFAULTLIB:libcmt"
set LDFLAGS=""
set F=examples\core_basic_window.v

REM v -v -cc msvc -prod %OPT% -ldflags %LDFLAGS% %F%
v -cg %OPT% -cc clang %F%

endlocal

REM vim: ft=dosbatch fenc=cp932 ff=dos
