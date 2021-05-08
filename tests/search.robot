* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session

Test Teardown   Take Screenshot

* Test Cases *

Should find only one restaurant when searching by name
    Go To restaurants
    Search by  Debuger
    Restaurant Should be Visible  DEBUGER KING
    Restaurant Count Should be  1

Should search for category
    Go To restaurants
    Search by  Cafe
    Restaurant Should be Visible  STARBUGS COFFEE
    Restaurant Count Should be  1

Should find all the restaurants
    Go To restaurants
    Search by  a
    Restaurant Count Should be  5