



class xxx2(object):
    ROBOT_LISTENER_API_VERSION = 2
    
    def __init__(self, width=78, colors='AUTO', markers='AUTO', stdout=None,
                 stderr=None):
        pass

    def __getattr__(self, name):
        if name.endswith("_file"):
            return self.generic_file
        elif name.endswith("_imported"):
            return self.generic_imported

    def start_suite(self, suite, attrs):
        print('SS', suite, attrs)

    def end_suite(self, suite, attrs):
        print('ES', suite, attrs)

    def start_test(self, test, attrs):
        print('ST', test, attrs)

    def end_test(self, test, attrs):
        print('ET', test, attrs)

    def start_keyword(self, kw, attrs):
        print('SK', kw, attrs)

    def end_keyword(self, kw, attrs):
        print('EK', kw, attrs)

    def message(self, msg):
        print('MM', msg, type(msg))

    def generic_file(self, path):
        print('GF', path)

    def generic_imported(self, path):
        print('GI', path)
