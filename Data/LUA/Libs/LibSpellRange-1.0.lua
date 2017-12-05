local a="SpellRange-1.0"local wqU76o=11
assert(LibStub,format("%s requires LibStub.",a))local LB1Z=LibStub:NewLibrary(a,wqU76o)if not LB1Z then return end
local N9L=_G.tonumber;local hDc_M=_G.strlower;local qW0lRiD1=_G.wipe;local iD1IUx=_G.type;local JLCOx_ak=_G.GetSpellTabInfo
local hPQ=_G.GetNumSpellTabs;local R1FIoQI=_G.GetSpellBookItemInfo;local NsoTwDs=_G.GetSpellBookItemName
local HGli=_G.GetSpellLink;local iy=_G.GetSpellInfo;local m6SCS0=_G.IsSpellInRange;local NUhYw6R4=_G.SpellHasRange
LB1Z.isNumber=
LB1Z.isNumber or
setmetatable({},{__mode="kv",__index=function(zPXTTg,seMLr)local qX=N9L(seMLr)or false;zPXTTg[seMLr]=qX;return qX end})local Hv=LB1Z.isNumber
LB1Z.strlowerCache=LB1Z.strlowerCache or
setmetatable({},{__index=function(h_8,xL7OTb)if not xL7OTb then return end
local w8T3f
if iD1IUx(xL7OTb)=="number"then w8T3f=xL7OTb else w8T3f=hDc_M(xL7OTb)end;h_8[xL7OTb]=w8T3f;return w8T3f end})local Ch=LB1Z.strlowerCache
LB1Z.spellsByName_spell=LB1Z.spellsByName_spell or{}local urkh=LB1Z.spellsByName_spell
LB1Z.spellsByID_spell=LB1Z.spellsByID_spell or{}local zhzpBSx=LB1Z.spellsByID_spell
LB1Z.spellsByName_pet=LB1Z.spellsByName_pet or{}local rHSjalVy=LB1Z.spellsByName_pet
LB1Z.spellsByID_pet=LB1Z.spellsByID_pet or{}local TjhsnP=LB1Z.spellsByID_pet
local function t5jzEd9(K)local qL,qL,vfIyB,quNsijN=JLCOx_ak(3)local QUh2tc=vfIyB
if
quNsijN==0 then local qL,qL,vfIyB,quNsijN=JLCOx_ak(2)QUh2tc=vfIyB+quNsijN end;local qboV=LB1Z["spellsByName_"..K]
local nSBOx7=LB1Z["spellsByID_"..K]qW0lRiD1(qboV)qW0lRiD1(nSBOx7)
for u=1,QUh2tc do local iD1IUx,Ki1=R1FIoQI(u,K)
if iD1IUx==
"SPELL"then local zz1QI=NsoTwDs(u,K)local kFTAh=HGli(zz1QI)
local LBf=N9L(kFTAh and
kFTAh:gsub("|","||"):match("spell:(%d+)"))local dijn4Ph=iy(Ki1)if zz1QI then qboV[hDc_M(zz1QI)]=u end;if dijn4Ph then
qboV[hDc_M(dijn4Ph)]=u end;if LBf then nSBOx7[LBf]=u end
if Ki1 then nSBOx7[Ki1]=u end end end end
if not LB1Z.updaterFrame then LB1Z.updaterFrame=CreateFrame("Frame")end;LB1Z.updaterFrame:UnregisterAllEvents()
LB1Z.updaterFrame:RegisterEvent("SPELLS_CHANGED")local function JZAU2()t5jzEd9("spell")t5jzEd9("pet")end
LB1Z.updaterFrame:SetScript("OnEvent",JZAU2)JZAU2()
function LB1Z.IsSpellInRange(CO1,RlZo)
if Hv[CO1]then local SUn=zhzpBSx[CO1]if SUn then
return m6SCS0(SUn,"spell",RlZo)else local SUn=TjhsnP[CO1]
if SUn then return m6SCS0(SUn,"pet",RlZo)end end else local CO1=Ch[CO1]
local Ib4=urkh[CO1]
if Ib4 then return m6SCS0(Ib4,"spell",RlZo)else local Ib4=rHSjalVy[CO1]if Ib4 then return
m6SCS0(Ib4,"pet",RlZo)end end;return m6SCS0(CO1,RlZo)end end
function LB1Z.SpellHasRange(fjV1G2)
if Hv[fjV1G2]then local Do=zhzpBSx[fjV1G2]
if Do then
return NUhYw6R4(Do,"spell")else local Do=TjhsnP[fjV1G2]if Do then return NUhYw6R4(Do,"pet")end end else local fjV1G2=Ch[fjV1G2]local _=urkh[fjV1G2]
if _ then return NUhYw6R4(_,"spell")else
local _=rHSjalVy[fjV1G2]if _ then return NUhYw6R4(_,"pet")end end;return NUhYw6R4(fjV1G2)end end