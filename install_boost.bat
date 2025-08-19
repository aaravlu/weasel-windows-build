setlocal

if not defined RIME_ROOT set RIME_ROOT=%CD%

set boost_version=1.84.0
set boost_x_y_z=%boost_version:.=_%

set BOOST_ROOT=%RIME_ROOT%\deps\boost_%boost_x_y_z%

if exist "%BOOST_ROOT%\boost" goto boost_found
for %%I in ("%BOOST_ROOT%\.") do set src_dir=%%~dpI
rem download boost source
aria2c https://archives.boost.io/release/1.84.0/source/boost_1_84_0.7z -d %src_dir%
pushd %src_dir%
7z x boost_%boost_x_y_z%.7z
popd
:boost_found

call .\build.bat boost
