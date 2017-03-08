import sys

from robot.output.console.highlighting import HighlightingStream


class quiet(object):
    ROBOT_LISTENER_API_VERSION = 2
    
    def __init__(self, width=78, colors='AUTO', stderr=None):
        self._stderr = HighlightingStream(stderr or sys.__stderr__,
                                          colors)

    def message(self, msg):
        if msg['level'] in ('WARN', 'ERROR'):
            self._stderr.error(msg['message'], msg['level'])
