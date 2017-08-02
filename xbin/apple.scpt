-- apple.scpt

-- display dialog "Hello!"
-- do shell script "~/xbin/test.sh"
-- do shell script "/usr/X11/bin/xterm -e /usr/local/bin/xdotool type 'hoge'"
-- do shell script "/usr/X11/bin/xterm -e /usr/local/bin/xdotool mousemove 1000 500"
do shell script "#!/usr/X11/bin/xterm /usr/local/bin/xdotool mousemove 1000 500"

-- use AppleScript version “2.4″
use scripting additions
use framework "Foundation"
use framework "ApplicationServices"
use framework "Quartz"

-- activate application "Finder"
-- set pt to {x:100, y:200}
-- set pt to current application’s CGPointZero
-- set x of pt to newX
-- set y of pt to newY

-- tell current application
-- 	CGPostMouseEvent(pt, 1, 1, 1)
-- 	CGPostMouseEvent(pt, 1, 1, 0)
-- end tell



-- on run argv
--     display dialog "引数だよ " & item 2 of argv & " eof"
-- end run



-- ダウンロードバーを消してくれる AppleScript
-- 
-- -- 現在のタブ位置を取得
-- tell application "Google Chrome" to set activeIndex to get active tab index of window 1
-- 
-- tell application "System Events"
-- 	tell process "Google Chrome"
-- 		-- 「すべてを表示」をクリック
-- 		click at {1290, 745}
-- 		-- ダウンロード履歴タブを閉じる
-- 		tell application "Google Chrome" to close active tab of window 1
-- 	end tell
-- end tell
-- 
-- -- 取得したタブ位置に移動
-- tell application "Google Chrome" to set active tab index of window 1 to activeIndex

