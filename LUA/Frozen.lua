local F2tY={PlatesOn=0,enemiesPlate=0,activeUnitPlates={},npcCountFrame=nil}
local rb21L2={["Human"]=0.01,["Dwarf"]=0.02,["NightElf"]=0.03,["Gnome"]=0.04,["Draenei"]=0.05,["Pandaren"]=0.06,["Orc"]=0.07,["Scourge"]=0.08,["Tauren"]=0.09,["Troll"]=0.10,["BloodElf"]=0.11,["Goblin"]=0.12,["Worgen"]=0.13}
local o_v255={Id={[0]=0.00,[250]=0.01,[251]=0.02,[252]=0.03,[577]=0.04,[581]=0.05,[102]=0.06,[103]=0.07,[104]=0.08,[105]=0.09,[253]=0.10,[254]=0.11,[255]=0.12,[62]=0.13,[63]=0.14,[64]=0.15,[268]=0.16,[269]=0.17,[270]=0.18,[65]=0.19,[66]=0.20,[70]=0.21,[256]=0.22,[257]=0.23,[258]=0.24,[259]=0.25,[260]=0.26,[261]=0.27,[262]=0.28,[263]=0.29,[264]=0.30,[265]=0.31,[71]=0.32,[72]=0.33,[73]=0.34,[266]=0.35,[267]=0.36},Spell={[0]="Death Strike",[250]="Death Strike",[251]="Frost Strike",[252]="Festering Strike",[577]="Chaos Strike",[581]="Shear",[102]="Solar Wrath",[103]="Shred",[104]="Mangle",[105]="Solar Wrath",[253]="Counter Shot",[254]="Counter Shot",[255]="Mongoose Bite",[62]="Arcane Blast",[63]="Fireball",[64]="Frostbolt",[268]="Blackout Strike",[269]="Rising Sun Kick",[270]="Rising Sun Kick",[65]="Crusader Strike",[66]="Shield of the Righteous",[70]="Crusader Strike",[256]="Penance",[257]="Smite",[258]="Mind Blast",[259]="Mutilate",[260]="Saber Slash",[261]="Backstab",[262]="Lightning Bolt",[263]="Rockbiter",[264]="Lightning Bolt",[265]="Agony",[71]="Mortal Strike",[72]="Bloodthirst",[73]="Devastate",[266]="Doom",[267]="Incinerate"}}local wUVm=GetCurrentResolution()
local VQ=select(wUVm,GetScreenResolutions())local oTYNsnP,I=strsplit("x",VQ,2)
local LmR5gwW=GetScreenWidth()/oTYNsnP;parent=CreateFrame("frame","Recount",UIParent)
parent:SetSize(40,25)parent:SetPoint("TOPLEFT",0,0)
parent:SetScale(LmR5gwW)parent:RegisterEvent("ADDON_LOADED")
parent:RegisterEvent("NAME_PLATE_UNIT_ADDED")parent:RegisterEvent("PLAYER_ENTERING_WORLD")
parent:RegisterEvent("PLAYER_REGEN_DISABLED")parent:RegisterEvent("PLAYER_REGEN_ENABLED")
parent:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")parent.t=parent:CreateTexture()
parent.t:SetColorTexture(0,0,0,1)parent.t:SetAllPoints(parent)
parent:SetFrameStrata("TOOLTIP")local function DfbW(K,uK)
return(("%%.%df"):format(uK)):format(K)end
local function sh(s0FU)if
UnitIsDead(s0FU)or UnitIsGhost(s0FU)then return 0 end;local wQl=UnitHealth(s0FU)
local g=UnitHealthMax(s0FU)local m4u=ceil((wQl/g)*100)local StZ="0.0"..m4u;if(m4u>=10)then
StZ="0."..m4u end;val=tonumber(StZ)if m4u==100 then val=1 end;return val end;local rrFLbCtj;local YcPea0vg={}local usLpLoaH={}local e7dv={}local inx0={}local A5k5yt={}local B7SHDx7h={}local EEpoeR={}local _k={}
local Ef={}local KfM=0;local Vd=GetSpecialization()local Oynw=0;local QBO={}local s4ggux={}local hrVI4meU={}
local xEq6TAF={}local UIjls={}local jdLnB0vD={}local PSlD={}local nN={}local J={}local A=nil;local g3Qeqnr=nil;local qHpY64={}local z=nil
local qccJ5b=nil;local ARuba={}local Wo53nZ=nil;local XRfQ=nil;local gFPRdEC=nil;local lw9gLt3=nil;local TI5=nil;local JmE={}local s4={}local FFG={}
local a31jEAS={}local LS4h={}local eux092_P={}local ZA9={}local hWgmxm={}local UBg54E=0;local gQGq=0;local OyHc5FEv=0;local Dn1Xi=0;local _gGmBBE=0
local rIX4=nil;local AI14eFhp=1;local iW2O={}local Gdp={}local nbqmx={}local IWQcC,cvRh,W9yaJm=UnitClass("player")
local oJ1ec=0;local LMMNWLk=0;local x6Ni={}local Q2waXkyp=LibStub("LibRangeCheck-2.0")local function EG72()
if
GetCVar("nameplateShowEnemies")=="1"then F2tY.PlatesOn=1 else F2tY.PlatesOn=0 end end
local function mlTMZ()
Oynw=Vd and
select(1,GetSpecializationInfo(GetSpecialization()))or 0;F2tY.enemiesPlate=0;local C1NqzxY=o_v255.Spell[Oynw]
for T1gVrYq,P5G in
pairs(F2tY.activeUnitPlates)do
if P5G~=nil then
if

UnitCanAttack("player",T1gVrYq)and
LibStub("SpellRange-1.0").IsSpellInRange(C1NqzxY,T1gVrYq)==1 and UnitIsDead(T1gVrYq)==false then F2tY.enemiesPlate=F2tY.enemiesPlate+1 end end end;F2tY.enemiesPlate=F2tY.enemiesPlate/100 end;local function q()mlTMZ()EG72()
F2tY.npcCountFrame.t:SetColorTexture(1,F2tY.enemiesPlate,F2tY.PlatesOn,AI14eFhp)end
local function xb6(JC)local PDA=false
for K,qne5Stra in
pairs(F2tY.activeUnitPlates)do F2tY.activeUnitPlates[K]=nil end
for FKLmmhnQ=1,30 do
if
UnitGUID("nameplate"..FKLmmhnQ)~=nil and not UnitIsPlayer("nameplate"..
FKLmmhnQ)then
for F82,wJ6tY_ in pairs(F2tY.activeUnitPlates)do if
wJ6tY_==UnitGUID("nameplate"..FKLmmhnQ)then PDA=true end end
if PDA==false then F2tY.activeUnitPlates["nameplate"..FKLmmhnQ]=UnitGUID("nameplate"..
FKLmmhnQ)PDA=false end end;PDA=false end end;local function yK()
for TNg,wO9T in pairs(F2tY.activeUnitPlates)do if TNg~=UnitGUID("target")then F2tY.activeUnitPlates[TNg]=
nil end end end
PlayerIsInCombat=false
local function rHLz2GD(QMcSUqdi,sKy2P9i,...)if sKy2P9i=="PLAYER_REGEN_ENABLED"then PlayerIsInCombat=false
unitCombatFrame.t:SetColorTexture(1,1,1,AI14eFhp)end;if
sKy2P9i=="PLAYER_REGEN_DISABLED"then PlayerIsInCombat=true
unitCombatFrame.t:SetColorTexture(1,0,0,AI14eFhp)end end
local function BlW0RhJA(S)under=math.floor(S)upper=math.floor(S)+1
underV=- (under-S)upperV=upper-S
if(upperV>underV)then return under else return upper end end
local function Uy()Vd=GetSpecialization()Oynw=Vd and
select(1,GetSpecializationInfo(Vd))or 0
local AD={}AllSeven=false
for AkxLdb66=1,GetMaxTalentTier()do talenetSelected=false
for aUR=1,3 do
local c4=select(4,GetTalentInfo(AkxLdb66,aUR,1))
if(c4 ==true)then AD[AkxLdb66]=aUR/100;talenetSelected=true end
if talenetSelected==false and aUR==3 then AD[AkxLdb66]=0 end end;if AkxLdb66 ==7 then AllSeven=true end end
if not AllSeven then for ZNXs3Bwd=GetMaxTalentTier(),7 do AD[ZNXs3Bwd]=0 end end
Gdp[1].t:SetColorTexture(AD[1],AD[2],AD[3],AI14eFhp)
Gdp[2].t:SetColorTexture(AD[4],AD[5],AD[6],AI14eFhp)
Gdp[3].t:SetColorTexture(AD[7],rb21L2[select(2,UnitRace("player"))],0,AI14eFhp)
Gdp[4].t:SetColorTexture(o_v255.Id[Oynw],0,0,AI14eFhp)end
local function n()if not UnitExists("target")then return end
for Ginn,h_pK in pairs(PlayerBuffs)do
local L=GetSpellInfo(h_pK)
local vBKFXR3,Ginn,Ginn,Ginn,Ginn,Ginn,FP3j,Ginn,Ginn,Ginn,fe=UnitBuff("target",L,nil,"PLAYER")
if(vBKFXR3 ==L and FP3j~=0)then local ggnA=FP3j-GetTime()-
select(4,GetNetStats())/1000
ggnA=DfbW(ggnA,1)local KaD2ExEO,TpiFT=strsplit(".",ggnA)
local JCH=tonumber(KaD2ExEO)/100;local sJ05I=tonumber(TpiFT)/100;if(JCH>1)then JCH=1 end
eux092_P[h_pK].t:SetColorTexture(1,JCH,sJ05I,AI14eFhp)eux092_P[h_pK].t:SetAllPoints(false)else
eux092_P[h_pK].t:SetColorTexture(0,1,1,AI14eFhp)eux092_P[h_pK].t:SetAllPoints(false)end end end
local function TKu()local HrLCim=0;if W9yaJm==2 then
HrLCim=UnitPower("player",SPELL_POWER_HOLY_POWER)end;if W9yaJm==9 then
HrLCim=UnitPower("player",SPELL_POWER_SOUL_SHARDS)end;if W9yaJm==8 then
HrLCim=UnitPower("player",SPELL_POWER_ARCANE_CHARGES)end;if W9yaJm==4 then
HrLCim=UnitPower("player",SPELL_POWER_COMBO_POINTS)end;if W9yaJm==11 then
HrLCim=UnitPower("player",SPELL_POWER_COMBO_POINTS)end
if W9yaJm==6 then
local w=UnitPower("player",SPELL_POWER_RUNES)local sUu7z=6;local M5oB=1
for M5oB=1,w do
local xIyIKo=select(3,GetRuneCooldown(M5oB))if not xIyIKo then sUu7z=sUu7z-1 end end;HrLCim=sUu7z end
if W9yaJm==10 then HrLCim=UnitPower("player",SPELL_POWER_CHI)end;if HrLCim~=_gGmBBE then
unitPowerFrame.t:SetColorTexture(0,HrLCim/100,0,AI14eFhp)unitPowerFrame.t:SetAllPoints(false)
_gGmBBE=HrLCim end end;local M6kL=nil
local function M7o_(f2x,Nwl)local Xpt_SQ=UnitExists("pet")
if
(Xpt_SQ==false or UnitIsDead("pet"))then if(Xpt_SQ~=M6kL)then TI5.t:SetColorTexture(1,1,1,AI14eFhp)
M6kL=Xpt_SQ end else if Xpt_SQ~=M6kL and
not UnitIsDead("player")then
TI5.t:SetColorTexture(1,0,0,AI14eFhp)M6kL=Xpt_SQ end end end
local function dk2X7J7()if

Oynw==270 or Oynw==65 or Oynw==257 or Oynw==256 or Oynw==264 or Oynw==105 then return true else return false end end
local function jv(Y,SMa)
for Bo,zF6ZPjQ in pairs(SpellCooldowns)do local nNQG3,yW,Bo=GetSpellCooldown(zF6ZPjQ)
local efGM8UMy=(nNQG3+yW-
GetTime()-select(4,GetNetStats())/1000)if efGM8UMy<0 then efGM8UMy=0 end;local KhH=GetSpellInfo(zF6ZPjQ)
local H4tXd,Nq6If=IsUsableSpell(KhH)
if efGM8UMy~=0 then efGM8UMy=DfbW(efGM8UMy,1)
local II,Y_tefq=strsplit(".",efGM8UMy)local i=tonumber(II)/100;local a3u=tonumber(Y_tefq)/100
inx0[zF6ZPjQ].t:SetColorTexture(0,i,a3u,AI14eFhp)inx0[zF6ZPjQ].t:SetAllPoints(false)else if(Nq6If and
dk2X7J7())then
inx0[zF6ZPjQ].t:SetColorTexture(0,1,1,AI14eFhp)else
inx0[zF6ZPjQ].t:SetColorTexture(1,1,1,AI14eFhp)end
inx0[zF6ZPjQ].t:SetAllPoints(false)end end end
local function MW(nzhB,sTxVGmb)
for GSIcq,Go in pairs(InventoryItems)do local DGf,kgRX7X,GSIcq=GetItemCooldown(Go)local JB=DGf+kgRX7X-
GetTime()local GGJhclKa=0;if JB<0 then JB=0 end;local KWahIz=0;if
IsEquippedItem(Go)then KWahIz=1 else KWahIz=0 end
local X2kyW=GetItemCount(Go)/100;if X2kyW>=100 then GGJhclKa=1 end;if JB==0 or GGJhclKa==0 then
ZA9[Go].t:SetColorTexture(0,KWahIz,GGJhclKa,AI14eFhp)else
ZA9[Go].t:SetColorTexture(1,KWahIz,GGJhclKa,AI14eFhp)end end end
local function E2OQ(pVlvW,QcKn_)
for jiM,YUdA in pairs(SpellCooldowns)do charges,jiM,jiM,jiM=GetSpellCharges(YUdA)
if
(
YUdA==205406 or YUdA==115072 or YUdA==101546)then charges=GetSpellCount(YUdA)end;if(s4[YUdA]~=charges)then
A5k5yt[YUdA].t:SetColorTexture(0,charges/100,0,AI14eFhp)A5k5yt[YUdA].t:SetAllPoints(false)
s4[YUdA]=charges end end end
local function SnbfLb6(lx3cpJ,Yx9)
for Mn,ut0 in pairs(PlayerBuffs)do local ZFhlP6eg=GetSpellInfo(ut0)if(ZFhlP6eg==nil)then print(
'Unable to find aura (Buff) with Id: '..ut0)
return end
local ExUgDG,Mn,Mn,jc4o42jz,Mn,jc,Ojz_,Mn,Mn,Mn,x=UnitBuff("player",ZFhlP6eg)
if(ut0 ==120694)and UnitBuff("player",ZFhlP6eg)then local Xtecl=0
for wUVm=1,40 do
local ExUgDG,Mn,Mn,Mn,Mn,Mn,Mn,Mn,Mn,Mn,x,Mn,Mn,Mn,Mn,Mn=UnitBuff("player",wUVm)if x==120694 then Xtecl=Xtecl+1 end end;jc4o42jz=Xtecl end
if(ExUgDG==ZFhlP6eg)then local KVcYU=GetTime()
remainingTime=DfbW(Ojz_-KVcYU,1)local _,C=strsplit(".",remainingTime)
local CJeG=tonumber(_)/100;local F43eMG=tonumber(C)/100
B7SHDx7h[ut0].t:SetColorTexture(jc4o42jz/100,CJeG,F43eMG,AI14eFhp)B7SHDx7h[ut0].t:SetAllPoints(false)else
B7SHDx7h[ut0].t:SetColorTexture(1,1,1,AI14eFhp)B7SHDx7h[ut0].t:SetAllPoints(false)end end end
local function ay(mCzjh4,lU)
for epQue9,cHUJrj in pairs(PlayerDebuffs)do local EI0x=GetSpellInfo(cHUJrj)
if EI0x==nil then
if(LS4h[cHUJrj]~=
"DebuffOff")then
jdLnB0vD[cHUJrj].t:SetColorTexture(1,1,1,AI14eFhp)
jdLnB0vD[cHUJrj].t:SetAllPoints(false)LS4h[cHUJrj]="DebuffOff"end;return end
local E,epQue9,epQue9,lacOdjf9,epQue9,R2h4lP4l,Fh,epQue9,epQue9,epQue9,a2e9fa,epQue9,epQue9,epQue9,epQue9,epQue9=UnitDebuff("target",EI0x,nil,"PLAYER|HARMFUL")
if cHUJrj==233490 and(E==EI0x)then local Rc9_ZID=0
for wUVm=1,40 do
name2,epQue9,epQue9,count2,epQue9,R2h4lP4l,expirationTime2,epQue9,epQue9,epQue9,spellId2,epQue9,epQue9,epQue9,epQue9,epQue9=UnitDebuff("target",wUVm,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then Rc9_ZID=Rc9_ZID+1 end end;lacOdjf9=Rc9_ZID end
if(E==EI0x)then local H1HF2wD6=GetTime()
remainingTime=DfbW(Fh-H1HF2wD6,1)
if
(LS4h[cHUJrj]~="DebuffOn"..lacOdjf9 ..remainingTime)then local hBph,bxNo9h=strsplit(".",remainingTime)
local Khst=tonumber(hBph)/100;local pUT=tonumber(bxNo9h)/100;if a2e9fa==34914 then end
jdLnB0vD[cHUJrj].t:SetColorTexture(
lacOdjf9/100,Khst,pUT,AI14eFhp)
LS4h[cHUJrj]="DebuffOn"..lacOdjf9 ..remainingTime end else
if(LS4h[cHUJrj]~="DebuffOff")then
jdLnB0vD[cHUJrj].t:SetColorTexture(1,1,1,AI14eFhp)LS4h[cHUJrj]="DebuffOff"end end end end;local W={}
local function WzM(ISg1,Gh5UJya)
for k,Z8Ue in pairs(SpellCooldowns)do local TXbmx=0;local r,k,k,k,k,k=GetSpellInfo(Z8Ue)if
(r==nil)then TXbmx=0 else
TXbmx=LibStub("SpellRange-1.0").IsSpellInRange(Z8Ue,"target")end
if W[Z8Ue]~=TXbmx then if(TXbmx==1)then
PSlD[Z8Ue].t:SetColorTexture(1,0,0,AI14eFhp)else
PSlD[Z8Ue].t:SetColorTexture(1,1,1,AI14eFhp)end
PSlD[Z8Ue].t:SetAllPoints(false)W[Z8Ue]=TXbmx end end end
local function PSx()
if GetUnitSpeed("Player")==0 then Movetime=GetTime()
PlayerMovingFrame.t:SetColorTexture(1,1,1,AI14eFhp)else
PlayerMovingFrame.t:SetColorTexture(1,0,0,AI14eFhp)end end
local function PSx()mountedplayer=0;moveTime=1;if IsMounted()then mountedplayer=.5 end;if
GetUnitSpeed("Player")==0 then moveTime=0 end
PlayerMovingFrame.t:SetColorTexture(moveTime,mountedplayer,1,AI14eFhp)end
local function IwnA()if IsCurrentSpell(6603)then
AutoAtackingFrame.t:SetColorTexture(1,0,0,AI14eFhp)else
AutoAtackingFrame.t:SetColorTexture(1,1,1,AI14eFhp)end end
local function cW()
if UnitGUID("target")==UnitGUID("player")then
targetIsPlayerFrame.t:SetColorTexture(1,0,0,AI14eFhp)else
targetIsPlayerFrame.t:SetColorTexture(1,1,1,AI14eFhp)end end
local function PHpCof2()if IsOutdoors()then e7dv.t:SetColorTexture(1,0,0,AI14eFhp)else
e7dv.t:SetColorTexture(1,1,1,AI14eFhp)end end;local bUPpn4T2=0
local function sode(Pqgz415t,McNxKV)local WcwGYJh=UnitLevel("player")local gJt=0;local hCs8M=0;local GkjCn_mq=0
local T9sySp="0.0"..WcwGYJh;if(WcwGYJh>=10)then T9sySp="0."..WcwGYJh end
hCs8M=tonumber(T9sySp)if(WcwGYJh>100)then hCs8M=0;WcwGYJh=WcwGYJh-100;local FV5="0.0"..WcwGYJh;if(
WcwGYJh>=10)then FV5="0."..WcwGYJh end
GkjCn_mq=tonumber(FV5)end
local DL0mMXM=UnitHealth("player")local o4Kvi75g=UnitHealthMax("player")
local ELb=ceil((DL0mMXM/o4Kvi75g)*100)
if UnitIsDead("player")or UnitIsGhost("player")then ELb=0 end
if(ELb~=bUPpn4T2)then local sX="0.0"..ELb
if(ELb>=10)then sX="0."..ELb end;gJt=tonumber(sX)
if(ELb==100)then
if(WcwGYJh==100)then
A.t:SetColorTexture(1,1,0,AI14eFhp)else A.t:SetColorTexture(1,hCs8M,GkjCn_mq,AI14eFhp)end else A.t:SetColorTexture(gJt,hCs8M,GkjCn_mq,AI14eFhp)end;bUPpn4T2=ELb end end;local G9zkKODk=0
local function MGt(DH6mUlGB,A4ZRczp)local rUT=UnitHealth("pet")local g=UnitHealthMax("pet")if
g==nil then g=1 end;if g==0 then g=1 end;local JPi=ceil((rUT/g)*100)
if
(G9zkKODk~=JPi)then local Kkl6fa=0;local t="0.0"..JPi;if(JPi>=10)then t="0."..JPi end
Kkl6fa=tonumber(t)if(JPi==100)then
petHealthFrame.t:SetColorTexture(1,0,0,AI14eFhp)else
petHealthFrame.t:SetColorTexture(Kkl6fa,0,0,AI14eFhp)end;G9zkKODk=JPi end end;local ld9GuG4t=0
local function KpCCA(H,glZrOuSo)local Zdzaj=UnitGUID("target")local UxRGyO9e=0;local fvj_L=100;local _CPU89l=0
if
(Zdzaj~=nil)then UxRGyO9e=UnitHealth("target")
fvj_L=UnitHealthMax("target")_CPU89l=ceil((UxRGyO9e/fvj_L)*100)end
if(_CPU89l~=ld9GuG4t)then local U=0;local Kwxn="0.0".._CPU89l;if(_CPU89l>=10)then Kwxn=
"0.".._CPU89l end;U=tonumber(Kwxn)if
(_CPU89l==100)then
targetHealthFrame.t:SetColorTexture(1,0,0,AI14eFhp)else
targetHealthFrame.t:SetColorTexture(U,0,0,AI14eFhp)end
ld9GuG4t=_CPU89l end end
local function H6(yp5DGSwX,Sb1Mw7R)local fuF=UnitPower("player")local pA2=UnitPowerMax("player")
if
(fuF~=KfM)then KfM=fuF
if
(

(W9yaJm==7 and Oynw==264)or(W9yaJm==2)or(W9yaJm==5)or(W9yaJm==8)or(W9yaJm==9)or
(W9yaJm==10 and Oynw==270)or
(W9yaJm==11 and Oynw==102)or(
W9yaJm==11 and Oynw==105))then fuF=ceil((fuF/pA2)*100)end;local M5lAedm=0;local _uYRl2kj=0;local tbN="0.0"..fuF
if(fuF>=10)then tbN="0."..fuF end;M5lAedm=tonumber(tbN)
if(fuF>100)then M5lAedm=0;fuF=fuF-100
local x="0.0"..fuF;if(fuF>=10)then x="0."..fuF end;_uYRl2kj=tonumber(x)end;if(fuF==100)then
powerFrame.t:SetColorTexture(1,0,0,AI14eFhp)else
powerFrame.t:SetColorTexture(M5lAedm,_uYRl2kj,0,AI14eFhp)end end end;local hgsKvTz=0
local function zEt()local m=math.floor(GetHaste())local VVQ=0
if lasthaste==m then return end;lastehaste=m;local Jb=0;if m==math.abs(m)then Jb=1 else Jb=0 end
if(m>=100)then VVQ=math.floor(
m/100)m=m- (VVQ*100)end
local qcpea=math.abs(tonumber(strsub(tostring(m),1,2))/100)Wo53nZ.t:SetColorTexture(Jb,VVQ,qcpea,AI14eFhp)end;local Wjojpvg=true
local function l2PqbWw(tjDBv,vmn7v)isFriend=UnitIsFriend("player","target")
if
(isFriend~=Wjojpvg)then if(isFriend==true)then z.t:SetColorTexture(0,1,0,AI14eFhp)else
z.t:SetColorTexture(0,0,1,AI14eFhp)end;Wjojpvg=isFriend end end;local EJTH9=""
local function qTB82()local Au1mzs=UnitGUID("target")
local u39i=LibStub("LibBossIDs-1.0")local Fdg7p=UnitIsDead("target")local GD3AP=UnitLevel("player")
if
(Au1mzs~=EJTH9)then
if Au1mzs==nil then qccJ5b.t:SetColorTexture(0,0,0,AI14eFhp)else
if
Au1mzs~=nil then
local jph00k,wE_4o,wE_4o,wE_4o,wE_4o,F=strsplit(" - ",UnitGUID("target"))
if u39i.BossIDs[tonumber(F)]then
qccJ5b.t:SetColorTexture(0,0,1,AI14eFhp)elseif jph00k=="Player"then
qccJ5b.t:SetColorTexture(1,0,0,AI14eFhp)elseif not u39i.BossIDs[tonumber(F)]then
if F~=nil then
if
tonumber(F)==114631 or
tonumber(F)==114822 or tonumber(F)==90463 or tonumber(F)==90418 or tonumber(F)==
90431 then
qccJ5b.t:SetColorTexture(0,0,0,AI14eFhp)else qccJ5b.t:SetColorTexture(1,0,0,AI14eFhp)end end elseif(Au1mzs~=nil and Fdg7p==true)then
qccJ5b.t:SetColorTexture(0,0,0,AI14eFhp)end end end;EJTH9=Au1mzs end end;local KL=0;local EATFLbgY=""
local function FF(bUO1NvT,K)spell,_,_,_,_,_,_,castID,_=UnitCastingInfo("player")
name,_,text,_,_,_,_,_=UnitChannelInfo("player")
if castID~=nil then if castID~=KL then
XRfQ.t:SetColorTexture(1,0,0,AI14eFhp)KL=castID end else if castID~=KL then
XRfQ.t:SetColorTexture(1,1,1,AI14eFhp)KL=castID end end
if name~=nil then if text~=EATFLbgY then
XRfQ.t:SetColorTexture(0,1,0,AI14eFhp)EATFLbgY=text end else if text~=EATFLbgY then
XRfQ.t:SetColorTexture(1,1,1,AI14eFhp)EATFLbgY=text end end end
local function rh(RQG,tVwI_N)return math.abs(tVwI_N-GetTime()*1000)/
math.abs(tVwI_N-RQG)end
local function YcCR(Jkp2lGXG,ifcyuS)
spell,_,_,_,startTime,endTime,_,_,notInterrupt=UnitCastingInfo("target")if(spell==nil)then
spell,_,_,_,startTime,endTime,_,notInterrupt=UnitChannelInfo("target")end
if spell~=nil then
if notInterrupt==false then
gFPRdEC.t:SetColorTexture(1,rh(startTime,endTime),1,AI14eFhp)else
gFPRdEC.t:SetColorTexture(0,rh(startTime,endTime),1,AI14eFhp)end else if spell==nil then
gFPRdEC.t:SetColorTexture(0,0,0,AI14eFhp)end end end
local function G3p2Yn()wilds=tonumber("0.0"..oJ1ec)
dreadstalkers=tonumber("0.0"..LMMNWLk)
g3Qeqnr.t:SetColorTexture(wilds,0,dreadstalkers,AI14eFhp)end;local _jkkD9=nil
local function D(V03W,R)local X6_=UnitIsVisible("target")
if X6_==nil then if(X6_~=_jkkD9)then
lw9gLt3.t:SetColorTexture(1,1,1,AI14eFhp)_jkkD9=X6_ end else if X6_~=_jkkD9 then
lw9gLt3.t:SetColorTexture(1,0,0,AI14eFhp)_jkkD9=X6_ end end end
local function DMn(tN5u,Yqc0GWr,...)if(Yqc0GWr=="UNIT_SPELLCAST_SUCCEEDED")then
UpdateCastingFrame("player",Ef,...)end end
local function GBzFRjVV()UpdateCastingFrame("target",s4ggux)end
local function pG4C8fDK()UpdateCastingFrame("arena1",hrVI4meU)end
local function LLFUU()UpdateCastingFrame("arena2",xEq6TAF)end
local function kdmQtj6()UpdateCastingFrame("arena3",UIjls)end
local function Hc35_(UC7,WbvvcjER)
for rOLxXC,w762p7sZ in pairs(PlayerBuffs)do local _7jt=GetSpellInfo(w762p7sZ)
if _7jt==nil then if(
a31jEAS[w762p7sZ]~="BuffOff")then
_k[w762p7sZ].t:SetColorTexture(1,1,1,AI14eFhp)_k[w762p7sZ].t:SetAllPoints(false)
a31jEAS[w762p7sZ]="BuffOff"end
return end;local ORXyFQ,rOLxXC,rOLxXC,OL1oV,rOLxXC,rOLxXC,Q,rOLxXC,rOLxXC,rOLxXC,rOLxXC=UnitBuff("pet",_7jt)
if
(ORXyFQ==_7jt)then local HQvT5=GetTime()remainingTime=DfbW(Q-HQvT5,1)
if
(a31jEAS[w762p7sZ]~=
"BuffOn"..OL1oV..remainingTime)then local dN,B35igHj=strsplit(".",remainingTime)
local o8pPC2=tonumber(dN)/100;local f7nUIW=tonumber(B35igHj)/100
_k[w762p7sZ].t:SetColorTexture(
OL1oV/100,o8pPC2,f7nUIW,AI14eFhp)_k[w762p7sZ].t:SetAllPoints(false)end else if(a31jEAS[w762p7sZ]~="BuffOff")then
_k[w762p7sZ].t:SetColorTexture(1,1,1,AI14eFhp)_k[w762p7sZ].t:SetAllPoints(false)
a31jEAS[w762p7sZ]="BuffOff"end end end end
local function ubP(bDgD,Kg8PhSq)
for Tcv_,lygY in pairs(PlayerDebuffs)do local HG="UnitDebuff"local u=GetSpellInfo(lygY)
if u==nil then if(
QBO[lygY]~="DebuffOff")then
EEpoeR[lygY].t:SetColorTexture(1,1,1,AI14eFhp)EEpoeR[lygY].t:SetAllPoints(false)
QBO[lygY]="DebuffOff"end;return end
local m9i,Tcv_,Tcv_,EqPMP,Tcv_,Tcv_,JR,Tcv_,Tcv_,Tcv_,G1Cl6,Tcv_,Tcv_,Tcv_,Tcv_,Tcv_=UnitDebuff("player",u,nil,"PLAYER|HARMFUL")
if(m9i==u)then local h=GetTime()local fYUikw=math.floor(JR-h+0.5)
if(
QBO[lygY]~="DebuffOn"..EqPMP..fYUikw)then QBO[lygY]=
"DebuffOn"..EqPMP..fYUikw
fYUikw=string.format("%00.2f",tostring(fYUikw))
local W9qTCm=tonumber(strsub(tostring(fYUikw),1,2))/100
local YlaSjEKp=tonumber(strsub(tostring(fYUikw),-2,-1))/100
EEpoeR[lygY].t:SetColorTexture(EqPMP/100,W9qTCm,YlaSjEKp,AI14eFhp)EEpoeR[lygY].t:SetAllPoints(false)end else if(QBO[lygY]~="DebuffOff")then
EEpoeR[lygY].t:SetColorTexture(1,1,1,AI14eFhp)EEpoeR[lygY].t:SetAllPoints(false)
QBO[lygY]="DebuffOff"end end end end
local function eN0UMW(u_ogp8,K)
for ob,a3 in pairs(SpellCooldowns)do
if IsSpellOverlayed(a3)then
iW2O[a3].t:SetColorTexture(1,0,0,AI14eFhp)iW2O[a3].t:SetAllPoints(false)else
iW2O[a3].t:SetColorTexture(1,1,1,AI14eFhp)iW2O[a3].t:SetAllPoints(false)end end end
local function lAG(MvWxr)
for HgY6,Wc in pairs(dispel)do local eQ5=GetSpellInfo(Wc)if eQ5 ==nil then return 0 end
local kvR,HgY6,HgY6,So,HgY6,Wi,X1WM,HgY6,HgY6,HgY6,Wc,HgY6,HgY6,HgY6,HgY6,HgY6=UnitDebuff(MvWxr,eQ5,
nil,"HARMFUL")if(kvR==eQ5)then return 1 end end;return 0 end;local AvEtR8Y=""
local function rl3MMqfm()if dk2X7J7()==false then return end
local OVBAVy,Jos=IsActiveBattlefieldArena()local NF0=IsInRaid()and"raid"or"party"
local OeF=GetNumGroupMembers()if(AvEtR8Y~=NF0)then SetupKeybinds()if OeF==0 then NF0="solo"end
AvEtR8Y=NF0 end;local sawaLtSr="0.0"..OeF;if(OeF>=10)then sawaLtSr=
"0."..OeF end
if(IsInRaid())then
inGame.t:SetColorTexture(tonumber(sawaLtSr),1,1,AI14eFhp)else if OVBAVy==1 then
inGame.t:SetColorTexture(tonumber(sawaLtSr),1,0.5,AI14eFhp)else
inGame.t:SetColorTexture(tonumber(sawaLtSr),1,0,AI14eFhp)end end
if(OeF==0)then health=UnitHealth("player")
maxHealth=UnitHealthMax("player")
percHealth=ceil((health/maxHealth)*100)needToDispel=lAG("player")local KWeL="0.0"..percHealth;if
(percHealth>=10)then KWeL="0."..percHealth end
red=tonumber(KWeL)
for K=1,5 do if(percHealth==100)then
nbqmx[K].t:SetColorTexture(1,needToDispel,0,AI14eFhp)else
nbqmx[K].t:SetColorTexture(red,needToDispel,0,AI14eFhp)end end;return end
for rvhod9t=1,OeF do local bfx5oN=0;local XDKTNXw=0
if(NF0 =="party")then
if(rvhod9t==1)then
health=UnitHealth("player")maxHealth=UnitHealthMax("player")
bfx5oN=ceil((health/maxHealth)*100)XDKTNXw=lAG("player")else
health=UnitHealth(NF0 .. (rvhod9t-1))maxHealth=UnitHealthMax(NF0 .. (rvhod9t-1))bfx5oN=ceil((
health/maxHealth)*100)XDKTNXw=lAG(NF0 .. (
rvhod9t-1))local ImqF1v,K=Q2waXkyp:GetRange(NF0 ..
(rvhod9t-1))
if(K==nil)then K=41 end
if


UnitIsDead(NF0 .. (rvhod9t-1))or
UnitIsGhost(NF0 .. (rvhod9t-1))or
UnitIsConnected(NF0 .. (rvhod9t-1))==false or UnitInPhase(NF0 .. (rvhod9t-1))==false or K>40 then bfx5oN=100;XDKTNXw=0 end end end
if(NF0 =="raid")then health=UnitHealth(NF0 ..rvhod9t)maxHealth=UnitHealthMax(
NF0 ..rvhod9t)bfx5oN=ceil((health/maxHealth)*
100)
XDKTNXw=lAG(NF0 ..rvhod9t)local Ru,Vy5qF=Q2waXkyp:GetRange(NF0 ..rvhod9t)if
(Vy5qF==nil)then Vy5qF=41 end
if

UnitIsDead(NF0 ..rvhod9t)or
UnitIsGhost(NF0 ..rvhod9t)or
UnitIsConnected(NF0 ..rvhod9t)==false or
UnitInPhase(NF0 ..rvhod9t)==false or Vy5qF>40 then bfx5oN=100;XDKTNXw=0 end end;local RyTb="0.0"..bfx5oN
if(bfx5oN>=10)then RyTb="0."..bfx5oN end;red=tonumber(RyTb)if(bfx5oN==100)then
nbqmx[rvhod9t].t:SetColorTexture(1,XDKTNXw,0,AI14eFhp)else
nbqmx[rvhod9t].t:SetColorTexture(red,XDKTNXw,0,AI14eFhp)end
nbqmx[rvhod9t].t:SetAllPoints(false)end end;inGame=CreateFrame("frame","",parent)
inGame:SetSize(1,1)inGame:SetPoint("TOPLEFT",30,0)
inGame.t=inGame:CreateTexture()inGame.t:SetColorTexture(0,1,0,AI14eFhp)
inGame.t:SetAllPoints(inGame)inGame:Show()
startStopFrame=CreateFrame("frame","",parent)startStopFrame:SetSize(1,1)
startStopFrame:SetPoint("TOPLEFT",29,0)startStopFrame.t=startStopFrame:CreateTexture()
startStopFrame.t:SetColorTexture(0,0,0,AI14eFhp)
startStopFrame.t:SetAllPoints(startStopFrame)startStopFrame:Show()
rangeToTargetFrame=CreateFrame("frame","",parent)rangeToTargetFrame:SetSize(1,1)
rangeToTargetFrame:SetPoint("TOPLEFT",28,0)
rangeToTargetFrame.t=rangeToTargetFrame:CreateTexture()
rangeToTargetFrame.t:SetColorTexture(0,0,0,AI14eFhp)
rangeToTargetFrame.t:SetAllPoints(rangeToTargetFrame)rangeToTargetFrame:Show()
local function nQj()rl3MMqfm()end
local function Eq8jDq()local rokDhenZ,td8OL=Q2waXkyp:GetRange("target")
if td8OL==nil then td8OL=100 end;local rokDhenZ,WCS=Q2waXkyp:GetRange("pet")
if WCS==nil then WCS=100 end;local i="0.0"..WCS;if(WCS>=10)then i="0."..WCS end
green=tonumber(i)local v2VylMn="0.0"..td8OL
if(td8OL>=10)then v2VylMn="0."..td8OL end;red=tonumber(v2VylMn)if(WCS>=100)then green=1 end;if
(td8OL>=100)then red=1 end;blue=0
if(UnitExists("Focus"))then blue=1 end
rangeToTargetFrame.t:SetColorTexture(red,green,blue,AI14eFhp)end;function UpdateHealthFrame(Oi,KwcrRu)local bgFJ=sh(Oi)
KwcrRu.t:SetColorTexture(bgFJ,0,0,AI14eFhp)end
function UpdateDebuffFrame(fqGD1rfW,K0)
for _1To2,lkzs in
pairs(PlayerDebuffs)do local Hhwf3oO=GetSpellInfo(lkzs)if Hhwf3oO==nil then
YcPea0vg[lkzs].t:SetColorTexture(0,0,0,AI14eFhp)return end
local Oh5,_1To2,_1To2,LgQF,_1To2,emGbhJGH,e_Ev8OQ,_1To2,_1To2,_1To2,zBMvU6,_1To2,_1To2,_1To2,_1To2,_1To2=UnitDebuff(fqGD1rfW,Hhwf3oO,nil,"PLAYER|HARMFUL")
if lkzs==233490 and(Oh5 ==Hhwf3oO)then local ZmbDgbg=0
for wUVm=1,40 do
_1To2,_1To2,_1To2,_1To2,_1To2,_1To2,_1To2,_1To2,_1To2,_1To2,spellId2,_1To2,_1To2,_1To2,_1To2,_1To2=UnitDebuff(fqGD1rfW,wUVm,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then ZmbDgbg=ZmbDgbg+1 end end;LgQF=ZmbDgbg end
if(Oh5 ==Hhwf3oO)then local hMxy=GetTime()
remainingTime=DfbW(e_Ev8OQ-hMxy,1)local hj3,M7q3pa8=strsplit(".",remainingTime)
local guEhw=tonumber(hj3)/100;local sll=tonumber(M7q3pa8)/100
K0[lkzs].t:SetColorTexture(1,guEhw,sll,AI14eFhp)else K0[lkzs].t:SetColorTexture(0,0,0,AI14eFhp)end end end
function UpdateCastingFrame(BzNBgGvD,KIQCH,...)if not UnitExists(BzNBgGvD)then return end
local L4bw=select(10,UnitCastingInfo(BzNBgGvD))
if L4bw==nil then local w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,RRESd=...L4bw=RRESd end
if L4bw==nil then for S1qoVmFR=1,2 do
KIQCH[S1qoVmFR].t:SetColorTexture(0,0,0,AI14eFhp)end;return end;local XhBEPD=""local Uq=""local RmyiI_D=""
for f2=1,2 do
if(f2 ==1)then strRedTemp=strsub(L4bw,1,1)if
(strRedTemp=="")then XhBEPD=1 else XhBEPD="0."..strRedTemp end
strGreenTemp=strsub(L4bw,2,2)
if(strGreenTemp=="")then RmyiI_D=1 else RmyiI_D="0."..strGreenTemp end;strBlueTemp=strsub(L4bw,3,3)if(strBlueTemp=="")then Uq=1 else
Uq="0."..strBlueTemp end end
if(f2 ==2)then strRedTemp=strsub(L4bw,4,4)if(strRedTemp=="")then XhBEPD=1 else XhBEPD="0."..
strRedTemp end
strGreenTemp=strsub(L4bw,5,5)
if(strGreenTemp=="")then RmyiI_D=1 else RmyiI_D="0."..strGreenTemp end;strBlueTemp=strsub(L4bw,6,6)if(strBlueTemp=="")then Uq=1 else
Uq="0."..strBlueTemp end end;local O3rHR=tonumber(XhBEPD)local YU80=tonumber(RmyiI_D)
local ARnO_0E=tonumber(Uq)
KIQCH[f2].t:SetColorTexture(O3rHR,YU80,ARnO_0E,AI14eFhp)end end
function FocusPulse()UpdateHealthFrame("focus",rrFLbCtj)
UpdateDebuffFrame("focus",YcPea0vg)UpdateCastingFrame("focus",usLpLoaH)end;local LnQUN=0;function update(Qh,lqxbMC)LnQUN=LnQUN+lqxbMC
if LnQUN>=0.2 then Eq8jDq()nQj()if
(UnitExists("Focus"))then FocusPulse()end;LnQUN=0 end end
local function Gm1()
local qOk5Jm=0;A=CreateFrame("frame","",parent)A:SetSize(1,1)
A:SetPoint("TOPLEFT",0,0)A.t=A:CreateTexture()
A.t:SetColorTexture(1,1,1,AI14eFhp)A.t:SetAllPoints(A)A:Show()
A:RegisterEvent("PLAYER_ENTERING_WORLD")A:RegisterEvent("PLAYER_REGEN_ENABLED")
A:RegisterEvent("PLAYER_REGEN_DISABLED")A:RegisterUnitEvent("UNIT_HEALTH","player")
A:RegisterEvent("PLAYER_TARGET_CHANGED")A:SetScript("OnEvent",sode)
powerFrame=CreateFrame("frame","",parent)powerFrame:SetSize(1,1)
powerFrame:SetPoint("TOPLEFT",1,0)powerFrame.t=powerFrame:CreateTexture()
powerFrame.t:SetColorTexture(1,1,1,AI14eFhp)powerFrame.t:SetAllPoints(powerFrame)
powerFrame:Show()
powerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
powerFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
powerFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
powerFrame:RegisterUnitEvent("UNIT_POWER","player")powerFrame:SetScript("OnEvent",H6)
targetHealthFrame=CreateFrame("frame","",parent)targetHealthFrame:SetSize(1,1)
targetHealthFrame:SetPoint("TOPLEFT",2,0)
targetHealthFrame.t=targetHealthFrame:CreateTexture()
targetHealthFrame.t:SetColorTexture(1,1,1,AI14eFhp)
targetHealthFrame.t:SetAllPoints(targetHealthFrame)targetHealthFrame:Show()
targetHealthFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
targetHealthFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
targetHealthFrame:RegisterEvent("UNIT_HEALTH","target")
targetHealthFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
targetHealthFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
targetHealthFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")targetHealthFrame:SetScript("OnEvent",KpCCA)
unitCombatFrame=CreateFrame("frame","",parent)unitCombatFrame:SetSize(1,1)
unitCombatFrame:SetPoint("TOPLEFT",3,0)
unitCombatFrame.t=unitCombatFrame:CreateTexture()
unitCombatFrame.t:SetColorTexture(1,1,1,AI14eFhp)
unitCombatFrame.t:SetAllPoints(unitCombatFrame)unitCombatFrame:Show()
unitCombatFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
unitCombatFrame:RegisterEvent("PLAYER_REGEN_DISABLED")unitCombatFrame:SetScript("OnEvent",rHLz2GD)
unitPowerFrame=CreateFrame("frame","",parent)unitPowerFrame:SetSize(1,1)
unitPowerFrame:SetPoint("TOPLEFT",4,0)unitPowerFrame.t=unitPowerFrame:CreateTexture()
unitPowerFrame.t:SetColorTexture(0,0,0,AI14eFhp)
unitPowerFrame.t:SetAllPoints(unitPowerFrame)unitPowerFrame:Show()
unitPowerFrame:SetScript("OnUpdate",TKu)z=CreateFrame("frame","",parent)z:SetSize(1,1)
z:SetPoint("TOPLEFT",5,0)z.t=z:CreateTexture()
z.t:SetColorTexture(0,1,0,AI14eFhp)z.t:SetAllPoints(z)z:Show()
z:RegisterEvent("PLAYER_REGEN_ENABLED")z:RegisterEvent("PLAYER_REGEN_DISABLED")
z:RegisterEvent("UNIT_HEALTH","target")z:RegisterEvent("PLAYER_TARGET_CHANGED")
z:RegisterEvent("PLAYER_ENTER_COMBAT")z:RegisterEvent("PLAYER_LEAVE_COMBAT")
z:SetScript("OnEvent",l2PqbWw)qccJ5b=CreateFrame("frame","",parent)
qccJ5b:SetSize(1,1)qccJ5b:SetPoint("TOPLEFT",6,0)
qccJ5b.t=qccJ5b:CreateTexture()qccJ5b.t:SetColorTexture(0,1,0,AI14eFhp)
qccJ5b.t:SetAllPoints(qccJ5b)qccJ5b:Show()
qccJ5b:RegisterEvent("PLAYER_TARGET_CHANGED")qccJ5b:RegisterEvent("PLAYER_ENTER_COMBAT")
qccJ5b:RegisterEvent("PLAYER_LEAVE_COMBAT")qccJ5b:SetScript("OnEvent",qTB82)
XRfQ=CreateFrame("frame","",parent)XRfQ:SetSize(1,1)XRfQ:SetPoint("TOPLEFT",7,0)
XRfQ.t=XRfQ:CreateTexture()XRfQ.t:SetColorTexture(1,1,1,AI14eFhp)
XRfQ.t:SetAllPoints(XRfQ)XRfQ:Show()XRfQ:SetScript("OnUpdate",FF)
gFPRdEC=CreateFrame("frame","",parent)gFPRdEC:SetSize(1,1)
gFPRdEC:SetPoint("TOPLEFT",8,0)gFPRdEC.t=gFPRdEC:CreateTexture()
gFPRdEC.t:SetColorTexture(1,1,1,AI14eFhp)gFPRdEC.t:SetAllPoints(gFPRdEC)
gFPRdEC:Show()gFPRdEC:SetScript("OnUpdate",YcCR)
Wo53nZ=CreateFrame("frame","",parent)Wo53nZ:SetSize(1,1)
Wo53nZ:SetPoint("TOPLEFT",9,0)Wo53nZ.t=Wo53nZ:CreateTexture()
Wo53nZ.t:SetColorTexture(1,1,1,AI14eFhp)Wo53nZ.t:SetAllPoints(Wo53nZ)Wo53nZ:Show()
Wo53nZ:RegisterEvent("PLAYER_ENTERING_WORLD")
Wo53nZ:RegisterUnitEvent("UNIT_SPELL_HASTE","player")Wo53nZ:SetScript("OnUpdate",zEt)
lw9gLt3=CreateFrame("frame","",parent)lw9gLt3:SetSize(1,1)
lw9gLt3:SetPoint("TOPLEFT",10,0)lw9gLt3.t=lw9gLt3:CreateTexture()
lw9gLt3.t:SetColorTexture(0,1,0,AI14eFhp)lw9gLt3.t:SetAllPoints(lw9gLt3)
lw9gLt3:Show()lw9gLt3:SetScript("OnUpdate",D)
if
(
W9yaJm==6 or W9yaJm==3 or W9yaJm==9 or W9yaJm==8 or W9yaJm==7)then TI5=CreateFrame("frame","",parent)TI5:SetSize(1,1)
TI5:SetPoint("TOPLEFT",11,0)TI5.t=TI5:CreateTexture()
TI5.t:SetColorTexture(0,1,0,AI14eFhp)TI5.t:SetAllPoints(TI5)TI5:Show()
TI5:SetScript("OnUpdate",M7o_)petHealthFrame=CreateFrame("frame","",parent)
petHealthFrame:SetSize(1,1)petHealthFrame:SetPoint("TOPLEFT",12,0)
petHealthFrame.t=petHealthFrame:CreateTexture()
petHealthFrame.t:SetColorTexture(1,1,1,AI14eFhp)
petHealthFrame.t:SetAllPoints(petHealthFrame)petHealthFrame:Show()
petHealthFrame:RegisterEvent("UNIT_HEALTH","pet")petHealthFrame:SetScript("OnEvent",MGt)
g3Qeqnr=CreateFrame("frame","",parent)g3Qeqnr:SetSize(1,1)
g3Qeqnr:SetPoint("TOPLEFT",13,0)g3Qeqnr.t=g3Qeqnr:CreateTexture()
g3Qeqnr.t:SetColorTexture(0,1,0,AI14eFhp)g3Qeqnr.t:SetAllPoints(g3Qeqnr)
g3Qeqnr:Show()g3Qeqnr:SetScript("OnUpdate",G3p2Yn)local qOk5Jm=0
for tpSe2fs,AuVgc7 in
pairs(PlayerBuffs)do _k[AuVgc7]=CreateFrame("frame","",parent)
_k[AuVgc7]:SetSize(1,1)_k[AuVgc7]:SetPoint("TOPLEFT",qOk5Jm,-9)
_k[AuVgc7].t=_k[AuVgc7]:CreateTexture()
_k[AuVgc7].t:SetColorTexture(1,1,1,AI14eFhp)_k[AuVgc7].t:SetAllPoints(_k[AuVgc7])
_k[AuVgc7]:Show()qOk5Jm=qOk5Jm+1 end
_k[table.maxn(_k)]:SetScript("OnUpdate",Hc35_)end;qOk5Jm=0
for vxnB,ZQOXXXd in pairs(SpellCooldowns)do
inx0[ZQOXXXd]=CreateFrame("frame","",parent)inx0[ZQOXXXd]:SetSize(1,1)inx0[ZQOXXXd]:SetPoint("TOPLEFT",qOk5Jm,
-1)
inx0[ZQOXXXd].t=inx0[ZQOXXXd]:CreateTexture()
inx0[ZQOXXXd].t:SetColorTexture(1,1,1,AI14eFhp)
inx0[ZQOXXXd].t:SetAllPoints(inx0[ZQOXXXd])inx0[ZQOXXXd]:Show()qOk5Jm=qOk5Jm+1 end
inx0[table.maxn(inx0)]:SetScript("OnUpdate",jv)qOk5Jm=0
for cyBmTv,_TKd0F in pairs(SpellCooldowns)do
PSlD[_TKd0F]=CreateFrame("frame","",parent)PSlD[_TKd0F]:SetSize(1,1)PSlD[_TKd0F]:SetPoint("TOPLEFT",qOk5Jm,
-2)
PSlD[_TKd0F].t=PSlD[_TKd0F]:CreateTexture()
PSlD[_TKd0F].t:SetColorTexture(1,1,1,AI14eFhp)
PSlD[_TKd0F].t:SetAllPoints(PSlD[_TKd0F])PSlD[_TKd0F]:Show()qOk5Jm=qOk5Jm+1 end
PSlD[table.maxn(PSlD)]:SetScript("OnUpdate",WzM)qOk5Jm=0
for Z,Dw in pairs(PlayerDebuffs)do
jdLnB0vD[Dw]=CreateFrame("frame","",parent)jdLnB0vD[Dw]:SetSize(1,1)jdLnB0vD[Dw]:SetPoint("TOPLEFT",qOk5Jm,
-3)
jdLnB0vD[Dw].t=jdLnB0vD[Dw]:CreateTexture()
jdLnB0vD[Dw].t:SetColorTexture(1,1,1,AI14eFhp)
jdLnB0vD[Dw].t:SetAllPoints(jdLnB0vD[Dw])jdLnB0vD[Dw]:Show()qOk5Jm=qOk5Jm+1 end
jdLnB0vD[table.maxn(jdLnB0vD)]:SetScript("OnUpdate",ay)qOk5Jm=0
for bsFpM,h in pairs(SpellCooldowns)do
A5k5yt[h]=CreateFrame("frame","",parent)A5k5yt[h]:SetSize(1,1)
A5k5yt[h]:SetPoint("TOPLEFT",qOk5Jm,-4)A5k5yt[h].t=A5k5yt[h]:CreateTexture()
A5k5yt[h].t:SetColorTexture(1,1,1,AI14eFhp)A5k5yt[h].t:SetAllPoints(A5k5yt[h])
A5k5yt[h]:Show()qOk5Jm=qOk5Jm+1 end
A5k5yt[table.maxn(A5k5yt)]:RegisterEvent("ACTIONBAR_UPDATE_STATE")
A5k5yt[table.maxn(A5k5yt)]:SetScript("OnEvent",E2OQ)qOk5Jm=0
for doBTofya,rNP in pairs(PlayerBuffs)do
eux092_P[rNP]=CreateFrame("frame","",parent)eux092_P[rNP]:SetSize(1,1)eux092_P[rNP]:SetPoint("TOPLEFT",qOk5Jm,
-5)
eux092_P[rNP].t=eux092_P[rNP]:CreateTexture()
eux092_P[rNP].t:SetColorTexture(0,1,1,AI14eFhp)
eux092_P[rNP].t:SetAllPoints(eux092_P[rNP])eux092_P[rNP]:Show()qOk5Jm=qOk5Jm+1 end
eux092_P[table.maxn(eux092_P)]:SetScript("OnUpdate",n)PlayerMovingFrame=CreateFrame("frame","",parent)
PlayerMovingFrame:SetSize(1,1)PlayerMovingFrame:SetPoint("TOPLEFT",0,-6)
PlayerMovingFrame.t=PlayerMovingFrame:CreateTexture()
PlayerMovingFrame.t:SetColorTexture(1,1,1,AI14eFhp)
PlayerMovingFrame.t:SetAllPoints(PlayerMovingFrame)PlayerMovingFrame:Show()
PlayerMovingFrame:SetScript("OnUpdate",PSx)AutoAtackingFrame=CreateFrame("frame","",parent)
AutoAtackingFrame:SetSize(1,1)AutoAtackingFrame:SetPoint("TOPLEFT",1,-6)
AutoAtackingFrame.t=AutoAtackingFrame:CreateTexture()
AutoAtackingFrame.t:SetColorTexture(1,1,1,AI14eFhp)
AutoAtackingFrame.t:SetAllPoints(AutoAtackingFrame)AutoAtackingFrame:Show()
AutoAtackingFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
AutoAtackingFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
AutoAtackingFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")AutoAtackingFrame:SetScript("OnEvent",IwnA)
targetIsPlayerFrame=CreateFrame("frame","",parent)targetIsPlayerFrame:SetSize(1,1)targetIsPlayerFrame:SetPoint("TOPLEFT",2,
-6)
targetIsPlayerFrame.t=targetIsPlayerFrame:CreateTexture()
targetIsPlayerFrame.t:SetColorTexture(1,1,1,AI14eFhp)
targetIsPlayerFrame.t:SetAllPoints(targetIsPlayerFrame)targetIsPlayerFrame:Show()
targetIsPlayerFrame:RegisterEvent("PLAYER_TARGET_CHANGED")targetIsPlayerFrame:SetScript("OnEvent",cW)
e7dv=CreateFrame("frame","",parent)e7dv:SetSize(1,1)e7dv:SetPoint("TOPLEFT",3,-6)
e7dv.t=e7dv:CreateTexture()e7dv.t:SetColorTexture(1,1,1,AI14eFhp)
e7dv.t:SetAllPoints(e7dv)e7dv:Show()e7dv:SetScript("OnUpdate",PHpCof2)end
function GetKeyBinding(TL)local Tzgj_W
if TL<=24 or TL>72 then
Tzgj_W="ACTIONBUTTON".. (((TL-1)%12)+1)elseif TL<=36 then Tzgj_W="MULTIACTIONBAR3BUTTON".. (TL-24)elseif TL<=48 then Tzgj_W=
"MULTIACTIONBAR4BUTTON".. (TL-36)elseif TL<=60 then
Tzgj_W="MULTIACTIONBAR2BUTTON".. (TL-48)else Tzgj_W="MULTIACTIONBAR1BUTTON".. (TL-60)end;local g0AS39=Tzgj_W and GetBindingKey(Tzgj_W)
if g0AS39 and
strlen(g0AS39)>4 then g0AS39=strupper(g0AS39)
g0AS39=gsub(g0AS39,"%s+","")g0AS39=gsub(g0AS39,"ALT%-","A|")
g0AS39=gsub(g0AS39,"CTRL%-","C|")g0AS39=gsub(g0AS39,"SHIFT%-","S|")
g0AS39=gsub(g0AS39,"NUMPAD","N")g0AS39=gsub(g0AS39,"PLUS","+")
g0AS39=gsub(g0AS39,"MINUS","-")g0AS39=gsub(g0AS39,"MULTIPLY","*")
g0AS39=gsub(g0AS39,"DIVIDE","/")end
if g0AS39 ~=nil then else
if Bartender4 then
Tzgj_W="CLICK BT4Button"..TL..":LeftButton"g0AS39=Tzgj_W and GetBindingKey(Tzgj_W)
if g0AS39 and
strlen(g0AS39)>4 then g0AS39=strupper(g0AS39)
g0AS39=gsub(g0AS39,"%s+","")g0AS39=gsub(g0AS39,"ALT%-","A|")
g0AS39=gsub(g0AS39,"CTRL%-","C|")g0AS39=gsub(g0AS39,"SHIFT%-","S|")
g0AS39=gsub(g0AS39,"NUMPAD","N")g0AS39=gsub(g0AS39,"PLUS","+")
g0AS39=gsub(g0AS39,"MINUS","-")g0AS39=gsub(g0AS39,"MULTIPLY","*")
g0AS39=gsub(g0AS39,"DIVIDE","/")end end end;return g0AS39 end
function KeyModifierColor(t2)local PDewNmM=strfind(t2,"|")
if(PDewNmM~=nil)then
local GFlD=strsub(t2,1,PDewNmM-1)if(GFlD=="S")then return 0.01 end;if(GFlD=="C")then return 0.02 end;if(
GFlD=="A")then return 0.03 end end;return 1 end
function KeyBindColor(y3owm5E)local psHOEe2=strfind(y3owm5E,"|")if(psHOEe2 ~=nil)then
y3owm5E=strsub(y3owm5E,psHOEe2+1)end
if y3owm5E=="\\"then return 0.01 elseif y3owm5E=="["then return 0.02 elseif
y3owm5E=="]"then return 0.03 elseif y3owm5E==";"then return 0.04 elseif y3owm5E=="'"then return 0.05 elseif y3owm5E==","then return 0.06 elseif y3owm5E=="."then return
0.07 elseif y3owm5E=="/"then return 0.08 elseif y3owm5E=="`"then return 0.09 elseif y3owm5E=="-"then return 0.10 elseif y3owm5E=="="then
return 0.11 elseif y3owm5E=="F1"then return 0.12 elseif y3owm5E=="F2"then return 0.13 elseif y3owm5E=="F3"then return 0.14 elseif y3owm5E=="F4"then
return 0.15 elseif y3owm5E=="F5"then return 0.16 elseif y3owm5E=="F6"then return 0.17 elseif y3owm5E=="F7"then return 0.18 elseif y3owm5E=="F8"then
return 0.19 elseif y3owm5E=="F9"then return 0.20 elseif y3owm5E=="F10"then return 0.21 elseif y3owm5E=="F11"then return 0.22 elseif y3owm5E=="F12"then return
0.23 elseif y3owm5E=="1"then return 0.24 elseif y3owm5E=="2"then return 0.25 elseif y3owm5E=="3"then return 0.26 elseif y3owm5E=="4"then
return 0.27 elseif y3owm5E=="5"then return 0.28 elseif y3owm5E=="6"then return 0.29 elseif y3owm5E=="7"then return 0.30 elseif y3owm5E=="8"then return 0.31 elseif
y3owm5E=="9"then return 0.32 elseif y3owm5E=="0"then return 0.33 elseif y3owm5E=="Q"then return 0.34 elseif y3owm5E=="W"then return 0.35 elseif y3owm5E==
"E"then return 0.36 elseif y3owm5E=="R"then return 0.37 elseif y3owm5E=="T"then return 0.38 elseif y3owm5E=="Y"then return 0.39 elseif
y3owm5E=="U"then return 0.40 elseif y3owm5E=="I"then return 0.41 elseif y3owm5E=="O"then return 0.42 elseif y3owm5E=="P"then return 0.43 elseif y3owm5E=="A"then return
0.44 elseif y3owm5E=="S"then return 0.45 elseif y3owm5E=="D"then return 0.46 elseif y3owm5E=="F"then return 0.47 elseif y3owm5E=="G"then
return 0.48 elseif y3owm5E=="H"then return 0.49 elseif y3owm5E=="J"then return 0.50 elseif y3owm5E=="K"then return 0.51 elseif y3owm5E=="L"then return 0.52 elseif
y3owm5E=="Z"then return 0.53 elseif y3owm5E=="X"then return 0.54 elseif y3owm5E=="C"then return 0.55 elseif y3owm5E=="V"then return 0.56 elseif y3owm5E==
"B"then return 0.57 elseif y3owm5E=="N"then return 0.58 elseif y3owm5E=="M"then return 0.59 elseif y3owm5E=="N1"then return 0.60 elseif y3owm5E==
"N2"then return 0.61 elseif y3owm5E=="N3"then return 0.62 elseif y3owm5E=="N4"then return 0.63 elseif y3owm5E=="N5"then return 0.64 elseif
y3owm5E=="N6"then return 0.65 elseif y3owm5E=="N7"then return 0.66 elseif y3owm5E=="N8"then return 0.67 elseif y3owm5E=="N9"then return 0.68 elseif
y3owm5E=="N0"then return 0.69 end;return 1 end
function fixSlots(R1zT)if(R1zT<10)then return'00'..R1zT end;if(R1zT>=10)then
return'0'..R1zT end;return''..R1zT end;printKeybinds=0
function RefreshKeyBinds()
if(printKeybinds==1)then
ChatFrame1:Clear()if Bartender4 then print('Bartender4 detected')end end
for J2Df,YyS in pairs(SpellCooldowns)do local o=GetSpellInfo(YyS)bindFound=false
for MY16y=1,120 do
local ZBUghmX,ncK,Deq=GetActionInfo(MY16y)
if ZBUghmX=="spell"then local GH3wE=GetKeyBinding(MY16y)
if GH3wE~=nil then
if(YyS==ncK)then
x6Ni[YyS].t:SetColorTexture(KeyBindColor(GH3wE),KeyModifierColor(GH3wE),0,AI14eFhp)
if(printKeybinds==1)then
print('Slot: '..
fixSlots(MY16y)..' '..
GetSpellLink(YyS)..','..

KeyBindColor(GH3wE)..','..KeyModifierColor(GH3wE)..','..GH3wE)end;bindFound=true;break end end end
if ZBUghmX=="macro"then actionText=GetActionText(MY16y)
name,rank,id=GetMacroSpell(actionText)local xZFv=GetKeyBinding(MY16y)
if xZFv~=nil then
if(YyS==id)then
x6Ni[YyS].t:SetColorTexture(KeyBindColor(xZFv),KeyModifierColor(xZFv),0,AI14eFhp)
if(printKeybinds==1)then
print('Slot: '..fixSlots(MY16y)..
' '..GetSpellLink(YyS)..','..

KeyBindColor(xZFv)..','..KeyModifierColor(xZFv)..','..xZFv)end;bindFound=true;break end end end end
if bindFound==false and(printKeybinds==1)then if
(GetSpellLink(YyS))~=nil then
print(GetSpellLink(YyS)..',not bound')else
print('Spell Id: '..YyS..',NOT FOUND')end end end;printKeybinds=0 end
local function Jp()i=0
for QlewVjkq,Q in pairs(SpellCooldowns)do
x6Ni[Q]=CreateFrame("frame","",parent)x6Ni[Q]:SetSize(1,1)
x6Ni[Q]:SetPoint("TOPLEFT",i,-14)x6Ni[Q].t=x6Ni[Q]:CreateTexture()
x6Ni[Q].t:SetColorTexture(0,0,0,AI14eFhp)x6Ni[Q].t:SetAllPoints(x6Ni[Q])
x6Ni[Q]:Show()i=i+1 end
x6Ni[table.maxn(x6Ni)]:RegisterEvent("SPELL_PUSHED_TO_ACTIONBAR")
x6Ni[table.maxn(x6Ni)]:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
x6Ni[table.maxn(x6Ni)]:RegisterEvent("SPELLS_CHANGED")
x6Ni[table.maxn(x6Ni)]:RegisterEvent("PLAYER_ENTERING_WORLD")
x6Ni[table.maxn(x6Ni)]:RegisterEvent("UNIT_MODEL_CHANGED")
x6Ni[table.maxn(x6Ni)]:SetScript("OnEvent",RefreshKeyBinds)local bc0w4j=0
for bc0w4j=1,2 do Ef[bc0w4j]=CreateFrame("FRAME","",parent)
Ef[bc0w4j]:SetSize(1,1)
Ef[bc0w4j]:SetPoint("TOPLEFT",(bc0w4j+3),-6)Ef[bc0w4j].t=Ef[bc0w4j]:CreateTexture()
Ef[bc0w4j].t:SetColorTexture(0,0,0,AI14eFhp)Ef[bc0w4j].t:SetAllPoints(Ef[bc0w4j])
Ef[bc0w4j]:Show()end
Ef[table.maxn(Ef)]:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
Ef[table.maxn(Ef)]:SetScript("OnEvent",DMn)
for bc0w4j=1,2 do s4ggux[bc0w4j]=CreateFrame("FRAME","",parent)
s4ggux[bc0w4j]:SetSize(1,1)
s4ggux[bc0w4j]:SetPoint("TOPLEFT",(bc0w4j+5),-6)
s4ggux[bc0w4j].t=s4ggux[bc0w4j]:CreateTexture()
s4ggux[bc0w4j].t:SetColorTexture(0,0,0,AI14eFhp)
s4ggux[bc0w4j].t:SetAllPoints(s4ggux[bc0w4j])s4ggux[bc0w4j]:Show()end
s4ggux[table.maxn(s4ggux)]:SetScript("OnUpdate",GBzFRjVV)
for bc0w4j=1,2 do hrVI4meU[bc0w4j]=CreateFrame("FRAME","",parent)
hrVI4meU[bc0w4j]:SetSize(1,1)
hrVI4meU[bc0w4j]:SetPoint("TOPLEFT",(bc0w4j+7),-6)
hrVI4meU[bc0w4j].t=hrVI4meU[bc0w4j]:CreateTexture()
hrVI4meU[bc0w4j].t:SetColorTexture(0,0,0,AI14eFhp)
hrVI4meU[bc0w4j].t:SetAllPoints(hrVI4meU[bc0w4j])hrVI4meU[bc0w4j]:Show()end
hrVI4meU[table.maxn(hrVI4meU)]:SetScript("OnUpdate",pG4C8fDK)
for bc0w4j=1,2 do xEq6TAF[bc0w4j]=CreateFrame("FRAME","",parent)
xEq6TAF[bc0w4j]:SetSize(1,1)
xEq6TAF[bc0w4j]:SetPoint("TOPLEFT",(bc0w4j+9),-6)
xEq6TAF[bc0w4j].t=xEq6TAF[bc0w4j]:CreateTexture()
xEq6TAF[bc0w4j].t:SetColorTexture(0,0,0,AI14eFhp)
xEq6TAF[bc0w4j].t:SetAllPoints(xEq6TAF[bc0w4j])xEq6TAF[bc0w4j]:Show()end
xEq6TAF[table.maxn(xEq6TAF)]:SetScript("OnUpdate",LLFUU)
for bc0w4j=1,2 do UIjls[bc0w4j]=CreateFrame("FRAME","",parent)
UIjls[bc0w4j]:SetSize(1,1)
UIjls[bc0w4j]:SetPoint("TOPLEFT",(bc0w4j+11),-6)
UIjls[bc0w4j].t=UIjls[bc0w4j]:CreateTexture()
UIjls[bc0w4j].t:SetColorTexture(0,0,0,AI14eFhp)
UIjls[bc0w4j].t:SetAllPoints(UIjls[bc0w4j])UIjls[bc0w4j]:Show()end
UIjls[table.maxn(UIjls)]:SetScript("OnUpdate",kdmQtj6)bc0w4j=0
for yI,EDE3 in pairs(PlayerBuffs)do
B7SHDx7h[EDE3]=CreateFrame("frame","",parent)B7SHDx7h[EDE3]:SetSize(1,1)B7SHDx7h[EDE3]:SetPoint("TOPLEFT",bc0w4j,
-7)
B7SHDx7h[EDE3].t=B7SHDx7h[EDE3]:CreateTexture()
B7SHDx7h[EDE3].t:SetColorTexture(1,1,1,AI14eFhp)
B7SHDx7h[EDE3].t:SetAllPoints(B7SHDx7h[EDE3])B7SHDx7h[EDE3]:Show()bc0w4j=bc0w4j+1 end
B7SHDx7h[table.maxn(B7SHDx7h)]:SetScript("OnUpdate",SnbfLb6)bc0w4j=0
for FpWG11U,kRY46C in pairs(InventoryItems)do
ZA9[kRY46C]=CreateFrame("frame","",parent)ZA9[kRY46C]:SetSize(1,1)
ZA9[kRY46C]:SetPoint("TOPLEFT",bc0w4j,-8)ZA9[kRY46C].t=ZA9[kRY46C]:CreateTexture()
ZA9[kRY46C].t:SetColorTexture(1,1,1,AI14eFhp)
ZA9[kRY46C].t:SetAllPoints(ZA9[kRY46C])ZA9[kRY46C]:Show()bc0w4j=bc0w4j+1 end;if(table.getn(InventoryItems)~=0)then
ZA9[table.maxn(ZA9)]:SetScript("OnUpdate",MW)end;bc0w4j=0
for MvOaiq,DUic_1K in pairs(PlayerDebuffs)do
EEpoeR[DUic_1K]=CreateFrame("frame","",parent)EEpoeR[DUic_1K]:SetSize(1,1)EEpoeR[DUic_1K]:SetPoint("TOPLEFT",bc0w4j,
-10)
EEpoeR[DUic_1K].t=EEpoeR[DUic_1K]:CreateTexture()
EEpoeR[DUic_1K].t:SetColorTexture(1,1,1,AI14eFhp)
EEpoeR[DUic_1K].t:SetAllPoints(EEpoeR[DUic_1K])EEpoeR[DUic_1K]:Show()
EEpoeR[DUic_1K]:SetScript("OnUpdate",ubP)bc0w4j=bc0w4j+1 end
EEpoeR[table.maxn(EEpoeR)]:SetScript("OnUpdate",ubP)bc0w4j=0
for rVj9z4,mWkmCx in pairs(SpellCooldowns)do
iW2O[mWkmCx]=CreateFrame("frame","",parent)iW2O[mWkmCx]:SetSize(1,1)iW2O[mWkmCx]:SetPoint("TOPLEFT",bc0w4j,
-11)
iW2O[mWkmCx].t=iW2O[mWkmCx]:CreateTexture()
iW2O[mWkmCx].t:SetColorTexture(1,1,1,AI14eFhp)
iW2O[mWkmCx].t:SetAllPoints(iW2O[mWkmCx])iW2O[mWkmCx]:Show()bc0w4j=bc0w4j+1 end;if(table.getn(SpellCooldowns)~=0)then
iW2O[table.maxn(iW2O)]:SetScript("OnUpdate",eN0UMW)end
for bc0w4j=1,4 do
Gdp[bc0w4j]=CreateFrame("frame","",parent)Gdp[bc0w4j]:SetSize(1,1)Gdp[bc0w4j]:SetPoint("TOPLEFT",(bc0w4j),
-12)
Gdp[bc0w4j].t=Gdp[bc0w4j]:CreateTexture()
Gdp[bc0w4j].t:SetColorTexture(1,1,1,AI14eFhp)
Gdp[bc0w4j].t:SetAllPoints(Gdp[bc0w4j])Gdp[bc0w4j]:Show()end
Gdp[table.maxn(Gdp)]:RegisterEvent("PLAYER_ENTERING_WORLD")
Gdp[table.maxn(Gdp)]:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
Gdp[table.maxn(Gdp)]:RegisterEvent("PLAYER_REGEN_DISABLED")
Gdp[table.maxn(Gdp)]:SetScript("OnEvent",Uy)F2tY.npcCountFrame=CreateFrame("frame","",parent)
F2tY.npcCountFrame:SetSize(1,1)
F2tY.npcCountFrame:SetPoint("TOPLEFT",0,-22)
F2tY.npcCountFrame.t=F2tY.npcCountFrame:CreateTexture()
F2tY.npcCountFrame.t:SetColorTexture(1,1,1,AI14eFhp)
F2tY.npcCountFrame.t:SetAllPoints(F2tY.npcCountFrame)F2tY.npcCountFrame:Show()
F2tY.npcCountFrame:SetScript("OnUpdate",q)local OGMxal0=IsInRaid()and"raid"or"party"bc0w4j=0
for qQpo=1,30 do
nbqmx[qQpo]=CreateFrame("frame","",parent)nbqmx[qQpo]:SetSize(1,1)
nbqmx[qQpo]:SetPoint("TOPLEFT",bc0w4j,-13)nbqmx[qQpo].t=nbqmx[qQpo]:CreateTexture()
nbqmx[qQpo].t:SetColorTexture(0,0,0,AI14eFhp)
nbqmx[qQpo].t:SetAllPoints(nbqmx[qQpo])nbqmx[qQpo]:Show()bc0w4j=bc0w4j+1 end;rrFLbCtj=CreateFrame("frame","",parent)
rrFLbCtj:SetSize(1,1)rrFLbCtj:SetPoint("TOPLEFT",0,-19)
rrFLbCtj.t=rrFLbCtj:CreateTexture()rrFLbCtj.t:SetColorTexture(0,0,0,AI14eFhp)
rrFLbCtj.t:SetAllPoints(rrFLbCtj)rrFLbCtj:Show()bc0w4j=0
for qXKzBXo0,cJ in pairs(PlayerDebuffs)do
YcPea0vg[cJ]=CreateFrame("frame","",parent)YcPea0vg[cJ]:SetSize(1,1)YcPea0vg[cJ]:SetPoint("TOPLEFT",bc0w4j,
-20)
YcPea0vg[cJ].t=YcPea0vg[cJ]:CreateTexture()
YcPea0vg[cJ].t:SetColorTexture(0,0,0,AI14eFhp)
YcPea0vg[cJ].t:SetAllPoints(YcPea0vg[cJ])YcPea0vg[cJ]:Show()bc0w4j=bc0w4j+1 end
for bc0w4j=1,2 do usLpLoaH[bc0w4j]=CreateFrame("FRAME","",parent)
usLpLoaH[bc0w4j]:SetSize(1,1)
usLpLoaH[bc0w4j]:SetPoint("TOPLEFT",bc0w4j,-19)
usLpLoaH[bc0w4j].t=usLpLoaH[bc0w4j]:CreateTexture()
usLpLoaH[bc0w4j].t:SetColorTexture(0,0,0,AI14eFhp)
usLpLoaH[bc0w4j].t:SetAllPoints(usLpLoaH[bc0w4j])usLpLoaH[bc0w4j]:Show()end end;local function NwBqNl3C()oJ1ec=0 end;local function XuqjvYPF()LMMNWLk=0 end
local function Trh(HI4G3oH,ncWw,...)local kdS=...
if
ncWw=="ADDON_LOADED"then if(kdS=="[Frozen]")then Gm1()Jp()end end
if ncWw=="NAME_PLATE_UNIT_ADDED"then xb6(select(1,...))mlTMZ()end
if ncWw=="PLAYER_ENTERING_WORLD"then oJ1ec=0;LMMNWLk=0;Vd=GetSpecialization()
Oynw=
Vd and select(1,GetSpecializationInfo(Vd))or 0;EG72()end;if ncWw=="PLAYER_REGEN_DISABLED"then yK()end;if
ncWw=="PLAYER_REGEN_ENABLED"then yK()mlTMZ()end
if ncWw=="COMBAT_LOG_EVENT_UNFILTERED"then
local OS60,dl,b2UK,FC0yhp,lL30T,zt,Ofgm3g,z6WE21dc,rJg9H,sNyznm3W,UU=...
if FC0yhp==UnitGUID('player')then
if dl=="SPELL_SUMMON"then
local YBciOAz2,YBciOAz2,YBciOAz2,YBciOAz2,YBciOAz2,YBciOAz2,YBciOAz2,wJvNH,YBciOAz2=z6WE21dc:find('(%S+)-(%d+)-(%d+)-(%d+)-(%d+)-(%d+)-(%S+)')wJvNH=tonumber(wJvNH)if(wJvNH==55659)then oJ1ec=oJ1ec+1
C_Timer.After(12,NwBqNl3C)end;if(wJvNH==98035)then LMMNWLk=LMMNWLk+1
C_Timer.After(12,XuqjvYPF)end;return end end end end;parent:SetScript("OnEvent",Trh)
parent:SetScript("OnUpdate",update)