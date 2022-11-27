OutFile "regame.exe"

InstallDir $PROGRAMFILES64\regame

; page order
Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

; global constants
!define SOURCE_DIR "windows-x64"

Function IncludeFFmpeg
	FILE ${SOURCE_DIR}\avcodec-59.dll
	FILE ${SOURCE_DIR}\avdevice-59.dll
	FILE ${SOURCE_DIR}\avfilter-8.dll
	FILE ${SOURCE_DIR}\avformat-59.dll
	FILE ${SOURCE_DIR}\avutil-57.dll
	FILE ${SOURCE_DIR}\postproc-56.dll
	FILE ${SOURCE_DIR}\swresample-4.dll
	FILE ${SOURCE_DIR}\swscale-6.dll
FunctionEnd

Section

	SetOutPath $INSTDIR

	; cgc
	FILE ${SOURCE_DIR}\cgc.exe
	FILE ${SOURCE_DIR}\SDL2.dll
	; cge
	FILE ${SOURCE_DIR}\cge.exe
	; cgh
	FILE ${SOURCE_DIR}\cgi.exe
	FILE ${SOURCE_DIR}\captureyuv.dll
	FILE ${SOURCE_DIR}\EasyHook.dll
	; ffmpeg
	Call IncludeFFmpeg
	; extra
	FILE ${SOURCE_DIR}\video_source.exe

	WriteUninstaller $INSTDIR\uninstaller.exe

SectionEnd

Section "Uninstall"

	RMDir /r /REBOOTOK $INSTDIR

SectionEnd
