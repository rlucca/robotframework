class verbose(object):
    ROBOT_LISTENER_API_VERSION = 2
"""    
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
"""
"""
[ ERROR ] Error in file '/home/rlucca/Git/robotFrameworkSmoke/markers.robot': Non-existing setting 'Non Existing'.
==============================================================================
Markers                                                                       
==============================================================================
Few Pass Markers                                                      | PASS |
------------------------------------------------------------------------------
Few Pass And Fail Markers                                             | FAIL |
AssertionError
------------------------------------------------------------------------------
More Markers Than Fit Into Status Area During Very Deep Keyword       | PASS |
------------------------------------------------------------------------------
[ WARN ] Warning                                                              
Warnings Are Shown Correctly                                          | PASS |
------------------------------------------------------------------------------
Just another Fail                                                     | FAIL |
AssertionError
------------------------------------------------------------------------------
Markers                                                               | FAIL |
5 critical tests, 3 passed, 2 failed
5 tests total, 3 passed, 2 failed
==============================================================================
Output:  /home/rlucca/Git/robotframework/output.xml
Log:     /home/rlucca/Git/robotframework/log.html
Report:  /home/rlucca/Git/robotframework/report.html
"""
