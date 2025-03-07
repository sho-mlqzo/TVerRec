@echo off
rem ###################################################################################
rem #  TVerRec : TVerダウンローダ
rem #
rem #		TVerRec自動アップデート処理スクリプト
rem #
rem #	Copyright (c) 2022 dongaba
rem #
rem #	Licensed under the MIT License;
rem #	Permission is hereby granted, free of charge, to any person obtaining a copy
rem #	of this software and associated documentation files (the "Software"), to deal
rem #	in the Software without restriction, including without limitation the rights
rem #	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
rem #	copies of the Software, and to permit persons to whom the Software is
rem #	furnished to do so, subject to the following conditions:
rem #
rem #	The above copyright notice and this permission notice shall be included in
rem #	all copies or substantial portions of the Software.
rem #
rem #	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem #	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem #	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
rem #	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem #	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
rem #	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
rem #	THE SOFTWARE.
rem #
rem ###################################################################################

rem 文字コードをUTF8に
chcp 65001 > nul

setlocal enabledelayedexpansion
cd /d %~dp0

title TVerRec Updater

where /Q pwsh
if %ERRORLEVEL% neq 0 (goto :INSTALL)

pwsh -NoProfile -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dongaba/TVerRec/master/src/functions/update_tverrec.ps1' -OutFile '..\src\functions\update_tverrec.ps1'"
pwsh -NoProfile -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dongaba/TVerRec/master/unix/update_tverrec.sh' -OutFile '..\unix\update_tverrec.sh'"
pwsh -NoProfile -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dongaba/TVerRec/master/win/update_tverrec.cmd' -OutFile '..\win\update_tverrec.cmd'"

rem Zone Identifierの削除
pwsh -NoProfile -ExecutionPolicy Unrestricted -Command "Get-ChildItem ..\ -Recurse | Unblock-File"

pwsh -NoProfile -ExecutionPolicy Unrestricted "..\src\functions\update_tverrec.ps1"

pause
exit

:INSTALL
	where /Q winget
	if %ERRORLEVEL% neq 0 (goto :NOWINGET)
	echo.
	echo PowerShell Coreをインストールします。インストールしたくない場合はこのままウィンドウを閉じてください。
	echo.
	pause
	winget install --id Microsoft.Powershell --source winget
	echo PowerShell Coreをインストールしました。TVerRecを再実行してください。
	echo.
	pause
	exit

:NOWINGET
	echo.
	echo PowerShell Coreを自動インストールするにはアプリインストーラーをインストールする必要があります。
	echo.
	echo https://apps.microsoft.com/detail/9NBLGGH4NNS1 に移動してアプリインストーラーをインストールしてください。
	echo.
	pause
	exit
