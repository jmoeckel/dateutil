within Tests;
function testsuite
  "Executing all tests in this package. If input reportname is given, a report is generate in a corresponding file (otherwise output is streamed to console)."

  input String reportname = "";

algorithm

  Modelica.Utilities.Streams.print("\nTest results for library dateutil:\n",reportname);

  test_is_leapyear(reportname);
  test_get_time(reportname);


  //Clean Up

  Modelica.Utilities.Files.removeFile("dslog.txt");
  Modelica.Utilities.Files.removeFile("empty.txt");
  Modelica.Utilities.Files.removeFile("status");
  Modelica.Utilities.Files.removeFile("request");
  Modelica.Utilities.Files.removeFile("funcin.mat");
  Modelica.Utilities.Files.removeFile("funcout.mat");
  Modelica.Utilities.Files.removeFile("dsin.txt");

end testsuite;
