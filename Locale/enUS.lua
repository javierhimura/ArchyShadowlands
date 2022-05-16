local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]
local L = LibStub("AceLocale-3.0"):NewLocale("Archy", "enUS", true, debug)

if not L then
	return
end

L["\"Arrival Distance\""] = true
L["*Interactive tooltip region(s)"] = true
L["%d %ss in your inventory"] = true
L["%d Key stone sockets available"] = true
L["%d yards"] = true
L["Allows Archy to autofill key stones as you receive them for you on the races you specify"] = true
L["Allows you to blacklist races from being used by Archy"] = true
L["Anchor"] = true
L["Announce Nearest Dig Site"] = true
L["Announce in the chat window when an artifact can be solved with fragments"] = true
L["Announce in the chat window when an artifact can be solved with fragments and key stones"] = true
L["Announce when solvable"] = true
L["Announcements Output"] = true
L["Announces the nearest dig site to you"] = true
L["Announces the nearest dig site when it is found"] = true
L["ArchaeologyUI not loaded: %s SolveArtifact hook not installed."] = true
L["ArchaeologyUI not loaded: %s Try opening manually."] = true
L["Archy will not automate dig site tracking on the minimap, world map and battlefield map."] = true -- new 1.8.13
L["Artifact"] = true
L["Artifact Options"] = true
L["Artifact Row Height"] = true
L["Artifacts"] = true
L["Ask for confirmation when your skill nears the cap.  When enabled, no confirmation is needed for Illustrious Archaeologists."] = true
L["Auto Hide in Combat"] = true
L["Auto Hide Archy Frames in Combat"] = true
L["AutoFill Key Stones"] = true
L["AutoLoot Fragments and Key Stones"] = true
L["Available commands are:"] = true
L["BINDING_HEADER_ARCHY"] = "Archy"
L["BINDING_NAME_ARTIFACTS"] = "Toggle Artifacts Panel"
L["BINDING_NAME_DIGSITES"] = "Toggle Dig Sites Panel"
L["BINDING_NAME_OPTIONS"] = "Configure Archy"
L["BINDING_NAME_SOLVE"] = "Solve any artifact"
L["BINDING_NAME_SOLVESTONE"] = "Solve any artifact with key stones"
L["BINDING_NAME_SURVEY"] = "Cast Survey Spell"
L["BINDING_NAME_TOGGLE"] = "Toggle Archy"
L["Background Color"] = true
L["Background Opacity"] = true
L["Background Texture"] = true
L["Blacklist"] = true
L["Blacklist selected race from artifact use"] = true
L["Blacklisted Races"] = true
L["Border Opacity"] = true
L["Border Texture"] = true
L["Bottom Left"] = true
L["Bottom Right"] = true
L["Click to view this artifact"] = true
L["Color Node Icons On Survey"] = true
L["Color Options"] = true
L["Color code the fragment node icon based on the survey distance"] = true
L["Common Artifact Font Color"] = true
L["Completed"] = true
L["Config"] = true
L["Configure artifact row settings"] = true
L["Configure dig site row settings"] = true
L["Configure header bar settings"] = true
L["Confirm solves near skill cap"] = true
L["Control the font size"] = true
L["Control the font size of the artifact name"] = true
L["Control the font size of the artifact text"] = true
L["Control the font size of the dig site name"] = true
L["Control the font size of the dig site text"] = true
L["Control the font size of the fragment progress"] = true
L["Control the font size of the header text"] = true
L["Control the font size of the zone and distance"] = true
L["Control various aspects of LDB tooltip"] = true
L["Control various aspects of Minimap options"] = true
L["Control various aspects of Survey Distance Indicator options"] = true
L["Control various aspects of TomTom integration"] = true
L["Control various aspects of how the Artifacts list is displayed"] = true
L["Control various aspects of how the Dig Site list is displayed"] = true
L["Control various aspects of the Artifact options"] = true
L["Control various aspects of the Dig Site options"] = true
L["Cross"] = true
L["Ctrl Left-Click to open Archy's options"] = true
L["Dig Counter"] = true
L["Dig Site"] = true
L["Dig Site Boundaries"] = true
L["Dig Site Options"] = "Dig Site  Options"
L["Dig Site Row Height"] = true
L["Dig Sites"] = true
L["Digs"] = true
L["Display Options"] = true
L["Double right-click on the screen to cast Survey.  This is experimental and may interfere with other addons with similar functionality when enabled."] = true
L["Enable \"Arrival Distance\""] = true
L["Enable EasyCast"] = true
L["Enable TomTom Crazy Arrow"] = true
L["Enable TomTom integration"] = true
L["Enable the Survey Distance Indicator"] = true
L["Enable the addon to auto-loot fragments and key stones for you."] = true
L["Filter Dig Sites"] = true
L["Filter by Continent"] = true
L["Filter the Artifact list by races on the continent"] = true
L["FIND_COMPLETE_MESSAGE_FORMAT"] = "%s discovered."
L["First Time Color"] = true
L["Font"] = true
L["Font Color"] = true
L["Font Options"] = true
L["Font Outline"] = true
L["Font Shadow"] = true
L["Force a refresh of data"] = true
L["Fragment"] = true
L["Fragment Font Options"] = true
L["Fragment Font Outline"] = true
L["Fragment Font Size"] = true
L["Fragment Type: "] = true
L["Frame Options"] = true
L["General Options"] = true
L["Graphical"] = true
L["Green Distance Radius"] = true
L["Header Background Color"] = true
L["Header Bar Height"] = true
L["Header Settings"] = true
L["Height of the artifact row"] = true
L["Height of the dig site row"] = true
L["Height of the header bar"] = true
L["Hide Minimap Button"] = true
L["Icon to use for the fragment node icon"] = true
L["Include key stones"] = true
L["In stealth mode. Shift-click the button or type /archy stealth if you wanted to show the Artifact and Digsite frames."] = true -- changed 1.8.37
L["Key Stone Font Color"] = true
L["Key Stone Font Options"] = true
L["Key Stones:"] = true
L["Key stone"] = true
L["Keys"] = true
L["Learn Archaeology"] = true
L["Learn Archaeology in your nearest major city!"] = true
L["Left-Click to open artifact in default Archaeology UI"] = true
L["Left-Click to solve without key stones"] = true
L["Left-Click to toggle Archy"] = true
L["Left-Click to view the zone map"] = true
L["Light Blue Dot"] = true
L["List of blacklisted races"] = true
L["Lock Positions"] = true
L["Locked"] = true
L["Locks the windows so they cannot be repositioned by accident"] = true
L["Main Font Options"] = true
L["Manual tracking"] = true -- new 1.8.13
L["Middle-Click to display the Archaeology window"] = true
L["Minimal"] = true
L["Minimal Style Options"] = true
L["Minimap Icon"] = true
L["Minimap Options"] = true
L["Move the slider to adjust the scale of the tooltip."] = true
L["Name Font Outline"] = true
L["Name Font Size"] = true
L["Navigation"] = true
L["Nearest Dig Site is: %s in %s (%.1f yards away)"] = true
L["Nearest only"] = true
L["No artifacts were solvable"] = true
L["Node Icon"] = true
L["Options"] = true
L["Outline"] = true
L["Play a sound when an artifact can be solved with fragments"] = true
L["Play a sound when an artifact can be solved with fragments and key stones"] = true
L["Play a sound when arriving at a waypoint"] = true
L["Play sound when solvable"] = true
L["Profiles"] = true
L["Progress"] = true
L["Progress Bar Color"] = true
L["Progress Bar Texture"] = true
L["Rare Artifact Font Color"] = true
L["Rare Color"] = true
L["Refreshes the Archaeology data"] = true
L["Remove from blacklist"] = true
L["Remove selected race from the blacklist"] = true
L["Reset Positions"] = true
L["Reset the window positions to defaults"] = true
L["Right-Click to blacklist"] = true
L["Right-Click to lock/unlock Archy"] = true
L["Right-Click to remove from blacklist"] = true
L["Right-Click to solve with key stones"] = true
L["Row Settings"] = true
L["Select a race to blacklist"] = true
L["Select races to autofill"] = true
L["Select races to blacklist"] = true
L["Set how large the Artifacts list is"] = true
L["Set how large the Dig Site list is"] = true
L["Set how large the Survey Distance Indicator is"] = true
L["Set how large the green area of the survey distance indicator will use"] = true
L["Set how large the yellow area of the survey distance indicator will use"] = true
L["Set how transparent or opaque the Artifacts list is"] = true
L["Set how transparent or opaque the Dig Site boundaries are"] = true
L["Set how transparent or opaque the Dig Site list is"] = true
L["Set how transparent or opaque the Survey Distance Indicator is"] = true
L["Set how transparent or opaque the background for the Artifacts list is"] = true
L["Set how transparent or opaque the background for the Dig Sites list is"] = true
L["Set how transparent or opaque the border for the Artifacts list is"] = true
L["Set how transparent or opaque the border for the Dig Sites list is"] = true
L["Set the color of the Artifacts list background"] = true
L["Set the color of the Artifacts list header background"] = true
L["Set the color of the Dig Sites list background"] = true
L["Set the color of the Dig Sites list header background"] = true
L["Set the color of the progress bar for artifacts could solve if you attach key stones to them"] = true
L["Set the color of the progress bar for artifacts you are working on"] = true
L["Set the color of the progress bar for artifacts you are working on for the first time"] = true
L["Set the color of the progress bar for artifacts you can solve"] = true
L["Set the color of the progress bar for rare artifacts you are working on"] = true
L["Set the display style of the Dig Sites list."] = true
L["Set the texture used by the frame background"] = true
L["Set the texture used by the frame border"] = true
L["Set the texture used by the progress bars"] = true
L["Shift Left-Click to toggle Archy's on-screen lists"] = true
L["Shift Left-Click to toggle Artifact and Dig Site lists"] = true
L["Show Archaeology Skill"] = true
L["Show Archy"] = true
L["Show Artifacts"] = true
L["Show Crate Button"] = true -- 1.8.36
L["Show Dig Site Boundaries on battlefield map"] = true
L["Show Dig Site Boundaries on minimap"] = true
L["Show Dig Sites"] = true
L["Show Distance"] = true
L["Show Distances"] = true
L["Show Fragment Nodes"] = true
L["Show Lorewalker Items Button"] = true -- 1.8.42
L["Shows Lorewalker Items with the Distance Indicator."] = true -- 1.8.42
L["Show Survey Button"] = true
L["Show Zone"] = true
L["Show only the nearest dig site on the minimap"] = true
L["Show the dig site boundaries on the battlefield map"] = true
L["Show the dig site boundaries on the minimap"] = true
L["Show the locations where you have collected fragments"] = true
L["Show your Archaeology skill on the Artifacts list header"] = true
L["Show your dig sites on the minimap"] = true
L["Shows a Crate button with the Distance Indicator."] = true -- 1.8.36
L["Shows a Survey button with the Distance Indicator."] = true
L["Shows the Options"] = true
L["Shows the configuration window"] = true
L["Size"] = true
L["Sockets"] = true
L["Solvable Color"] = true
L["Solvable With Key Stone Color"] = true
L["Solved Count: %s"] = true
L["Solves the first artifact it finds that it can solve"] = true
L["Solves the first artifact it finds that it can solve (including key stones)"] = true
L["Solving"] = true
L["Sort by distance"] = true
L["Sort the dig sites by your distance to them"] = true
L["Style"] = true
L["Survey"] = true
L["Survey Distance Indicator"] = true
L["Surveys"] = true
L["Surveys:"] = true
L["The color of the artifact text"] = true
L["The color of the common artifact text"] = true
L["The color of the dig site text"] = true
L["The color of the font"] = true
L["The color of the header text"] = true
L["The color of the key stone text"] = true
L["The color of the rare artifact text"] = true
L["The corner of the Artifacts list that the frame will grow from."] = true
L["The corner of the Dig Sites list that the frame will grow from."] = true
L["The corner of the survey distance indicator that the frame will anchor from."] = true
L["The font that the artifact text will use"] = true
L["The font that the dig site text will use"] = true
L["The font that the header text will use"] = true
L["The font that will be used"] = true
L["The outline of the font"] = true
L["The outline that the artifact name will use"] = true
L["The outline that the artifact text will use"] = true
L["The outline that the dig site name will use"] = true
L["The outline that the dig site text will use"] = true
L["The outline that the fragment progress will use"] = true
L["The outline that the header text will use"] = true
L["The outline that the zone and distance will use"] = true
L["The style of display for Archy.  This will reload your UI after selecting"] = true
L["Thick Outline"] = true
L[ [=[This setting will control the distance at which the waypoint arrow switches to a downwards arrow, indicating you have arrived at your destination.
NOTE: This may not work with emulation addons if they do not support this.]=] ] = true
L["Toggle if Archy will send the nearest dig site waypoint information to TomTom"] = true
L["Toggle if Artifacts will be shown"] = true
L["Toggle if Dig Sites will be shown"] = true
L["Toggle if only the current continent's dig sites will be shown"] = true
L["Toggle the display of Archy"] = true
L["Toggle the display of the dig counter"] = true
L["Toggle the display of the distance to the dig sites"] = true
L["Toggle the display of the zone name"] = true
L["Toggles TomTom Integration"] = true
L["Toggles if the font will have a shadow"] = true
L["Toggles the dig site icons on the minimap"] = true
L["Toggles the display of the Artifacts and Dig Sites lists"] = true
L["Toggles the display of the Artifacts list"] = true
L["Toggles the display of the Dig Sites list"] = true
L["Toggles the display of the Minimap Icon"] = true
L["Toggles the minimap icon of this add-on"] = true
L["TomTom Options"] = true
L["TomTom Support"] = true
L["Tooltip"] = true
L["Tooltip Options"] = true
L["Tooltip Scale"] = true
L["TOOLTIP_FILTER_DESC_FORMAT"] = "Filter the tooltip to only include %s from the current continent."
L["TOOLTIP_FILTER_LABEL_FORMAT"] = "Filter %s to Current Continent"
L["TOOLTIP_HIDEDELAY_DESC"] = "Number of seconds the tooltip will continue to be shown after the mouse has been moved."
L["TOOLTIP_HIDEDELAY_LABEL"] = "Tooltip Hide Delay"
L["Top Left"] = true
L["Top Right"] = true
L["Total"] = true
L["Undock"] = true
L["Undock the survey distance indicator from the Dig Sites list"] = true
L["Version: %s"] = true
L["Visit a trainer!"] = true
L["When you 'arrive' at a waypoint (this distance is controlled by the 'Arrival Distance' setting in this group) a sound can be played to indicate this.  You can enable or disable this sound using this setting."] = true
L["Yellow Distance Radius"] = true
L["You can solve %s Artifact - %s (Fragments: %d of %d)"] = true
L["You have solved |cFFFFFF00%s|r Artifact - |cFFFFFF00%s|r (Times completed: %d)"] = true
L["Your Archaeology skill is at %d of %d.  Are you sure you would like to solve this artifact before visiting a trainer?"] = true
L["Zone Font Options"] = true
L["Zone Font Outline"] = true
L["Zone Font Size"] = true
L["artifacts"] = true
L["closest"] = true
L["config"] = true
L["dig sites"] = "digsites"
L["nearest"] = true
L["refresh"] = true
L["reset"] = true
L["solve stone"] = true
L["stealth"] = true
L["ProjectNames/Mummified Monkey Paw"] = true
L["Play a sound when standing over a survey"] = true
L["When you standing over a survey a sound can be played to indicate this.  You can enable or disable this sound using this setting."] = true
