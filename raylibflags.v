module raylib

$if !windows {
	$compile_error('Unsupported OS.')
}

$if tinyc {
	$compile_error('TCC is unsupported.')
}

#preinclude "@VMODROOT/pre.h"

#include "@VMODROOT/thirdparty/raylib/src/raylib.h"

#flag -DPLATFORM_DESKTOP

#flag -I @VMODROOT/thirdparty/raylib/src/external/glfw/include

// #flag -fno-lto -l -fno-lto

#flag @VMODROOT/thirdparty/raylib/src/raudio.o
#flag @VMODROOT/thirdparty/raylib/src/rcore.o
#flag @VMODROOT/thirdparty/raylib/src/rmodels.o
#flag @VMODROOT/thirdparty/raylib/src/rshapes.o
#flag @VMODROOT/thirdparty/raylib/src/rtext.o
#flag @VMODROOT/thirdparty/raylib/src/rtextures.o
#flag @VMODROOT/thirdparty/raylib/src/utils.o
#flag @VMODROOT/thirdparty/raylib/src/rglfw.o

// #flag -lgdi32 -lwinmm
// -lopengl32 -luser32 -lwinmm

// #flag -I @VMODROOT/include

$if msvc {
	// #flag -L @VMODROOT/lib/windows/msvc16
	#flag raylib.lib user32.lib shell32.lib gdi32.lib winmm.lib
}

$if gcc {
	#flag -I @VMODROOT/thirdparty/raylib/src/external/glfw/deps/mingw
	// #flag -L @VMODROOT/lib/windows/mingw-w64
	// #flag -lraylib@START_LIBS -lgdi32 -lwinmm
	#flag -lgdi32 -lwinmm -lopengl32

	$if prod && !debug {
		#flag -fno-lto
		#flag -mwindows
	}
}
