module main

import os
import nex

fn main() {
	url := os.args[1] or { 'localhost/' }
	noscheme := url.after('nex://')
	targethost := noscheme.before('/')
	mut path := '/'
	if noscheme.contains('/') {
		path = noscheme.after_char(`/`)
	}
	println(nex.dial(targethost, path) or { 'Vex failed to dial ${url}.' })
}
