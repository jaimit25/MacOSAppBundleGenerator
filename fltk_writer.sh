#!/bin/bash


# //checking if wxmac is installed or not
isPackageNotInstalled() {

    dpkg --status wxmac &> /dev/null
    if [ $1 -eq 0 ]; then
    echo "wxmac : Already installed "
    else
    echo "Please install wxmac from brew using 'brew install wxmac'"
    brew install $1
    fi
    }

isPackageNotInstalled wxmac


 echo "Enter Project Name : "  
 read mssg 
 # echo "$mssg"

 curd=$(pwd) 

 if [ -z "$mssg" ] 
 then  
     echo "Project Name Cannot be Empty"  
 else 

   # Creating a Main Bundle folder
    mkdir "/Users/$(whoami)/Desktop/Developer" 
    mkdir "/Users/$(whoami)/Desktop/Developer/$mssg.app"
    cd "/Users/$(whoami)/Desktop/Developer/$mssg.app" # Created Bundle Directory
    # echo "$(pwd) Path updated"

    # Going to Content/Root folder
    mkdir Contents 
    cd Contents


    # Setting up all directory
    mkdir MacOS
    mkdir Resources
    mkdir Library
    touch Info.plist


    echo "$curd/Icon.png"
    cp "$curd/Icon.png" "/Users/$(whoami)/Desktop/Developer/$mssg.app/Contents/Resources"

    cd "/Users/$(whoami)/Desktop/Developer/$mssg.app/Contents"
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
  
  <key>CFBundleName</key>
  <string>$mssg</string>
    
  <key>CFBundleExecutable</key>
  <string>main</string>
  
  <key>CFBundleIconFile</key>
  <string>Icon.png</string>

  <!-- <key>CFBundleDocumentTypes</key>
  <array>
      <dict>
          <key>CFBundleTypeName</key>
          <string></string>
      </dict>
  </array> -->
  
</dict>
</plist>" >> Info.plist
   
 cd $curd/exeFile
#  clang main.cpp -o main
  g++ *.cpp `fltk-config --use-forms --use-gl --use-images --ldstaticflags --cxxflags` -o main
 mv main "/Users/$(whoami)/Desktop/Developer/$mssg.app/Contents/MacOS"
 echo "Bundle path is (Dont Update the Developer Folder Path) : /Users/$(whoami)/Desktop/Developer/"


echo "Project Set Up Completed Enjoy ;)"
 fi    





