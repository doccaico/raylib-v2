module raylib

$if !windows {
	$compile_error('Unsupported OS.')
}

$if tinyc {
	$compile_error('TCC is unsupported.')
}

#preinclude "@VMODROOT/include/pre.h"

#include "@VMODROOT/thirdparty/raylib/src/raylib.h"

#flag -DPLATFORM_DESKTOP

#flag -I @VMODROOT/thirdparty/raylib/src/external/glfw/include

#flag @VMODROOT/thirdparty/raylib/src/raudio.o
#flag @VMODROOT/thirdparty/raylib/src/rcore.o
#flag @VMODROOT/thirdparty/raylib/src/rmodels.o
#flag @VMODROOT/thirdparty/raylib/src/rshapes.o
#flag @VMODROOT/thirdparty/raylib/src/rtext.o
#flag @VMODROOT/thirdparty/raylib/src/rtextures.o
#flag @VMODROOT/thirdparty/raylib/src/utils.o
#flag @VMODROOT/thirdparty/raylib/src/rglfw.o

$if msvc {
	#flag user32.lib shell32.lib gdi32.lib winmm.lib
}

$if gcc {
	#flag -lgdi32 -lwinmm -lopengl32

	$if prod {
		#flag -s
		#flag -mwindows
	}
}

$if clang {
	// #flag -D_CRT_SECURE_NO_WARNINGS
	// #flag -Wl,-SUBSYSTEM,console

	// #flag -lgdi32 -lwinmm -lshell32 -lopengl32
	#flag -lgdi32 -lwinmm -lopengl32

	$if prod {
		#flag -s
		#flag -mwindows
	}
}
