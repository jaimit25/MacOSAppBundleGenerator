#include<iostream>
using namespace std;
int main()
{
	system("touch /Users/$(whoami)/Desktop/hello.txt");
	return 0;
}