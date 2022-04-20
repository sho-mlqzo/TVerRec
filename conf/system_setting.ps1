###################################################################################
#  TVerRec : TVerビデオダウンローダ
#
#		システム設定
#
#	Copyright (c) 2022 dongaba
#
#	Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#
#		http://www.apache.org/licenses/LICENSE-2.0
#
#	Unless required by applicable law or agreed to in writing, software
#	distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#	See the License for the specific language governing permissions and
#	limitations under the License.
#
###################################################################################
#----------------------------------------------------------------------
#	「#」or「;」でコメントアウト
#	このファイルに書かれた内容はそのままPowershellスクリプトとして実行。
#----------------------------------------------------------------------

#アプリケーションバージョン番号
$script:appVersion = Get-Content '..\VERSION'

#Windowsの判定
Set-StrictMode -Off
$script:isWin = $PSVersionTable.Platform -match '^($|(Microsoft)?Win)'
Set-StrictMode -Version Latest

#デバッグレベル
$VerbosePreference = 'SilentlyContinue'						#詳細メッセージなし
$DebugPreference = 'SilentlyContinue'						#デバッグメッセージなし

#ファイルシステムが許容するファイル名の最大長(byte)
$script:fileNameLengthMax = 255

#各種ディレクトリのパス
$script:binDir = Convert-Path $(Join-Path $scriptRoot '..\bin')
$script:dbDir = Convert-Path $(Join-Path $scriptRoot '..\db')

#ダウンロード対象ジャンルリストのパス
$script:keywordFilePath = Convert-Path $(Join-Path $script:confDir 'keyword.conf')

#ダウンロード対象外ビデオリストのパス
$script:ignoreFilePath = Convert-Path $(Join-Path $script:confDir 'ignore.conf')

#ダウンロードリストのパス
$script:listFilePath = Convert-Path $(Join-Path $script:dbDir 'tver.csv')
$script:lockFilePath = Convert-Path $(Join-Path $script:dbDir 'tver.lock')

#ffpmegで動画検証時のエラーファイルのパス
$script:ffpmegErrorLogPath = $(Join-Path $script:dbDir "ffmpeg_error_$($PID).log")

#youtube-dlのパス
if ($script:isWin) { $script:ytdlPath = Convert-Path $(Join-Path $script:binDir 'youtube-dl.exe') }
else { $script:ytdlPath = Convert-Path $(Join-Path $script:binDir 'youtube-dl') }


#ffmpegのパス
if ($script:isWin) { $script:ffmpegPath = Convert-Path $(Join-Path $script:binDir 'ffmpeg.exe') }
else { $script:ffmpegPath = Convert-Path $(Join-Path $script:binDir 'ffmpeg') }


#プログレスバーの表示形式
#$PSStyle.Progress.View = 'Classic'
if ($PSVersionTable.PSEdition -ne 'Desktop') {
	$PSStyle.Progress.MaxWidth = 70
	$PSStyle.Progress.Style = "`e[38;5;123m"
}
$progressPreference = 'silentlyContinue'