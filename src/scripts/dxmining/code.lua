dx = dx or {}
dx.mining = dx.mining or {}
dx.mining.version =  "@VERSION@"
dx.mining.lodes = dx.mining.lodes or {}
dx.mining.stronghold = dx.mining.stronghold  or {}
dx.mining.mines = dx.mining.mines or {}
dx.mining.rooms = dx.mining.rooms or {}
dx.mining.lastRooms = dx.mining.lastRooms or {}
dx.mining.config = dx.mining.config or {}
dx.mining.config.active = dx.mining.config.active or false
dx.mining.config.reporting = dx.mining.config.reporting or false
dx.mining.config.reportchannel = dx.mining.config.reportchannel or "pt"
dx.mining.config.reportsize = dx.mining.config.reportsize or "medium"
dx.mining.config.audioalerts = dx.mining.config.audioalerts or true
dx.mining.config.returnto = dx.mining.config.returnto or false
dx.mining.config.gui = dx.mining.config.gui or false
dx.mining.events = dx.mining.events or {}
dx.mining.events.arrived = dx.mining.events.arrived or nil
dx.mining.gui = dx.mining.gui or {}
dx.mining.gui.totalRooms = dx.mining.gui.totalRooms or 100
dx.mining.gui.roomsLeft = dx.mining.gui.roomsLeft or 50

dx.mining.lodeSizes = {
    {"tiny", "small", "medium", "large","huge","massive"}

}
dx.mining.specialLodes = {
  {"platinum","stone","gold"}
}

dx.mining.lodeRooms = {
  {
    area = "prime",
    rooms = {
      "312", "316", "318", "312", "311", "317", "315", "314", "310", "309", "302", "300", "301", "303", "306", "305", "14790", "6164", "13778", "358",
      "354", "350", "346", "345", "349", "45863", "353", "357", "356", "355", "351", "352", "348", "6587", "6629", "347", "343", "344", "333", "334",
      "335", "331", "330", "1236", "1235", "1247", "1246", "1249", "1250", "1245", "1237", "1251", "1244", "1243", "2007", "2008", "2009", "2010",
      "2011", "2012", "2014", "2015", "2016", "2013", "2017", "2018", "2019", "5032", "5033", "5034", "5035", "5036", "3795", "3796", "3799", "3801",
      "3802", "3805", "3804", "3800", "3798", "3821", "3797", "3812", "1434", "1433", "1430", "1431", "1427", "1428", "1429", "1426", "1425", "1423",
      "1424", "3018", "3017", "3016", "28632", "3015", "3019", "3389", "3390", "3391", "3020", "1683", "1686", "1685", "1436", "1435", "1432", "1626",
      "1627", "1628", "1629", "1631", "1632", "1630", "1633", "1634", "1635", "1697", "1706", "1707", "1708", "1709", "1702", "1710", "1705", "1619",
      "1711", "1712", "1719", "1718", "1713", "1714", "1715", "5585", "4315", "1716", "1717", "1720", "1721", "1722", "1723", "1724", "1725", "1726",
      "1727", "1728", "1729", "1490", "9146", "18634", "19004", "11657", "11693", "9145", "9144", "9143", "9142", "9141", "9140", "9139", "7626",
      "7155", "7154", "7153", "7156", "7625", "7226", "9072", "9071", "9070", "9069", "9074", "9073", "9075", "9068", "9067", "9105", "9104", "9103",
      "9102", "9101", "9100", "9099", "9098", "9147", "9092", "9093", "9096", "9094", "9095", "9097", "9138", "9091", "9089", "9090", "9088", "9086",
      "9131", "9130", "2982", "2983", "2984", "2985", "2986", "2987", "2988", "2981", "3420", "3421", "3422", "3423", "3424", "2980", "2979", "2977",
      "2990", "2991", "2997", "10280", "38162", "35601", "35193", "10241", "10458", "10381", "10502", "10224", "10247", "10226", "10250", "10448",
      "10429", "10218", "10219", "10412", "10567", "10299", "10342", "10235", "10311", "13553", "10712", "10196", "10195", "10202", "10203", "10194",
      "10240", "10184", "10186", "10182", "10185", "10189", "10409", "10190", "10192", "10193", "10187", "10181", "10206", "10222", "10295", "1139",
      "1138", "1137", "1136", "1133", "1132", "1131", "1128", "1127", "1126", "1125", "1101", "1100", "1099", "1082", "1079", "1080", "1077",
      "1081", "1083", "1094", "1084", "1088", "1090", "1089", "1093", "1091", "1095", "1092", "1103", "1102", "1104", "1105", "1106", "1096", "1097",
      "1107", "1108", "1129", "1130", "1111", "1114", "1115", "1118", "1119", "1121", "1123", "1112", "1113", 
    },
  }, {
    area = "tundra",
    rooms = {
      "10924", "10923", "10922", "10906", "10835", "10866", "10836", "10832", "10833", "11254", "11049", "10892", "10891", "10894", "10896", "10893",
      "10897", "10898", "10901", "10907", "13931", "10909", "10911", "13934", "10912", "10914", "14104", "10915",
    },
  },
}


function dx.mining:echo(line)
  if line == nil then line = "" end
  cecho(string.format("\n<grey>[<purple> DX MINING <grey>]:<white> %s", line))
end

function dx.mining:aecho(what, command, popup)

	what = "\n<white>[<purple> DX MINING <white>]:   " .. what
	if command then
		cechoLink(what, command, popup or "", true)
	else
		cecho(what)
	end

end

function dx.mining:toggle(what, val, print)
  for x, y in pairs(dx.mining.config) do
    if what == x then
      dx.mining.config[what] = val
      if not print then 
          local toPrint
          toPrint = tostring(val)
          dx.mining:echo(what .. " " .. toPrint)
      end
      return
    end
  end
  dx.mining:echo("NOT A VALID OPTION. TRY 'dxmine config' TO SEE ALL OPTIONS")
end

function dx.mining:arrived()
  if not dx.mining.rooms then
    return
  end
  if next(dx.mining.rooms) and dx.mining.config.active then
    table.remove(dx.mining.rooms,1)
    if next(dx.mining.rooms) then
      dx.mining.timer = tempTimer(0.8, [[mmp.gotoRoom(dx.mining.rooms[1])]])
      if dx.mining.config.gui then 
        dx.mining.gui.roomsLeft = #dx.mining.rooms
        dx.mining:buildGUI()
      end
    else
      if dx.mining.config.gui then 
        dx.mining.gui.roomsLeft = 0
        dx.mining:buildGUI()
      end
      if dx.mining.config.audioalerts then playSoundFile(getMudletHomeDir()..[[\dxmining\dxExclamation.wav]]) end
      dx.mining:echo(" Prospecting Complete!")
      dx.mining.config.active = false
      if type(dx.mining.config.returnto) == "number" then
        tempTimer(0.8, [[mmp.gotoRoom(dx.mining.config.returnto)]])
      end
    end
    send("prospect",false)
    send("read sign",false)
  end
end

if dx.mining.events.arrived then killAnonymousEventHandler(dx.mining.events.arrived) end
dx.mining.events.arrived = registerAnonymousEventHandler("mmapper arrived", dx.mining.arrived)

function dx.mining:goProspect(area)
  local tbl = dx.mining.lodeRooms
  if not area then
    for x, y in ipairs(tbl) do
      if mmp.getPath(mmp.currentroom, tbl[x].rooms[1]) then
        area =  tbl[x].area
        break
      end
    end
    
  end
  if not area then 
    dx.mining:echo("NO LODE ROOMS FOUND FOR THIS AREA")
    return
  else
    
  end
  if dx.mining.rooms then dx.mining.lastRooms = dx.mining.rooms end
  dx.mining.rooms = {}
  dx.mining.rooms = dx.mining:roomsFind(area)
  dx.mining.gui.totalRooms = #dx.mining.rooms
  dx.mining.gui.roomsLeft = #dx.mining.rooms
  if dx.mining.config.gui then
    dx.mining:buildGUI()
  end
  dx.mining:echo("Beginning Prospecting Run for " .. area .. "!")
  expandAlias("goto " .. dx.mining.rooms[1])
  if mmp.paused then mmp.pause("off") end
  dx.mining.config.active = true
  dx.mining.mines = {}
  dx.mining.lodes = {}
  dx.mining.strongholds = {}
end

function dx.mining:continue()
  dx.mining:echo("Going to next room " .. dx.mining.rooms[1])
  expandAlias("goto " .. dx.mining.rooms[1])
  if mmp.paused then mmp.pause("off") end
  dx.mining.config.active = true
end

function dx.mining:skip()
  dx.mining:echo("Skipping " .. dx.mining.rooms[1])
  table.remove(dx.mining.rooms, 1)
  expandAlias("goto " .. dx.mining.rooms[1])
  if mmp.paused then mmp.pause("off") end
  dx.mining.config.active = true
  
end

function dx.mining:stop()
  mmp.stop()
  killTimer(tostring(dx.mining.timer))
  send("stop",false)
  dx.mining.config.active = false
  dx.mining:echo("Stopped Prospecting Run!")
end


function dx.mining:info()
  dx.mining:echo("[[     WELCOME TO DXMINING    ]]\n")
  dx.mining:echo("<white> dxmining commands:")
  dx.mining:echo("<red> dxmine")
  dx.mining:echo(" - This menu")
  dx.mining:echo("<red> dxmine start <area>")
  dx.mining:echo(" - Start prospecting from the top of the list. Area is optional. Should automatically know the area you're in.")
  dx.mining:echo("<red> dxmine stop")
  dx.mining:echo(" - Stops at current room or next room if in transit")
  dx.mining:echo("<red> dxmine continue")
  dx.mining:echo(" - Continues prospecting from where you last stopped")
  dx.mining:echo("<red> dxmine skip")
  dx.mining:echo(" - Skip the lode you are currently trying to get to")
  dx.mining:echo("<red> dxmine report")
  dx.mining:echo(" - Shows a report of all mines and lodes seen. ")
  dx.mining:echo("<red> dxmine config")
  dx.mining:echo(" - Shows the menu of configurables")
  dx.mining:echo("<red> dxmine config <name> <option>")
  dx.mining:echo(" - Change configurations ")
end


function dx.mining:report(channel)
  local owners = {}
  local m = dx.mining.mines
  local s = dx.mining.strongholds
  local l = dx.mining.lodes
  local lstring = {}
  local mcount = 0
  cecho("\n ------------- MINE REPORT --------------- ")
  if l and next(l) then
    cecho("\n\n LODES     \n")
    for k, v in pairs(l) do
      cecho("\n " .. k .. " " .. v.lodesize .. " " .. v.lodetype .. " ready for a mine.")
      if channel then
        table.insert(lstring, channel .. " " .. v.lodesize .. " " .. v.lodetype .. " at " .. k)
      end
    end
  else
    cecho("\n NO EMPTY LODES FOUND")
  end
  if m and next(m) then
    cecho("\n\n MINES     \n")
    for k, v in pairs(m) do
      cecho(
        "\n " ..
        k ..
        " " ..
        v.minesize ..
        " mine on a " ..
        v.lodesize ..
        " " ..
        v.lodetype ..
        " " ..
        v.percentage ..
        " mined by " ..
        v.mineowner ..
        "."
      )
      if channel and tonumber(v.percentage) >= 90 then
        mcount = mcount + 1
      end
    end
  else
    cecho("\n NO MINES FOUND")
  end
  cecho("\n ------------- END MINE REPORT --------------- ")
  send("\n")
  if channel and mcount > 0 then
    if next(lstring) then
      table.insert(lstring, channel .. " --------------")
    end
    table.insert(lstring, channel .. " " .. mcount .. " mines about to pop")
  end
  if channel and next(lstring) then
    table.insert(lstring, 1, channel .. " Available Lodes: ")
    send(table.concat(lstring, "|"), false)
  end
end

function dx.mining:addLode(lsize, ltype)
  local info = gmcp.Room.Info
  dx.mining.lodes[info.num] = {lodesize = lsize, lodetype = ltype, loseroom = info.name, lodearea = info.area}
  decho("All", " MINING : "..lsize .." " ..ltype .. " found at " .. gmcp.Room.Info.name.. " (" ..gmcp.Room.Info.num.. ")\n ")
  dx.mining:echo("LODE FOUND:  " .. lsize .. " " .. ltype .."!!!")
  dx.mining:echo("LODE FOUND:  " .. lsize .. " " .. ltype .."!!!")
  dx.mining:echo("LODE FOUND:  " .. lsize .. " " .. ltype .."!!!")
  if dx.mining.config.reporting and dx.mining.config.reportchannel then
    send(dx.mining.config.reportchannel ..  " "..lsize .." " ..ltype .. " lode found at " .. gmcp.Room.Info.name.. " (" ..gmcp.Room.Info.num.. ")\n ")
  end
  if (table.index_of(dx.mining.lodeSizes[1], lsize) >= table.index_of(dx.mining.lodeSizes[1], dx.mining.config.reportsize)) or table.contains(dx.mining.specialLodes, ltype) then 
    if dx.mining.config.audioalerts then playSoundFile(getMudletHomeDir()..[[\dxmining\dxExclamation.wav]]) end
    clearCmdLine() appendCmdLine('construct large mine')
    mmp.stop() 
    dx.mining.config.active = false
    killTimer(tostring(dx.mining.timer))
  end
end

function dx.mining:addStronghold(owner)
  local info = gmcp.Room.Info
  dx.mining.strongholds[info.num] = {mineowner = owner, mineroom = info.name, minearea = info.area}
end

function dx.mining:addMine(msize, atype, lsize, percent)
    local info = gmcp.Room.Info
    dx.mining.mines[info.num] =  {minesize = msize, lodetype = atype, lodesize = lsize, percentage = percent}
end

function dx.mining:addMineOwner(owner)
    local info = gmcp.Room.Info
    dx.mining.mines[info.num].mineowner = owner
end


function dx.mining:roomsFind(val)
  local tbl = dx.mining.lodeRooms
  for i = 1, #tbl do
    if tbl[i].area == val then
      return table.deepcopy(tbl[i].rooms)
    end
  end
  return nil
end

function dx.mining:showConfigs()
  local con = dx.mining.config
  dx.mining:aecho(
    string.format(
      "active - Mining is <red>%s<reset>",
      con.active and "on" or "off"
  ),
  "dx.mining:toggle('active', not dx.mining.config.active)",
  string.format(
    "Turn Mining %s",
    con.active and "off" or "on"
  )
)
dx.mining:aecho(
  string.format(
    "reporting - Reporting is <red>%s<reset>",
    con.reporting and "on" or "off"
  ),
  "dx.mining:toggle('reporting', not dx.mining.config.reporting)",
  string.format(
    "Turn reporting %s",
    con.reporting and "off" or "on"
  )
)
dx.mining:aecho(
  string.format(
    "reportchannel - Reporting to channel <red>%s<reset>",
    con.reportchannel
  ),
  "clearCmdLine() appendCmdLine('dxmine config reportchannel ')",
  string.format(
    "Report to %s",
    con.reportchannel
  )
)
dx.mining:aecho(
  string.format(
    "reportsize - Reporting Lodes <red>%s<reset> or larger",
    con.reportsize
  ),
  "clearCmdLine() appendCmdLine('dxmine config reportsize ')",
  string.format(
    "Report %s or larger lodes",
    con.reportsize
  )
)
dx.mining:aecho(
    string.format(
      "audioalerts - Audio Alerts are <red>%s<reset>",
      con.audioalerts and "on" or "off"
    ),
    "dx.mining:toggle('audioalerts', not dx.mining.config.audioalerts)",
    string.format(
      "Turn audio alerts %s",
      con.audioalerts and "off" or "on"
    )
)
dx.mining:aecho(
    string.format(
      "gui - GUI is <red>%s<reset>",
      con.gui and "on" or "off"
    ),
    "dx.mining:toggle('gui', not dx.mining.config.gui)",
    string.format(
      "Turn gui %s",
      con.gui and "off" or "on"
    )
)
dx.mining:aecho(
  string.format(
    "returnto - Returning to <red>%s<reset>",
    con.returnto and con.returnto or "NONE"
  ),
  "clearCmdLine() appendCmdLine('dxmine config returnto ')",
  string.format(
    "Return to  %s when finished",
    con.returnto and con.returnto or "NONE"
  )
)


echo("\n")
echo("\n")

end


function dx.mining:buildGUI()

  --Create the gui Adjustable

  dx.mining.gui.window =
    Adjustable.Container:new(
      {
        name = "dgui.window",
        x = 0,
        y = 0,
        width = "25%",
        height = "20%",
        adjLabelstyle = "background-color:rgba(50,50,50,0%);",
        buttonstyle =
          [[
      QLabel{ border-radius: 5px; background-color: rgba(140,140,140,100%);}
      QLabel::hover{ background-color: rgba(160,160,160,50%);}
    ]],
        buttonFontSize = 5,
        buttonsize = 10,
      },
      main
    )
  --Create the gui container
  dx.mining.gui.container =
    Geyser.Container:new(
      {name = "dgui.back", x = 0, y = 0, width = "100%", height = "50%"}, dx.mining.gui.window
    )
  --Create the gui Gauge
  dx.mining.gui.progressbar =
    Geyser.Gauge:new(
      {name = "progressDisplay", x = "0%", y = "0%", width = "100%", height = "50%"},
      dx.mining.gui.container
    )
  dx.mining.gui.progressbar:setValue(dx.mining.gui.roomsLeft,dx.mining.gui.totalRooms)
  dx.mining.gui.progressbar.front:setStyleSheet(
    [[
		background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #621616, stop: 0.1 #640a0a, stop: 0.49 #8a0000, stop: 0.5 #560000, stop: 1 #260000);
		border-top: 1px black solid;
		border-left: 1px black solid;
		border-bottom: 1px black solid;
		border-radius: 7;
		padding: 3px;
	]]
  )
  dx.mining.gui.progressbar.back:setStyleSheet(
    [[
		background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #555555, stop: 0.1 #555555, stop: 0.49 #333333, stop: 0.5 #333333, stop: 1 #555555);
		border-width: 1px;
		border-color: black;
		border-style: solid;
		border-radius: 7;
		padding: 3px;
	]]
  )
  setFontSize("progressDisplay", 9)
  --Label for text over gui
  dx.mining.gui.containerText =
  Geyser.Label:new(
    {name = "dgui.conlabel", x = 0, y = 0, width = "100%", height = "50%"}, dx.mining.gui.container
  )
dx.mining.gui.containerText:setStyleSheet([[
background-color: rgba(0,0,0,0%);
]])

dx.mining.gui.containerText:echo("<center>"..dx.mining.gui.roomsLeft .. "/" .. dx.mining.gui.totalRooms.." rooms") 


  dx.mining.gui.start =
    Geyser.Label:new(
      {name = "gui.start", x = "0", y = "50%", width = "33%", height = "50%"}, dx.mining.gui.container
    )
  dx.mining.gui.start:setStyleSheet(
    [[
     QLabel{ border-radius: 5px; background-color: rgba(0,255,0,100%);}
      QLabel::hover{ background-color: rgba(0,255,0,50%);}
		border-width: 1px;
		border-color: black;
		border-style: solid;
		border-radius: 7;
		padding: 3px;g
	]]
  )
  dx.mining.gui.start:setClickCallback("dx.mining:goProspect")
  dx.mining.gui.start:echo("<center>RESTART") 
  
  
dx.mining.gui.continue =
    Geyser.Label:new(
      {name = "dgui.continue", x = "33%", y = "50%", width = "33%", height = "50%"}, dx.mining.gui.container
    )
  dx.mining.gui.continue:setStyleSheet(
    [[
     QLabel{ border-radius: 5px; background-color: rgba(0,0,255,100%);}
      QLabel::hover{ background-color: rgba(0,0,255,50%);}
		border-width: 1px;
		border-color: black;
		border-style: solid;
		border-radius: 7;
		padding: 3px;
	]]
  )
  dx.mining.gui.continue:setClickCallback("dx.mining:continue")
  dx.mining.gui.continue:echo("<center>CONTINUE") 
  
  
  
    
dx.mining.gui.stop =
    Geyser.Label:new(
      {name = "dgui.stop", x = "66%", y = "50%", width = "33%", height = "50%"}, dx.mining.gui.container
    )
  dx.mining.gui.stop:setStyleSheet(
  
    [[
     QLabel{ border-radius: 5px; background-color: rgba(255,0,0,100%);}
      QLabel::hover{ background-color: rgba(255,0,0,50%);}
		border-width: 1px;
		border-color: black;
		border-style: solid;
		border-radius: 7;
		padding: 3px;
	]]
  )
 dx.mining.gui.stop:setClickCallback("dx.mining:stop")
  dx.mining.gui.stop:echo("<center>STOP") 

  
  dx.mining.gui.window:setTitle("DX.MINING", "gray")
  dx.mining.gui.window:show()
end
