@echo off

setlocal

del *.obj
del thirdparty\raylib\src\*.obj
rmdir /s /q %USERPROFILE%\.vmodules\.cache
rmdir /s /q %USERPROFILE%\AppData\Local\Temp\v_0

set FN=examples\core_basic_window.v

set COPT=
REM set COPT=-subsystem console
REM set COPT=-subsystem windows
REM set COPT=-subsystem windows -cmain wWinMain

set LDOPT=
REM set LDOPT="/ENTRY:mainCRTStartup /SUBSYSTEM:console /NODEFAULTLIB:libcmt.lib"
REM set LDOPT="/ENTRY:mainCRTStartup"
REM set LDOPT="/NODEFAULTLIB:libcmt"
REM set LDOPT=-ldflags -fuse-ld=lld
REM set LDOPT=-ldflags /SUBSYSTEM:console
REM set LDOPT=/SUBSYSTEM:console
REM set LDOPT=-ldflags -Wl,/SUBSYSTEM:console


REM v -cg -showcc -keepc -cc msvc  %COPT% %LDOPT% %FN%
v -cg -showcc -keepc -cc msvc -prod %COPT% %LDOPT% %FN%

REM v -cg -showcc -keepc -cc gcc %COPT% %LDOPT% %FN%
REM v -cg -showcc -keepc -cc gcc -prod %COPT% %LDOPT% %FN%

REM v -cg -showcc -keepc -cc clang %COPT% %LDOPT% %FN%
REM v -cg -showcc -keepc -cc clang -prod %COPT% %LDOPT% %FN%


endlocal

REM vim: ft=dosbatch ff=dos
