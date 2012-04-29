on run sketchName
	tell application "Processing" to activate
	
	tell application "System Events" to tell process "Processing"
		set l to title of every window
		set qt to true
		repeat with name in l
			if name contains sketchName then
				set qt to false
			end if
		end repeat
		
		if qt is true then
			return
		end if
		
		repeat
			set t to title in every window
			set ta to item 1 of t
			if ta contains sketchName then
				keystroke "r" using {command down}
				exit repeat
			else
				keystroke "`" using command down
			end if
		end repeat
		
	end tell
	
end run
