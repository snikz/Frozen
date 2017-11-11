
function SetupKeybinds()if PlayerIsInCombat then return end
local QDnlt=IsInRaid()and"raid"or"party"local LmcA2auZ=GetNumGroupMembers()if(LmcA2auZ==0)then
SetBinding("F1","TARGETSELF")SaveBindings(2)return end
if
(QDnlt=="party")then SetBinding("F1","TARGETSELF")SaveBindings(2)
SetBinding("F2","TARGETPARTYMEMBER1")SaveBindings(2)
SetBinding("F3","TARGETPARTYMEMBER2")SaveBindings(2)
SetBinding("F4","TARGETPARTYMEMBER3")SaveBindings(2)
SetBinding("F5","TARGETPARTYMEMBER4")SaveBindings(2)return end;if(LmcA2auZ>30)then LmcA2auZ=30 end
for Q=1,LmcA2auZ do
local ZA=UnitName("raid"..Q)
if(Q<=10)then local _IQQ=Q;if _IQQ>=4 then _IQQ=_IQQ+1 end
if(
GetMacroIndexByName("Tar"..Q)==0)then
CreateMacro("Tar"..Q,"INV_MISC_QUESTIONMARK","/tar [mod:alt,@raid"..
(Q+10).."][nomod,@raid"..Q.."] ",nil)end;SetBindingMacro("F".._IQQ,"Tar"..Q)
SaveBindings(2)end
if(Q<=10)then if
(GetMacroIndexByName("TarNP"..Q)==0)then
CreateMacro("TarNP"..Q,"INV_MISC_QUESTIONMARK","/tar [@raid".. (Q+20).."]",nil)end;SetBindingMacro("NUMPAD".. (Q-
1),"TarNP"..Q)
SaveBindings(2)end end end