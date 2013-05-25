clear all; close all; clc;

include = '-I"C:\Program Files (x86)\AMD APP\include"';
lib = '-lOpenCL -L"C:\Program Files (x86)\AMD APP\lib\x86_64"';
compile = 'COMPFLAGS="$COMPFLAGS /MD /Qopenmp /O2"';
link = 'LINKFLAGS="$LINKFLAGS /MACHINE:X64"';

parameters = [ ...
    tokenize(include) ...
    tokenize(lib) ...
    tokenize(compile) ...
    tokenize(link)];

mexCreateLdpcDec = [ ...
    parameters ...
    cellstr('cpp\mexCreateLdpcDec.cpp') ...
    cellstr('cpp\clLDPCdec.cpp') ...
    cellstr('cpp\clException.cpp') ...
    cellstr('cpp\Util.cpp')];
mex(mexCreateLdpcDec{:});

mexDestroyLdpcDec = [ ...
    parameters ...
    cellstr('cpp\mexDestroyLdpcDec.cpp') ...
    cellstr('cpp\clLDPCdec.cpp') ...
    cellstr('cpp\clException.cpp')];
mex(mexDestroyLdpcDec{:});

mexDecodeLdpc = [ ...
    parameters ...
    cellstr('cpp\mexDecodeLdpc.cpp') ...
    cellstr('cpp\clLDPCdec.cpp') ...
    cellstr('cpp\clException.cpp')];
mex(mexDecodeLdpc{:});

% mex -I"C:\Program Files (x86)\AMD APP\include" ...
%     -lOpenCL -L"C:\Program Files (x86)\AMD APP\lib\x86_64" ...
%     COMPFLAGS="$COMPFLAGS /MD /Qopenmp /O2" ...
%     LINKFLAGS="$LINKFLAGS /MACHINE:X64" ...
%     cpp\mexCreateLdpcDec.cpp cpp\clLDPCdec.cpp cpp\clException.cpp cpp\Util.cpp
    
% mex -I"C:\Program Files (x86)\AMD APP\include" ...
%     -lOpenCL -L"C:\Program Files (x86)\AMD APP\lib\x86_64" ...
%     COMPFLAGS="$COMPFLAGS /MD /Qopenmp /O2" ...
%     LINKFLAGS="$LINKFLAGS /MACHINE:X64" ...
%     cpp\mexDestroyLdpcDec.cpp cpp\clLDPCdec.cpp cpp\clException.cpp cpp\Util.cpp

% mex -I"C:\Program Files (x86)\AMD APP\include" ...
%     -lOpenCL -L"C:\Program Files (x86)\AMD APP\lib\x86_64" ...
%     COMPFLAGS="$COMPFLAGS /MD /Qopenmp /O2" ...
%     LINKFLAGS="$LINKFLAGS /MACHINE:X64" ...
%     cpp\mexDecodeLdpc.cpp cpp\clLDPCdec.cpp cpp\clException.cpp cpp\Util.cpp