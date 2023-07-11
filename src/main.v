module main

import net

fn main() {
	mut connection := net.dial_tcp('localhost:1900')!
	println(connection.read_line())
	connection.close()!
}
