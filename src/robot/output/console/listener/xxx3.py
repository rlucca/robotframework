



class xxx3(object):
    ROBOT_LISTENER_API_VERSION = 3
    
    def __init__(self, width=78, colors='AUTO', markers='AUTO', stdout=None,
                 stderr=None):
        pass

    def __getattr__(self, name):
        if name.endswith("_file"):
            return self.generic_file
        elif name.endswith("_imported"):
            return self.generic_imported
        return super(self, __getattr__)(name)

    def start_suite(self, s, attrs):
        print('SS', s, type(s), attrs, type(attrs))

    def end_suite(self, s, attrs):
        print('ES', s, type(s), attrs, type(attrs))

    def start_test(self, s, attrs):
        print('ST', s, type(s), attrs, type(attrs))

    def end_test(self, s, attrs):
        print('ET', s, type(s), attrs, type(attrs))

    def start_keyword(self, s, attrs):
        print('SK', s, type(s), attrs, type(attrs))

    def end_keyword(self, s, attrs):
        print('EK', s, type(s), attrs, type(attrs))

    def message(self, msg):
        print('MM', msg, type(msg))

    def generic_file(self, path):
        print('GF', path)

    def generic_imported(self, path):
        print('GI', path)
