within Tests;
function testsuite
  "Executing all tests in this package. If input reportname is given, a report is generate in a corresponding file (otherwise output is streamed to console)."

  input String reportname = "";

algorithm

  Modelica.Utilities.Streams.print("\nTest results for library dateutil:\n",reportname);

  test_is_leapyear(reportname);

end testsuite;
