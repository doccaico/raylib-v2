module main

import doccaico.raylib as rl

const screen_width = 800
const screen_height = 450

fn main() {
	rl.init_window(screen_width, screen_height, c'raylib.v [core] example - basic window')
	rl.set_target_fps(60)
	for !rl.window_should_close() {
		rl.begin_drawing()
		rl.clear_background(rl.Color{ r: 245 / 2, g: 245 / 2, b: 245, a: 255 })
		rl.draw_text(c'Congrats! You created your first window in V!', 190, 200, 20, rl.Color{
			r: 0
			g: 0
			b: 0
			a: 255
		})
		rl.end_drawing()
	}
	rl.close_window()
}
