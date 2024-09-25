from pythonosc import dispatcher
from pythonosc import osc_server

# TODO - Set this to $plug_home/vim-tidal-statusline/tmp/tidal_data.txt

def tidal_handler(unused_addr, cycle, cps, bpm):
    # Write the data to a file for Vim to read
    with open('/tmp/tidal_data.txt', 'w') as f:
        f.write(f"{cycle}\n{cps}\n{bpm}")

dispatcher = dispatcher.Dispatcher()
dispatcher.map("/wave", tidal_handler)

# TODO - Identify port that is not used and use that instead, or make this configurable
server = osc_server.ThreadingOSCUDPServer(('127.0.0.1', 6010), dispatcher)
server.serve_forever()
