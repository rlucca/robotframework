*** Settings ***
Resource       console_resource.robot
Suite Setup    Run Tests Without Processing Output   --verbositylevel 2 --consolemarkers on    ${TEST FILE}

*** Variables ***
${TEST FILE}    cli/console/verbose_markers.robot
${SEPARATOR}    -
${KW CONTINUE}  BuiltIn.Run Keyword And Continue On Failure
${KW NOOP}      BuiltIn.No Operation
${KW FAIL}      BuiltIn.Fail
${KW LOG}      BuiltIn.Log

*** Test Cases ***
Few Pass Markers
    Check Stdout Contains    SEPARATOR=
    ...    ${TESTNAME}${SPACE * 54}\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    \r${SPACE * 78}\r
    ...    ${TESTNAME}${SPACE * 54}| PASS |\n

Few Pass And Fail Markers
    Check Stdout Contains    SEPARATOR=
    ...    ${TESTNAME}${SPACE * 45}\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW CONTINUE}${SPACE * 2}Fail${SPACE * 17}\n
    ...    ${SPACE * 8}${KW FAIL}${SPACE * 50}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW FAIL}${SPACE * 50}| FAIL |\n
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW CONTINUE}${SPACE * 2}Fail${SPACE * 17}| FAIL |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW CONTINUE}${SPACE * 2}Fail${SPACE * 17}\n
    ...    ${SPACE * 8}${KW FAIL}${SPACE * 50}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW FAIL}${SPACE * 50}| FAIL |\n
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW CONTINUE}${SPACE * 2}Fail${SPACE * 17}| FAIL |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    \r${SPACE * 78}\r
    ...    ${TESTNAME}${SPACE * 45}| FAIL |\n
    ...    Several failures occurred:\n\n
    ...    1) AssertionError\n\n
    ...    2) AssertionError\n

More Markers Than Fit Into Status Area During Very Deep Keyword
    Check Stdout Contains    SEPARATOR=
    ...    ${TESTNAME}${SPACE * 7}\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}KeywordLevel1${SPACE * 53}\n
    ...    ${SPACE * 8}KeywordLevel2${SPACE * 49}........
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}KeywordLevel2${SPACE * 49}........
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}KeywordLevel2${SPACE * 49}.....
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}KeywordLevel2${SPACE * 49}| PASS |\n
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}KeywordLevel1${SPACE * 53}| PASS |\n
    ...    ${SPACE * 4}KeywordLevel11${SPACE * 52}\n
    ...    ${SPACE * 8}KeywordLevel12${SPACE * 48}........
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}KeywordLevel12${SPACE * 48}...
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}KeywordLevel12${SPACE * 48}| PASS |\n
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}KeywordLevel11${SPACE * 52}| PASS |\n
    ...    ${SPACE * 4}KeywordLevel12${SPACE * 52}\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 8}${KW NOOP}${SPACE * 42}| PASS |\n
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}KeywordLevel12${SPACE * 52}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    \r${SPACE * 78}\r
    ...    ${TESTNAME}${SPACE * 7}| PASS |\n

Warnings Are Shown Correctly
    Check Stdout Contains    SEPARATOR=
    ...    ${TESTNAME}${SPACE * 42}\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW LOG}${SPACE * 2}Warning${SPACE * 2}WARN${SPACE * 40}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW LOG}${SPACE * 2}Warning${SPACE * 2}WARN${SPACE * 40}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW LOG}${SPACE * 2}Warning${SPACE * 2}WARN${SPACE * 40}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}
    ...    \r${SPACE * 78}\r
    ...    ${SPACE * 4}${KW NOOP}${SPACE * 46}| PASS |\n
    ...    \r${SPACE * 78}\r
    ...    ${TESTNAME}${SPACE * 42}| PASS |\n
    Check Stderr Contains    SEPARATOR=\n
    ...    [ WARN ] Warning

Errors Are Shown Correctly
    Check Stderr Contains    [ ERROR ] Error in file

Markers Can Be Disabled
    Run Tests And Verify That Markers Are Disabled    -K OFF

Markers Are Disabled By Default When Redirecting Output
    Run Tests And Verify That Markers Are Disabled    --ConsoleMarkers AuTo

Invalid Markers
    Run Tests Without Processing Output    -K InVaLid    ${TEST FILE}
    Stderr Should Be Equal To    [ ERROR ] Invalid console marker value 'InVaLid'. Available 'AUTO', 'ON' and 'OFF'.${USAGE TIP}\n

Invalid Label Markers
    Run Tests Without Processing Output    --labelmarker InVaLid    ${TEST FILE}
    Stderr Should Be Equal To    [ ERROR ] Invalid label marker value 'InVaLid'. Available 'ALL', 'ARGS', 'LIB' and 'NONE'.${USAGE TIP}\n

Verbosity Level Must Be Integer
    Run Tests Without Processing Output    --verbositylevel Invalid    ${TEST FILE}
    Stderr Should Be Equal To    [ ERROR ] Option '--verbositylevel' expected integer value but got 'Invalid'.${USAGE TIP}\n

Verbosity Level is Disabled When Negative
    Run Tests And Verify That Markers Are Disabled    --verbositylevel=-2

*** Keywords ***
Run Tests And Verify That Markers Are Disabled
    [Arguments]    ${opt}
    Run Tests Without Processing Output    ${opt}    ${TEST FILE}
    Check Stdout Contains    SEPARATOR=\n
    ...    Few Pass Markers${SPACE * 54}| PASS |
    ...    ${SEPARATOR * 78}
    ...    Few Pass And Fail Markers${SPACE * 45}| FAIL |
    ...    Several failures occurred:
    ...    ${EMPTY}
    ...    1) AssertionError
    ...    ${EMPTY}
    ...    2) AssertionError
    ...    ${SEPARATOR * 78}
    ...    More Markers Than Fit Into Status Area During Very Deep Keyword${SPACE * 7}| PASS |
    ...    ${SEPARATOR * 78}
    ...    Warnings Are Shown Correctly${SPACE * 42}| PASS |
