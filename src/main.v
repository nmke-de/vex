module main

import net
import os
import io

fn main() {
	targethost := os.args[1] or {'localhost'}
	mut connection := net.dial_tcp('${targethost}:1900')!
	path := os.args[2] or {'/'}
	connection.write_string('${path}\r\n')!
	result := io.read_all(reader: connection)!
	println(result.bytestr())
	connection.close()!
}
