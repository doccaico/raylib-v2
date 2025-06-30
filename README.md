## raylib-v2

**-- Windows Only --**

- cl (Build Tools for Visual Studio 2022)
- gcc and clang ([WinLibs](https://winlibs.com/) (POSIX threads+LLVM/Clang/LLD/LLDB+MinGW-w64 UCRT)

### Install
```sh
$ v install --git https://github.com/doccaico/raylib-v2
```

### Build
```sh
# msvc (debug)
$ v -cc msvc run examples\core_basic_window.v

# msvc (release)
$ v -cc msvc -prod -subsystem windows -cmain wWinMain run examples\core_basic_window.v

# gcc (debug)
$ v -cc gcc run examples\core_basic_window.v

# gcc (release)
$ v -cc gcc -prod run examples\core_basic_window.v

# clang (debug)
$ v -cc clang run examples\core_basic_window.v

# clang (release)
$ v -cc clang -prod run examples\core_basic_window.v
```

### How to use
```v
module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450

	raylib.init_window(screen_width, screen_height, 'raylib [core] example - basic window')
	defer { raylib.close_window() }

	raylib.set_target_fps(60)

	for !raylib.window_should_close() {
		raylib.begin_drawing()

		raylib.clear_background(raylib.raywhite)

		raylib.draw_text('Congrats! You created your first window!', 190, 200, 20, raylib.black)

		raylib.end_drawing()
	}
}
```
