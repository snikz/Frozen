
function SetupKeybinds()local QDnlt=IsInRaid()and"raid"or"party"
local LmcA2auZ=GetNumGroupMembers()if(LmcA2auZ==0)then SetBinding("F1","TARGETSELF")
SaveBindings(2)return end
if(QDnlt=="party")then
SetBinding("F1","TARGETSELF")SaveBindings(2)
SetBinding("F2","TARGETPARTYMEMBER1")SaveBindings(2)
SetBinding("F3","TARGETPARTYMEMBER2")SaveBindings(2)
SetBinding("F4","TARGETPARTYMEMBER3")SaveBindings(2)
SetBinding("F5","TARGETPARTYMEMBER4")SaveBindings(2)return end;if(LmcA2auZ>30)then LmcA2auZ=30 end;for Q=1,36 do DeleteMacro(1)
DeleteMacro(37)end
for ZA=1,LmcA2auZ do local _IQQ=UnitName("raid"..ZA)
if
(ZA<=10)then local XpkjA=ZA;if XpkjA>=4 then XpkjA=XpkjA+1 end
CreateMacro("Tar"..ZA,"INV_MISC_QUESTIONMARK",
"/tar [mod:alt,@raid".. (ZA+10).."][nomod,@raid"..ZA.."] ",
nil)SetBindingMacro("F"..XpkjA,"Tar"..ZA)
SaveBindings(2)end
if(ZA<=10)then
CreateMacro("TarNP"..ZA,"INV_MISC_QUESTIONMARK","/tar [@raid".. (ZA+20).."]",nil)
SetBindingMacro("NUMPAD".. (ZA-1),"TarNP"..ZA)SaveBindings(2)end end end