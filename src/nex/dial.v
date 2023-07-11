module nex

import io
import net

pub fn dial(targethost string, path string) !string {
	mut connection := net.dial_tcp('${targethost}:1900')!
	connection.write_string('${path}\r\n')!
	result := io.read_all(reader: connection)!
	connection.close()!
	return result.bytestr()
}
