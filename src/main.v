module main

import os
import nex

fn main() {
	targethost := os.args[1] or { 'localhost' }
	path := os.args[2] or { '/' }
	println(nex.dial(targethost, path)!)
}
