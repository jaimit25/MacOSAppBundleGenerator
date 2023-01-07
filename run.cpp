
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <string>

using namespace std;

int main(int argc, char *argv[]) {

  // getting Builder Directory Path
  string s1(argv[0]);
  string curr_directory = s1.substr(0, s1.find_last_of("\\/"));

  // Reading the first line of the file from the path to interpret which command
  // line "shellscript" to use to compile the file in exePath.
  ifstream infile(curr_directory + "/exeFile/hello.cpp"); // Open input file
  string lineData = "";

  getline(infile, lineData); // Get first line. 
  if (lineData == "//fltk") {
    system("bash fltk_writer.sh");
    cout << "fltk" << endl;
  } else if (lineData == "//wx") {
    system("bash wx_writer.sh");
    cout << "wx" << endl;
  } else {
    system("bash writer.sh");
    cout << "Others" << endl;
  }
  system("rm run");
  return 0;
}