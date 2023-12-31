module main

import os
import nex

fn main() {
	url := os.args[1] or { 'localhost/' }
	noscheme := url.after('nex://')
	targethost := noscheme.before('/')
	path := if noscheme.contains('/') {
		'/' + noscheme.after_char(`/`)
	} else {
		'/'
	}
	println(nex.dial(targethost, path) or { 'Vex failed to dial ${url}.' })
}
