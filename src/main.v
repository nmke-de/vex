module main

import net
import os

fn main() {
	mut connection := net.dial_tcp('${os.args[1]}:1900')!
	path := os.args[2]
	connection.write_string('/${path}\r\n')!
	for line := connection.read_line(); line != ''; line = connection.read_line() {
		println(line)
	}
	connection.close()!
}
