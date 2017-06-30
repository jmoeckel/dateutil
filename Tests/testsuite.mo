within Tests;
function testsuite
  "Executing all tests in this package. If parameter report is set to true, a report is generate in form of a textfile"

  input String reportname = "";

algorithm

  Modelica.Utilities.Streams.print("\nTest results for library dateutil:\n",reportname);

  test_is_leapyear(reportname);

end testsuite;
