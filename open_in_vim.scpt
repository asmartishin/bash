on run {input, parameters}
	set the_path to POSIX path of input
	set cmd to "vim " & the_path
	tell application "System Events" to set terminalIsRunning to exists application process "Terminal"
	tell application "Terminal"
		activate
		if terminalIsRunning is true then
			delay 1
			tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
			do script with command cmd in window 1
		else
			do script with command cmd in window 1
		end if
	end tell
end run
