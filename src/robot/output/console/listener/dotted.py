import sys

from robot.model import SuiteVisitor
from robot.utils import plural_or_not, secs_to_timestr

from robot.output.console.highlighting import HighlightingStream


class dotted(object):
    ROBOT_LISTENER_API_VERSION = 2
    
    def __init__(self, width=78, colors='AUTO', stdout=None, stderr=None):
        self._width = width
        self._stdout = HighlightingStream(stdout or sys.__stdout__,
                                          colors)
        self._stderr = HighlightingStream(stderr or sys.__stderr__,
                                          colors)
        self._markers_on_row = 0
        self._later_messages = []

    def __getattr__(self, name):
        if name.endswith("_file"):
            new_name = name[0].upper() + name[1:-5]
            return lambda (path): self.generic_file(new_name, path)

    def start_suite(self, suite, attrs):
        self._stdout.write("Running suite '%s' with %d tests.\n"
                           % (suite, attrs['totaltests']))
        self._stdout.write('=' * self._width + '\n')
        self._later_messages = []

    def end_test(self, test, attrs):
        if self._markers_on_row == self._width:
            self._stdout.write('\n')
            self._markers_on_row = 0
        self._markers_on_row += 1
        if attrs['status'] == 'PASS':
            self._stdout.write('.')
        elif 'robot-exit' in attrs['tags']:
            self._stdout.write('x')
        else:
            if attrs['critical'] != 'yes':
                self._stdout.write('f')
            else:
                self._stdout.highlight('F', 'FAIL')
            text_message = ': %s\n%s\n' % (attrs['longname'],
                                           attrs['message'].strip())
            self._later_messages.append(text_message)

    def end_suite(self, suite, attrs):
        self._stdout.write('\n')
        for msg in self._later_messages:
            self._stdout.write('-' * self._width + '\n')
            self._stdout.highlight('FAIL')
            self._stdout.write(msg)
        self._stdout.write("%s\nRun suite '%s' with %d test%s in %s.\n\n"
                           % ('=' * self._width, suite,
                              attrs['totaltests'],
                              plural_or_not(attrs['totaltests']),
                              secs_to_timestr(attrs['elapsedtime']/1000.0)))
        self._stdout.highlight(attrs['status'] + 'ED', attrs['status'])
        self._stdout.write('\n%s\n' % attrs['statistics'])
        self._stdout.write('\n')

    def message(self, msg):
        if msg['level'] in ('WARN', 'ERROR'):
            self._stderr.error(msg['message'], msg['level'])

    def generic_file(self, name, path):
        self._stdout.write('%-8s %s\n' % (name+':', path))
