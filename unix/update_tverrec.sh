#!/bin/bash

###################################################################################
#  TVerRec : TVerダウンローダ
#
#		TVerRec自動アップデート処理スクリプト
#
#	Copyright (c) 2022 dongaba
#
#	Licensed under the MIT License;
#	Permission is hereby granted, free of charge, to any person obtaining a copy
#	of this software and associated documentation files (the "Software"), to deal
#	in the Software without restriction, including without limitation the rights
#	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#	copies of the Software, and to permit persons to whom the Software is
#	furnished to do so, subject to the following conditions:
#
#	The above copyright notice and this permission notice shall be included in
#	all copies or substantial portions of the Software.
#
#	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#	THE SOFTWARE.
#
###################################################################################

echo -en "\033];TVerRec Updater\007"

pwsh -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dongaba/TVerRec/master/src/functions/update_tverrec.ps1' -OutFile '..\src\functions\update_tverrec.ps1'"
pwsh -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dongaba/TVerRec/master/unix/update_tverrec.sh' -OutFile '../unix/update_tverrec.sh'"
pwsh -NoProfile -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dongaba/TVerRec/master/win/update_tverrec.cmd' -OutFile '../win/update_tverrec.cmd'"


pwsh -NoProfile "../src/functions/update_tverrec.ps1"

echo "Finished ..."
