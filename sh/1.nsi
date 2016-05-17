; David Pi
; PortableAppC.com
; **************************************************************************
; === 定义变量 ===
; **************************************************************************
	!define VER 		"1.5.29599.0" 			; launcher 的版本
	!define APPNAME 	"PotPlayer" 			; 程序全名
	!define APP 		"PotPlayer" 			; 程序短名称（不带空格）
	!define APPEXE 		"PotPlayerMini.exe" 	; 主程序
	!define APPDIR 		"App\PotPlayer"			 ; 主程序路径
	!define APPSWITCH 	``						 ; 默认运行参数
;--- 声明注册表 ---
	!define REGKEY1 "HKEY_CURRENT_USER\Software\Daum"
	;其实对于 PotPlayer Portable 的制作并不需要修改注册表，作为示例而加上。
; ---声明目录 ---
	!define LOCALDIR1 "$EXEDIR\App\PotPlayer\Capture"
	!define PORTABLEDIR1 "$EXEDIR\Data\Capture"
	; 截图目录，保存到Data\
	!define LOCALDIR2 "$EXEDIR\App\PotPlayer\log"
	; 日志目录，结束后清除
	!define LOCALDIR3 "$EXEDIR\App\PotPlayer\Playlist"
	!define PORTABLEDIR3 "$EXEDIR\Data\Playlist"
	; 播放列表，保存到Data\
; ---声明文件 ---
	!define LOCALFILE1 "$EXEDIR\App\PotPlayer\PotPlayerMini.ini" 		;运行时位置
	!define PORTABLEFILE1 "$EXEDIR\Data\settings\PotPlayerMini.ini" 	;关闭后保存位置
	!define DEFAULTFILE1 "$EXEDIR\App\DefaultData\PotPlayerMini.ini" 	;默认设置
	!define STATUS "$EXEDIR\Data\settings\${APP}Portable-RunningStatus.ini" ;这个文件，是判断便携软件是否正在运行、以及上一次是否正常退出的依据。
; **************************************************************************
; === 压缩选项 ===
; **************************************************************************
SetCompressor /SOLID lzma
SetCompressorDictSize 32
; **************************************************************************
; === 基本信息 ===
; **************************************************************************
Name "${APPNAME} Portable"
OutFile "..\${APP}Portable.exe"
Icon "..\App\Appinfo\AppIcon.ico"
; **************************************************************************
; === 版本信息 ===
; **************************************************************************
Caption "${APPNAME} Portable"
VIProductVersion "${VER}"
VIAddVersionKey ProductName "${APPNAME} Portable"
VIAddVersionKey Comments "Allows ${APPNAME} to be run from a removable drive."
VIAddVersionKey CompanyName "PortableAppC.com"
VIAddVersionKey LegalCopyright "David Pi"
VIAddVersionKey FileDescription "${APPNAME} Portable"
VIAddVersionKey FileVersion "${VER}"
VIAddVersionKey ProductVersion "${VER}"
VIAddVersionKey InternalName "${APPNAME} Portable"
VIAddVersionKey LegalTrademarks ""
VIAddVersionKey OriginalFilename "${APP}Portable.exe"
; **************************************************************************
; === 头文件 ===
; **************************************************************************
!include "LogicLib.nsh"
!include "Registry.nsh"
!include "TextFunc.nsh"
!insertmacro GetParameters
; **************************************************************************
; === 其它运行选项 ===
; **************************************************************************
WindowIcon Off
SilentInstall Silent
AutoCloseWindow True
RequestExecutionLevel user
; **************************************************************************
; ==== 运行 ====
; **************************************************************************
Section "Main"
;CheckDirExe:
	IfFileExists "$EXEDIR\${APPDIR}\${APPEXE}" +3
	MessageBox MB_OK|MB_ICONEXCLAMATION `${APPNAME} Portable无法启动，请重新安装${APPNAME} Portable。$\n错误：找不到$EXEDIR\${APPDIR}\${APPEXE}。`
	Abort
;CheckRunExe:
	FindProcDLL::FindProc "${APPEXE}"
		${If} $R0 == "0"
			Goto CheckGoodExit ;无第二实例，正常启动
		${Else}
			MessageBox MB_OK|MB_IconStop "另一个${APPNAME}正在运行，请在执行${APPNAME} Portable前关闭${APPNAME}！"
			Abort
		${Endif}
CheckGoodExit:
	IfFileExists "${STATUS}" 0 SplashLogo ;假如正常退出，此文件不应该存在
	MessageBox MB_OK|MB_ICONEXCLAMATION `上一次${APPNAME} Portable在本机结束时未能执行数据恢复，现在将执行恢复并重新启动。`
	Call Restore
SplashLogo:
	ReadINIStr $0 "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "DisableSplashScreen"
	StrCmp $0 "true" Backup
	WriteINIStr "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "DisableSplashScreen" "false"
	InitPluginsDir
	File /oname=$PLUGINSDIR\splash.bmp "Splash.bmp"
	newadvsplash::show /NOUNLOAD 1000 300 200 1 /L $PLUGINSDIR\splash.bmp
Backup:
	CreateDirectory "$EXEDIR\Data\settings"
	WriteINIStr "${STATUS}" "${APP}Portable" "DeadInPeace" "false" ;写入状态文件
	;备份本地注册表:
		{registry::DeleteKey} "${REGKEY1}-BackupBy${APP}Portable" $R0
		${registry::MoveKey} "${REGKEY1}" "${REGKEY1}-BackupBy${APP}Portable" $R0
		Sleep 50
	;恢复便携软件注册表:
		${registry::RestoreKey} "$EXEDIR\Data\settings\${APP}.reg" $R0
		Sleep 50
	;清扫工作，假如用户直接运行了App\PotPlayer中的程序，就会生成这些文件，影响后面的工作:
		RMDir /r ${LOCALDIR1}
		RMDir /r ${LOCALDIR2}
		RMDir /r ${LOCALDIR3}
		Delete ${LOCALFILE1}
	;恢复本地文件:
		IfFileExists "${PORTABLEFILE1}" +2
		CopyFiles /silent "${DEFAULTFILE1}" "$EXEDIR\Data\settings\" ;首次运行时，复制默认配置
		Rename "${PORTABLEDIR1}" "${LOCALDIR1}"
		Rename "${PORTABLEDIR3}" "${LOCALDIR3}"
		Rename "${PORTABLEFILE1}" "${LOCALFILE1}" ;将用户配置移动到程序目录中去
;启动主程序:
	SetOutPath "$EXEDIR\${APPDIR}"
	${GetParameters} $R0
	ExecWait `"$EXEDIR\${APPDIR}\${APPEXE}"${APPSWITCH} $R0` ；等待程序结束
;程序结束，开始恢复
	Call Restore
End:
	${registry::Unload}
	newadvsplash::stop /WAIT
SectionEnd
Function Restore
;导出注册表：
	Delete "$EXEDIR\Data\settings\${APP}.reg"
	CreateDirectory "$EXEDIR\Data\settings"
	{registry::SaveKey} "${REGKEY1}" "$EXEDIR\Data\settings\${APP}.reg" "/A=1" $R0
;恢复注册表:
	${registry::DeleteKey} "${REGKEY1}" $R0
	${registry::MoveKey} "${REGKEY1}-BackupBy${APP}Portable" "${REGKEY1}" $R0
	${registry::DeleteKeyEmpty} "${REGKEY1}" $R0
;备份用户配置:
	RMDir /r "${PORTABLEDIR1}"
	Rename "${LOCALDIR1}" "${PORTABLEDIR1}"
	RMDir /r "${PORTABLEDIR3}"
	Rename "${LOCALDIR3}" "${PORTABLEDIR3}"
	RMDir /r "${PORTABLEFILE1}"
	Rename "${LOCALFILE1}" "${PORTABLEFILE1}"
	RMDir /r "${LOCALDIR2}" ;清除Log文件
	Delete "${STATUS}" ;正常退出,删除状态文件
FunctionEnd
