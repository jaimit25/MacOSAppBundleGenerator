rm main
g++ *.cpp `fltk-config --use-forms --use-gl --use-images --ldstaticflags --cxxflags` main