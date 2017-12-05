local b="LibRangeCheck-2.0"local E=
tonumber(("$Revision: 174 $"):match("%d+"))+100000
local KMw7_i1s,CQi=LibStub:NewLibrary(b,E)if not KMw7_i1s then return end;local nHlJ=.5;local lw4Q7kbl=10.0
local IN={[3]=8,[2]=9,[4]=28}
local QYf1={["Tauren"]={[3]=6,[2]=7,[4]=25},["Scourge"]={[3]=7,[2]=8,[4]=27}}local RfsnisO=5;local lvW2ga={}local T7RKP={}lvW2ga["DEATHKNIGHT"]={}
T7RKP["DEATHKNIGHT"]={49576}lvW2ga["DEMONHUNTER"]={}T7RKP["DEMONHUNTER"]={185123}
lvW2ga["DRUID"]={774,2782}T7RKP["DRUID"]={5176,339,6795,33786,22568}
lvW2ga["HUNTER"]={}T7RKP["HUNTER"]={75}lvW2ga["MAGE"]={}
T7RKP["MAGE"]={44614,5019}lvW2ga["MONK"]={115450,115546}
T7RKP["MONK"]={115546,115078,100780}lvW2ga["PALADIN"]={19750}
T7RKP["PALADIN"]={62124,20271,853,35395}lvW2ga["PRIEST"]={527,17}T7RKP["PRIEST"]={589,5019}
lvW2ga["ROGUE"]={}T7RKP["ROGUE"]={2764,2094}lvW2ga["SHAMAN"]={8004,546}
T7RKP["SHAMAN"]={403,370,73899}lvW2ga["WARRIOR"]={}T7RKP["WARRIOR"]={355,100,5246}
lvW2ga["WARLOCK"]={5697}T7RKP["WARLOCK"]={686,5019}
local _L6Bs={[5]={37727},[6]={63427},[8]={34368,33278},[10]={32321},[15]={1251,2581,3530,3531,6450,6451,8544,8545,14529,14530,21990,21991,34721,34722},[20]={21519},[25]={31463},[30]={1180,1478,3012,1712,2290,1711,34191},[35]={18904},[40]={34471},[45]={32698},[50]={116139},[60]={32825,37887},[70]={41265},[80]={35278},[100]={41058}}
local SH={[5]={37727},[6]={63427},[8]={34368,33278},[10]={32321},[15]={33069},[20]={10645},[25]={24268,41509,31463},[30]={835,7734,34191},[35]={24269,18904},[40]={28767},[45]={23836},[50]={116139},[60]={32825,37887},[70]={41265},[80]={35278},[100]={33119}}for B7SHDx7h,EEpoeR in pairs(lvW2ga)do tinsert(EEpoeR,28880)end
local wU4wYbA9=setmetatable;local fFeQcIM=tonumber;local JEHSHPh3=pairs;local bb=tostring;local o5e6fP=print;local iq7ol=next;local eMV=type
local WDTNkTD=wipe;local Oejsws=tinsert;local CkD73N0=tremove;local PlwhaRKJ=BOOKTYPE_SPELL;local Caz4NM4Z=GetSpellInfo
local XVxxx=GetSpellBookItemName;local hD=GetNumSpellTabs;local G5BuU5=GetSpellTabInfo;local AfwsY=GetItemInfo;local T=UnitAura
local WZs=UnitCanAttack;local ITdz=UnitCanAssist;local AjfoUo=UnitExists;local Er9zidsB=UnitIsDeadOrGhost
local X=CheckInteractDistance;local dR=IsSpellInRange;local JFXtQwy=IsItemInRange;local uMV17h0=UnitClass;local E2NZK=UnitRace
local WNWWe=GetInventoryItemLink;local zMzjn3lk=GetSpecialization;local Trkkpmd=GetSpecializationInfo;local L=GetTime
local GGv=GetInventorySlotInfo("HandsSlot")local ZIzh4Si=math.floor;local c8D4n81;local cSjJHx;local fa;local M;local dIZlrvD;local jQgsATKd=0
local aBbGg=function(_k)return X(_k,2)end
local D9=wU4wYbA9({},{__index=function(Ef,KfM)
local Vd=function(Oynw)if dR(KfM,PlwhaRKJ,Oynw)==1 then return true end end;Ef[KfM]=Vd;return Vd end})
local G=wU4wYbA9({},{__index=function(QBO,s4ggux)
local hrVI4meU=function(xEq6TAF)if dR(s4ggux,PlwhaRKJ,xEq6TAF)==1 then return true elseif aBbGg(xEq6TAF)then
return true,true end end;QBO[s4ggux]=hrVI4meU;return hrVI4meU end})
local gE=wU4wYbA9({},{__index=function(UIjls,jdLnB0vD)
local PSlD=function(nN)return JFXtQwy(jdLnB0vD,nN)end;UIjls[jdLnB0vD]=PSlD;return PSlD end})
local QgC=wU4wYbA9({},{__index=function(J,A)
local g3Qeqnr=function(qHpY64)if X(qHpY64,A)then return true end end;J[A]=g3Qeqnr;return g3Qeqnr end})
local function CYoa(z,qccJ5b)if eMV(qccJ5b)~="table"then qccJ5b={}end;if eMV(z)=="table"then
for ARuba,Wo53nZ in
JEHSHPh3(z)do
if eMV(Wo53nZ)=="table"then Wo53nZ=CYoa(Wo53nZ,qccJ5b[ARuba])end;qccJ5b[ARuba]=Wo53nZ end end;return
qccJ5b end
local function K3ipRr(XRfQ)M=CYoa(_L6Bs)dIZlrvD=CYoa(SH)fa=XRfQ;cSjJHx=nil end
local function F2tY()local gFPRdEC,gFPRdEC,lw9gLt3,TI5=G5BuU5(hD())return lw9gLt3+TI5 end
local function rb21L2(JmE)if not JmE or JmE==""then return nil end;for s4=1,F2tY()do
local FFG,a31jEAS=XVxxx(s4,PlwhaRKJ)if FFG==JmE then return s4 end end
return nil end
local function o_v255(LS4h,eux092_P,ZA9,hWgmxm)
local UBg54E={["range"]=eux092_P,["minRange"]=ZA9,["checker"]=hWgmxm}
for gQGq=1,#LS4h do local OyHc5FEv=LS4h[gQGq]
if UBg54E.range==OyHc5FEv.range then return end
if UBg54E.range>OyHc5FEv.range then Oejsws(LS4h,gQGq,UBg54E)return end end;Oejsws(LS4h,UBg54E)end
local function wUVm(Dn1Xi,_gGmBBE,rIX4)local AI14eFhp={}
if Dn1Xi then
for iW2O=1,#Dn1Xi do local Gdp=Dn1Xi[iW2O]
local nbqmx,IWQcC,IWQcC,IWQcC,cvRh,W9yaJm=Caz4NM4Z(Gdp)local oJ1ec=rb21L2(nbqmx)
if oJ1ec and W9yaJm then cvRh=ZIzh4Si(cvRh+0.5)W9yaJm=ZIzh4Si(
W9yaJm+0.5)if cvRh==0 then cvRh=nil end;if W9yaJm==0 then
W9yaJm=RfsnisO end
if cvRh then
o_v255(AI14eFhp,W9yaJm,cvRh,G[oJ1ec])else o_v255(AI14eFhp,W9yaJm,cvRh,D9[oJ1ec])end end end end
if _gGmBBE then
for LMMNWLk,x6Ni in JEHSHPh3(_gGmBBE)do
for Q2waXkyp=1,#x6Ni do local EG72=x6Ni[Q2waXkyp]if AfwsY(EG72)then
o_v255(AI14eFhp,LMMNWLk,nil,gE[EG72])break end end end end
if rIX4 and not iq7ol(AI14eFhp)then for mlTMZ,q in JEHSHPh3(rIX4)do
o_v255(AI14eFhp,q,nil,QgC[mlTMZ])end end;return AI14eFhp end
local function VQ(xb6,yK)local rHLz2GD,BlW0RhJA=0,nil
for Uy=1,#yK do local n=yK[Uy]
if not BlW0RhJA or BlW0RhJA>n.range then
if
n.minRange then local TKu,M6kL=n.checker(xb6)
if M6kL then BlW0RhJA=n.minRange elseif TKu then
rHLz2GD,BlW0RhJA=n.minRange,n.range elseif rHLz2GD>n.range then return rHLz2GD,BlW0RhJA else return n.range,BlW0RhJA end elseif n.checker(xb6)then BlW0RhJA=n.range elseif rHLz2GD>n.range then return rHLz2GD,BlW0RhJA else
return n.range,BlW0RhJA end end end;return rHLz2GD,BlW0RhJA end
local function oTYNsnP(M7o_,dk2X7J7)
if#M7o_~=#dk2X7J7 then WDTNkTD(M7o_)CYoa(dk2X7J7,M7o_)return true end
for jv=1,#M7o_ do if M7o_[jv].range~=dk2X7J7[jv].range or M7o_[jv].checker~=
dk2X7J7[jv].checker then WDTNkTD(M7o_)
CYoa(dk2X7J7,M7o_)return true end end end
local function I(MW)local E2OQ=#MW;return
function()local SnbfLb6=MW[E2OQ]if not SnbfLb6 then return nil end;E2OQ=E2OQ-1;return
SnbfLb6.range,SnbfLb6.checker end end
local function LmR5gwW(ay,W)local WzM,PSx;for IwnA=1,#ay do local cW=ay[IwnA]if cW.range<W then return WzM,PSx end
WzM,PSx=cW.checker,cW.range end;return WzM,PSx end
local function DfbW(PHpCof2,bUPpn4T2)
for sode=1,#PHpCof2 do local G9zkKODk=PHpCof2[sode]if G9zkKODk.range<=bUPpn4T2 then return G9zkKODk.checker,
G9zkKODk.range end end end
local function sh(MGt,ld9GuG4t)for KpCCA=1,#MGt do local H6=MGt[KpCCA]
if H6.range==ld9GuG4t then return H6.checker end end end;local function rrFLbCtj()end
local function YcPea0vg(hgsKvTz,zEt,Wjojpvg)Wjojpvg=Wjojpvg or rrFLbCtj
hgsKvTz=hgsKvTz or Wjojpvg;zEt=zEt or Wjojpvg
return
function(l2PqbWw)if not AjfoUo(l2PqbWw)then return nil end;if
Er9zidsB(l2PqbWw)then return Wjojpvg(l2PqbWw)end;if WZs("player",l2PqbWw)then return
zEt(l2PqbWw)elseif ITdz("player",l2PqbWw)then return hgsKvTz(l2PqbWw)else
return Wjojpvg(l2PqbWw)end end end
KMw7_i1s.checkerCache_Spell=KMw7_i1s.checkerCache_Spell or{}
KMw7_i1s.checkerCache_Item=KMw7_i1s.checkerCache_Item or{}KMw7_i1s.miscRC=wUVm(nil,nil,IN)
KMw7_i1s.friendRC=wUVm(nil,nil,IN)KMw7_i1s.harmRC=wUVm(nil,nil,IN)KMw7_i1s.failedItemRequests={}
local function usLpLoaH(EJTH9)end;KMw7_i1s.CHECKERS_CHANGED="CHECKERS_CHANGED"
KMw7_i1s.MeleeRange=RfsnisO
function KMw7_i1s:findSpellIndex(qTB82)
if eMV(qTB82)=='number'then qTB82=Caz4NM4Z(qTB82)end;return rb21L2(qTB82)end
function KMw7_i1s:getRangeAsString(KL,EATFLbgY,FF)local rh,YcCR=self:getRange(KL)if not rh then return nil end;if not
YcCR then return FF and rh.." +"or nil end;return rh.." - "..
YcCR end
function KMw7_i1s:init(G3p2Yn)
if self.initialized and(not G3p2Yn)then return end;self.initialized=true;local _jkkD9,D=uMV17h0("player")
local _jkkD9,DMn=E2NZK("player")aBbGg=nil
if SH[15]then local LLFUU=SH[15]for kdmQtj6=1,#LLFUU do local Hc35_=LLFUU[kdmQtj6]
if AfwsY(Hc35_)then aBbGg=function(ubP)return
JFXtQwy(Hc35_,ubP)end;break end end end
if not aBbGg then
if D=="WARRIOR"then local eN0UMW=Caz4NM4Z(5246)local lAG=rb21L2(eN0UMW)if lAG then
aBbGg=function(AvEtR8Y)return(
dR(lAG,PlwhaRKJ,AvEtR8Y)==1)end end elseif D=="ROGUE"then
local rl3MMqfm=Caz4NM4Z(2094)local nQj=rb21L2(rl3MMqfm)
if nQj then aBbGg=function(Eq8jDq)return
(dR(nQj,PlwhaRKJ,Eq8jDq)==1)end end end end;if not aBbGg then
if D=="HUNTER"or DMn=="Tauren"then aBbGg=QgC[4]else aBbGg=QgC[2]end end;local GBzFRjVV=QYf1[DMn]or IN
self.handSlotItem=WNWWe("player",GGv)local pG4C8fDK=false;if
oTYNsnP(self.friendRC,wUVm(lvW2ga[D],_L6Bs,GBzFRjVV))then pG4C8fDK=true end;if
oTYNsnP(self.harmRC,wUVm(T7RKP[D],SH,GBzFRjVV))then pG4C8fDK=true end;if
oTYNsnP(self.miscRC,wUVm(nil,nil,GBzFRjVV))then pG4C8fDK=true end;if pG4C8fDK and self.callbacks then
self.callbacks:Fire(self.CHECKERS_CHANGED)end end
function KMw7_i1s:GetFriendCheckers()return I(self.friendRC)end;function KMw7_i1s:GetHarmCheckers()return I(self.harmRC)end;function KMw7_i1s:GetMiscCheckers()return
I(self.miscRC)end;function KMw7_i1s:GetFriendMinChecker(LnQUN)return
LmR5gwW(self.friendRC,LnQUN)end;function KMw7_i1s:GetHarmMinChecker(Gm1)return
LmR5gwW(self.harmRC,Gm1)end;function KMw7_i1s:GetMiscMinChecker(Jp)return
LmR5gwW(self.miscRC,Jp)end;function KMw7_i1s:GetFriendMaxChecker(NwBqNl3C)return
DfbW(self.friendRC,NwBqNl3C)end;function KMw7_i1s:GetHarmMaxChecker(XuqjvYPF)return
DfbW(self.harmRC,XuqjvYPF)end;function KMw7_i1s:GetMiscMaxChecker(Trh)return
DfbW(self.miscRC,Trh)end;function KMw7_i1s:GetFriendChecker(K)return
sh(self.friendRC,K)end;function KMw7_i1s:GetHarmChecker(uK)return
sh(self.harmRC,uK)end;function KMw7_i1s:GetMiscChecker(s0FU)return
sh(self.miscRC,s0FU)end
function KMw7_i1s:GetSmartMinChecker(wQl)return
YcPea0vg(LmR5gwW(self.friendRC,wQl),LmR5gwW(self.harmRC,wQl),LmR5gwW(self.miscRC,wQl))end
function KMw7_i1s:GetSmartMaxChecker(g)return
YcPea0vg(DfbW(self.friendRC,g),DfbW(self.harmRC,g),DfbW(self.miscRC,g))end
function KMw7_i1s:GetSmartChecker(m4u,StZ)return
YcPea0vg(sh(self.friendRC,m4u)or StZ,
sh(self.harmRC,m4u)or StZ,sh(self.miscRC,m4u)or StZ)end
function KMw7_i1s:GetRange(C1NqzxY)if not AjfoUo(C1NqzxY)then return nil end;if
Er9zidsB(C1NqzxY)then return VQ(C1NqzxY,self.miscRC)end
if
WZs("player",C1NqzxY)then return VQ(C1NqzxY,self.harmRC)elseif ITdz("player",C1NqzxY)then return
VQ(C1NqzxY,self.friendRC)else return VQ(C1NqzxY,self.miscRC)end end;KMw7_i1s.getRange=KMw7_i1s.GetRange;function KMw7_i1s:OnEvent(T1gVrYq,...)
if
eMV(self[T1gVrYq])=='function'then self[T1gVrYq](self,T1gVrYq,...)end end;function KMw7_i1s:LEARNED_SPELL_IN_TAB()
self:scheduleInit()end;function KMw7_i1s:CHARACTER_POINTS_CHANGED()
self:scheduleInit()end;function KMw7_i1s:PLAYER_TALENT_UPDATE()
self:scheduleInit()end
function KMw7_i1s:GLYPH_ADDED()self:scheduleInit()end;function KMw7_i1s:GLYPH_REMOVED()self:scheduleInit()end;function KMw7_i1s:GLYPH_UPDATED()
self:scheduleInit()end
function KMw7_i1s:SPELLS_CHANGED()self:scheduleInit()end
function KMw7_i1s:UNIT_INVENTORY_CHANGED(P5G,JC)if self.initialized and JC=="player"and self.handSlotItem~=
WNWWe("player",GGv)then
self:scheduleInit()end end
function KMw7_i1s:UNIT_AURA(PDA,K)if self.initialized and K=="player"then
self:scheduleAuraCheck()end end
function KMw7_i1s:processItemRequests(qne5Stra)
while true do local FKLmmhnQ,F82=iq7ol(qne5Stra)
if not FKLmmhnQ then return end
while true do local wJ6tY_,TNg=iq7ol(F82)
if not wJ6tY_ then qne5Stra[FKLmmhnQ]=nil;break elseif
self.failedItemRequests[TNg]then CkD73N0(F82,wJ6tY_)elseif AfwsY(TNg)then
if c8D4n81 then cSjJHx=true;c8D4n81=nil end;if not fa then qne5Stra[FKLmmhnQ]=nil;break end
CkD73N0(F82,wJ6tY_)elseif not c8D4n81 then c8D4n81=L()+lw4Q7kbl;return true elseif L()>c8D4n81 then
if fa then o5e6fP(b..
": timeout for item: "..bb(TNg))end;self.failedItemRequests[TNg]=true;c8D4n81=nil
CkD73N0(F82,wJ6tY_)else return true end end end end
function KMw7_i1s:initialOnUpdate()self:init()if M then
if self:processItemRequests(M)then return end;M=nil end
if dIZlrvD then if self:processItemRequests(dIZlrvD)then
return end;dIZlrvD=nil end;if cSjJHx then self:init(true)cSjJHx=nil end;if fa then
o5e6fP(b..": finished cache")fa=nil end;self.frame:Hide()end;function KMw7_i1s:scheduleInit()self.initialized=nil;jQgsATKd=0
self.frame:Show()end;function KMw7_i1s:scheduleAuraCheck()jQgsATKd=nHlJ
self.frame:Show()end
local function e7dv(wO9T,QMcSUqdi)local sKy2P9i={}for AkxLdb66 in JEHSHPh3(wO9T)do
Oejsws(sKy2P9i,AkxLdb66)end;table.sort(sKy2P9i,QMcSUqdi)
local S=0
local AD=function()S=S+1
if sKy2P9i[S]==nil then return nil else return sKy2P9i[S],wO9T[sKy2P9i[S]]end end;return AD end
function KMw7_i1s:cacheAllItems()
if(not self.initialized)or dIZlrvD then o5e6fP(b..
": init hasn't finished yet")return end;o5e6fP(b..": starting item cache")
K3ipRr(true)self.frame:Show()end
function KMw7_i1s:startMeasurement(aUR,c4)
if(not self.initialized)or dIZlrvD then o5e6fP(b..
": init hasn't finished yet")return end;if self.measurements then
o5e6fP(b..": measurements already running")return end
o5e6fP(b..": starting measurements")local ZNXs3Bwd,Ginn=uMV17h0("player")local h_pK;local LvBKFXR3
if WZs("player",aUR)then
h_pK=T7RKP[Ginn]LvBKFXR3=SH elseif ITdz("player",aUR)then h_pK=lvW2ga[Ginn]LvBKFXR3=_L6Bs end;self.spellsToMeasure={}
if h_pK then
for FP3j=1,#h_pK do local fe=h_pK[FP3j]local ggnA=Caz4NM4Z(fe)
local KaD2ExEO=rb21L2(ggnA)
if KaD2ExEO then self.spellsToMeasure[ggnA]=KaD2ExEO end end end;self.itemsToMeasure={}
if LvBKFXR3 then
for TpiFT,J in JEHSHPh3(LvBKFXR3)do for CH=1,#J do local sJ05I=J[CH]
local HrLCim=AfwsY(sJ05I)
if HrLCim then self.itemsToMeasure[HrLCim]=sJ05I end end end end;self.measurements=c4;self.measurementUnit=aUR;self.measurementStart=L()
self.lastMeasurements={}self:updateMeasurements()
self.frame:SetScript("OnUpdate",function(w,sUu7z)
self:updateMeasurements()end)self.frame:Show()end
function KMw7_i1s:stopMeasurement()
o5e6fP(b..": stopping measurements")self.frame:Hide()
self.frame:SetScript("OnUpdate",function(M5oB,xIyIKo)
jQgsATKd=jQgsATKd+xIyIKo;if jQgsATKd<nHlJ then return end;jQgsATKd=0;self:initialOnUpdate()end)self.measurements=nil end
function KMw7_i1s:checkItems(f2x,Nwl)if not f2x then return end
for Xpt_SQ,Y in e7dv(f2x)do
for SMa=1,#Y do local Bo=Y[SMa]
local zF6ZPjQ=AfwsY(Bo)
if not zF6ZPjQ then
o5e6fP(b..": "..bb(Bo)..
": "..bb(Xpt_SQ).."yd: |cffeda500not in cache|r")else local nNQG3=JFXtQwy(Bo,"target")
if nNQG3 ==nil or Nwl then if nNQG3 ==nil then
nNQG3="|cffed0000nil|r"end
o5e6fP(b..": "..bb(Bo)..
": "..bb(zF6ZPjQ)..": "..bb(Xpt_SQ)..
"yd: "..bb(nNQG3))end end end end end
function KMw7_i1s:checkSpells(yW,efGM8UMy)if not yW then return end
for KhH=1,#yW do local H4tXd=yW[KhH]
local Nq6If,II,II,II,Y_tefq,i=Caz4NM4Z(H4tXd)
if(not Nq6If)or(Nq6If=="")or(not i)then
o5e6fP(b..": "..
bb(H4tXd)..
": "..bb(i).."yd: |cffeda500invalid spell id|r")else local a3u=self:findSpellIndex(H4tXd)
if not a3u then
o5e6fP(b..
": "..bb(H4tXd)..
": "..bb(Nq6If)..
": "..
bb(Y_tefq).."-"..bb(i).."yd: |cffeda500not in spellbook|r")else local nzhB=dR(a3u,PlwhaRKJ,"target")
if nzhB==nil or efGM8UMy then if nzhB==nil then
nzhB="|cffed0000nil|r"end
o5e6fP(b..
": "..bb(H4tXd)..": "..
bb(Nq6If)..": "..bb(Y_tefq).."-"..bb(i)..
"yd: "..bb(nzhB))end end end end end
function KMw7_i1s:checkAllItems()
o5e6fP(b..": Checking FriendItems...")self:checkItems(_L6Bs,true)
o5e6fP(b..": Checking HarmItems...")self:checkItems(SH,true)end
function KMw7_i1s:checkAllSpells()local sTxVGmb,GSIcq=uMV17h0("player")o5e6fP(b..
": Checking FriendSpells: "..GSIcq)
self:checkSpells(lvW2ga[GSIcq],true)
o5e6fP(b..": Checking HarmSpells..."..GSIcq)self:checkSpells(T7RKP[GSIcq],true)end
function KMw7_i1s:checkAllCheckers()if not AjfoUo("target")then
o5e6fP(b..": Invalid unit, cannot check")return end;local Go,DGf=uMV17h0("player")
if
WZs("player","target")then
o5e6fP(b..": Checking HarmCheckers: "..DGf)self:checkItems(SH)
self:checkSpells(T7RKP[DGf])elseif ITdz("player","target")then
o5e6fP(b..": Checking FriendCheckers: ")self:checkItems(_L6Bs)
self:checkSpells(lvW2ga[DGf])else o5e6fP(b..": Misc unit, cannot check")return end;o5e6fP(b..": done.")end
local function inx0(kgRX7X,JB,GGJhclKa,KWahIz,X2kyW)local pVlvW=0;local QcKn_=1240;if JB then local jiM=QcKn_* (kgRX7X.x-JB.x)local YUdA=QcKn_* (
kgRX7X.y-JB.y)
pVlvW=_G.sqrt(jiM*jiM+YUdA*YUdA)end
o5e6fP(b..
": t="..
("%.4f"):format(kgRX7X.stamp)..
": d=".. ("%.4f"):format(pVlvW)..
": "..bb(GGJhclKa)..": "..bb(KWahIz)..
" ->  "..bb(X2kyW))end;local A5k5yt=GetPlayerMapPosition
function KMw7_i1s:updateMeasurements()
local lx3cpJ=L()-self.measurementStart;local Yx9,Mn=A5k5yt("player")local ut0=self.measurements[0]
local ZFhlP6eg=self.measurements[lx3cpJ]local ExUgDG=self.measurementUnit
for jc4o42jz,jc in JEHSHPh3(self.spellsToMeasure)do
local Ojz_='spell: '..jc4o42jz;local x=self.lastMeasurements[Ojz_]local Xtecl=
(dR(jc,PlwhaRKJ,ExUgDG)==1)and true or false
if x==
nil or x~=Xtecl then
if not ZFhlP6eg then ZFhlP6eg={}
ZFhlP6eg.x,ZFhlP6eg.y,ZFhlP6eg.stamp,ZFhlP6eg.states=Yx9,Mn,lx3cpJ,{}self.measurements[lx3cpJ]=ZFhlP6eg end;inx0(ZFhlP6eg,ut0,Ojz_,x,Xtecl)
ZFhlP6eg.states[Ojz_]=Xtecl;self.lastMeasurements[Ojz_]=Xtecl end end
for KVcYU,_ in JEHSHPh3(self.itemsToMeasure)do local C='item: '..KVcYU
local CJeG=self.lastMeasurements[C]local F43eMG=JFXtQwy(_,ExUgDG)and true or false
if CJeG==
nil or CJeG~=F43eMG then
if not ZFhlP6eg then ZFhlP6eg={}
ZFhlP6eg.x,ZFhlP6eg.y,ZFhlP6eg.stamp,ZFhlP6eg.states=Yx9,Mn,lx3cpJ,{}self.measurements[lx3cpJ]=ZFhlP6eg end;inx0(ZFhlP6eg,ut0,C,CJeG,F43eMG)
ZFhlP6eg.states[C]=F43eMG;self.lastMeasurements[C]=F43eMG end end
for mCzjh4,lU in JEHSHPh3(IN)do local epQue9='interact: '..mCzjh4
local cHUJrj=self.lastMeasurements[epQue9]local EI0x=X(ExUgDG,mCzjh4)and true or false
if
cHUJrj==nil or cHUJrj~=EI0x then
if not ZFhlP6eg then ZFhlP6eg={}
ZFhlP6eg.x,ZFhlP6eg.y,ZFhlP6eg.stamp,ZFhlP6eg.states=Yx9,Mn,lx3cpJ,{}self.measurements[lx3cpJ]=ZFhlP6eg end;inx0(ZFhlP6eg,ut0,epQue9,cHUJrj,EI0x)
ZFhlP6eg.states[epQue9]=EI0x;self.lastMeasurements[epQue9]=EI0x end end end
function KMw7_i1s:activate()
if not self.frame then local ElacOdjf9=CreateFrame("Frame")
self.frame=ElacOdjf9;ElacOdjf9:RegisterEvent("LEARNED_SPELL_IN_TAB")
ElacOdjf9:RegisterEvent("CHARACTER_POINTS_CHANGED")ElacOdjf9:RegisterEvent("PLAYER_TALENT_UPDATE")
ElacOdjf9:RegisterEvent("GLYPH_ADDED")ElacOdjf9:RegisterEvent("GLYPH_REMOVED")
ElacOdjf9:RegisterEvent("GLYPH_UPDATED")ElacOdjf9:RegisterEvent("SPELLS_CHANGED")
local R2h4lP4l,Fh=uMV17h0("player")if Fh=="MAGE"or Fh=="SHAMAN"then
ElacOdjf9:RegisterUnitEvent("UNIT_INVENTORY_CHANGED","player")end end;K3ipRr()
self.frame:SetScript("OnEvent",function(a2e9fa,...)self:OnEvent(...)end)
self.frame:SetScript("OnUpdate",function(Rc9_ZID,H1HF2wD6)jQgsATKd=jQgsATKd+H1HF2wD6
if jQgsATKd<nHlJ then return end;jQgsATKd=0;self:initialOnUpdate()end)self:scheduleInit()end
do local KMw7_i1s=KMw7_i1s
KMw7_i1s.RegisterCallback=KMw7_i1s.RegisterCallback or
function(...)
local hBph=LibStub("CallbackHandler-1.0")KMw7_i1s.RegisterCallback=nil
KMw7_i1s.callbacks=hBph:New(KMw7_i1s)return KMw7_i1s.RegisterCallback(...)end end;KMw7_i1s:activate()KMw7_i1s=nil