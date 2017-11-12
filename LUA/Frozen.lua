local wUVm={PlatesOn=0,enemiesPlate=0,activeUnitPlates={},npcCountFrame=nil}
local VQ={invSlots={1,3,5,7,10,15},setItemsT19={138355,138349,138361,138352,138358,138364,138378,138376,138380,138377,138379,138375,138330,138324,138336,138327,138333,138366,138342,138339,138347,138340,138344,138368,138312,138318,138321,138309,138315,138365,138331,138325,138337,138328,138334,138367,138356,138350,138362,138353,138359,138369,138313,138319,138322,138310,138316,138370,138332,138326,138338,138329,138335,138371,138343,138346,138348,138341,138345,138372,138314,138320,138323,138311,138317,138373,138357,138351,138363,138354,138360,138374},setItemsT20={147124,147126,147122,147121,147123,147125,147130,147132,147128,147127,147129,147131,147136,147138,147134,147133,147135,147137,147142,147144,147140,147139,147141,147143,147147,147150,147145,147149,147146,147148,147154,147156,147152,147151,147153,147155,147160,147162,147158,147157,147159,147161,147165,147168,147163,147167,147164,147166,147172,147174,147170,147169,147171,147173,147178,147180,147176,147175,147177,147179,147183,147186,147181,147185,147182,147184,147187,147188,147189,147190,147191,147192},T19=0,T20=0,Legendary1=0,legendary2=0}
local oTYNsnP={["Human"]=0.01,["Dwarf"]=0.02,["NightElf"]=0.03,["Gnome"]=0.04,["Draenei"]=0.05,["Pandaren"]=0.06,["Orc"]=0.07,["Undead"]=0.08,["Scourge"]=0.08,["Tauren"]=0.09,["Troll"]=0.10,["BloodElf"]=0.11,["Goblin"]=0.12,["Worgen"]=0.13}
local I={Id={[0]=0.00,[250]=0.01,[251]=0.02,[252]=0.03,[577]=0.04,[581]=0.05,[102]=0.06,[103]=0.07,[104]=0.08,[105]=0.09,[253]=0.10,[254]=0.11,[255]=0.12,[62]=0.13,[63]=0.14,[64]=0.15,[268]=0.16,[269]=0.17,[270]=0.18,[65]=0.19,[66]=0.20,[70]=0.21,[256]=0.22,[257]=0.23,[258]=0.24,[259]=0.25,[260]=0.26,[261]=0.27,[262]=0.28,[263]=0.29,[264]=0.30,[265]=0.31,[71]=0.32,[72]=0.33,[73]=0.34,[266]=0.35,[267]=0.36},Spell={[0]="Death Strike",[250]="Death Strike",[251]="Frost Strike",[252]="Festering Strike",[577]="Chaos Strike",[581]="Shear",[102]="Solar Wrath",[103]="Shred",[104]="Mangle",[105]="Solar Wrath",[253]="Counter Shot",[254]="Counter Shot",[255]="Mongoose Bite",[62]="Arcane Blast",[63]="Fireball",[64]="Frostbolt",[268]="Blackout Strike",[269]="Rising Sun Kick",[270]="Rising Sun Kick",[65]="Crusader Strike",[66]="Shield of the Righteous",[70]="Crusader Strike",[256]="Penance",[257]="Smite",[258]="Mind Blast",[259]="Mutilate",[260]="Saber Slash",[261]="Backstab",[262]="Lightning Bolt",[263]="Rockbiter",[264]="Lightning Bolt",[265]="Agony",[71]="Mortal Strike",[72]="Bloodthirst",[73]="Devastate",[266]="Doom",[267]="Incinerate"}}local LmR5gwW=GetCurrentResolution()
local DfbW=select(LmR5gwW,GetScreenResolutions())local sh,rrFLbCtj=strsplit("x",DfbW,2)
local YcPea0vg=GetScreenWidth()/sh;parent=CreateFrame("frame","Recount",UIParent)
parent:SetSize(40,25)parent:SetPoint("TOPLEFT",0,0)
parent:SetScale(YcPea0vg)parent:RegisterEvent("ADDON_LOADED")
parent:RegisterEvent("NAME_PLATE_UNIT_ADDED")parent:RegisterEvent("PLAYER_ENTERING_WORLD")
parent:RegisterEvent("PLAYER_REGEN_DISABLED")parent:RegisterEvent("PLAYER_REGEN_ENABLED")
parent:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")parent.t=parent:CreateTexture()
parent.t:SetColorTexture(0,0,0,1)parent.t:SetAllPoints(parent)
parent:SetFrameStrata("TOOLTIP")local function usLpLoaH(StZ,C1NqzxY)return
(("%%.%df"):format(C1NqzxY)):format(StZ)end
local function e7dv(T1gVrYq)
if
UnitIsDead(T1gVrYq)or UnitIsGhost(T1gVrYq)then return 0 end;local P5G=UnitHealth(T1gVrYq)local JC=UnitHealthMax(T1gVrYq)local PDA=ceil(
(P5G/JC)*100)local Kqne5Stra="0.0"..PDA;if(PDA>=10)then
Kqne5Stra="0."..PDA end;val=tonumber(Kqne5Stra)if PDA==100 then val=1 end;return
val end;local inx0;local A5k5yt={}local B7SHDx7h={}local EEpoeR={}local _k={}local Ef={}local KfM={}local Vd={}local Oynw={}local QBO={}
local s4ggux=0;local hrVI4meU=GetSpecialization()local xEq6TAF=0;local UIjls={}local jdLnB0vD={}local PSlD={}local nN={}
local J={}local A={}local g3Qeqnr={}local qHpY64={}local z={}local qccJ5b=nil;local ARuba=nil;local Wo53nZ={}local XRfQ=nil;local gFPRdEC=nil
local lw9gLt3={}local TI5=nil;local JmE=nil;local s4=nil;local FFG=nil;local a31jEAS=nil;local LS4h={}local eux092_P={}local ZA9={}local hWgmxm={}
local UBg54E={}local gQGq={}local OyHc5FEv={}local Dn1Xi={}local _gGmBBE=0;local rIX4=0;local AI14eFhp=0;local iW2O=0;local Gdp=0;local nbqmx=nil
local IWQcC=1;local cvRh={}local W9yaJm={}local oJ1ec={}local LMMNWLk,x6Ni,Q2waXkyp=UnitClass("player")local EG72=0
local mlTMZ=0;local q={}local xb6=LibStub("LibRangeCheck-2.0")local function yK()
if
GetCVar("nameplateShowEnemies")=="1"then wUVm.PlatesOn=1 else wUVm.PlatesOn=0 end end
local function rHLz2GD()
xEq6TAF=hrVI4meU and
select(1,GetSpecializationInfo(GetSpecialization()))or 0;wUVm.enemiesPlate=0;local FKLmmhnQ=I.Spell[xEq6TAF]
for F82,wJ6tY_ in
pairs(wUVm.activeUnitPlates)do
if wJ6tY_~=nil then
if UnitCanAttack("player",F82)and
LibStub("SpellRange-1.0").IsSpellInRange(FKLmmhnQ,F82)==1 and
UnitIsDead(F82)==false then wUVm.enemiesPlate=
wUVm.enemiesPlate+1 end end end;wUVm.enemiesPlate=wUVm.enemiesPlate/100 end;local function BlW0RhJA()rHLz2GD()yK()
wUVm.npcCountFrame.t:SetColorTexture(1,wUVm.enemiesPlate,wUVm.PlatesOn,IWQcC)end
local function Uy(TNg)local wO9T=false
for QMcSUqdi,sKy2P9i in
pairs(wUVm.activeUnitPlates)do wUVm.activeUnitPlates[QMcSUqdi]=nil end
for S=1,30 do
if UnitGUID("nameplate"..S)~=nil and not
UnitIsPlayer("nameplate"..S)then for AD,AkxLdb66 in
pairs(wUVm.activeUnitPlates)do
if AkxLdb66 ==UnitGUID("nameplate"..S)then wO9T=true end end;if wO9T==false then
wUVm.activeUnitPlates[
"nameplate"..S]=UnitGUID("nameplate"..S)wO9T=false end end;wO9T=false end end;local function n()
for aUR,c4 in pairs(wUVm.activeUnitPlates)do if aUR~=UnitGUID("target")then wUVm.activeUnitPlates[aUR]=
nil end end end
PlayerIsInCombat=false
local function TKu(ZNXs3Bwd,Ginn,...)if Ginn=="PLAYER_REGEN_ENABLED"then PlayerIsInCombat=false
unitCombatFrame.t:SetColorTexture(1,1,1,IWQcC)end;if
Ginn=="PLAYER_REGEN_DISABLED"then PlayerIsInCombat=true
unitCombatFrame.t:SetColorTexture(1,0,0,IWQcC)end end
local function M6kL(h_pK)under=math.floor(h_pK)upper=math.floor(h_pK)+1;underV=- (
under-h_pK)upperV=upper-h_pK;if(upperV>underV)then return
under else return upper end end
local function M7o_()local L=0;VQ.Legendary1=0;VQ.Legendary2=0
for vBKFXR3=1,18 do
if
GetInventoryItemID("player",vBKFXR3)~=nil then
local FP3j,FP3j,fe,FP3j,FP3j,FP3j,FP3j,FP3j,FP3j,FP3j,FP3j=GetItemInfo(GetInventoryItemID("player",vBKFXR3))
if fe==5 then if L==0 then L=L+1;VQ.Legendary1=vBKFXR3/100 else L=L+1
VQ.Legendary2=vBKFXR3/100 end end end end end
local function dk2X7J7()VQ.T19=0;VQ.T20=0
for ggnA,KaD2ExEO in pairs(VQ.invSlots)do
itemID=GetInventoryItemID("player",KaD2ExEO)for ggnA,TpiFT in pairs(VQ.setItemsT19)do
if(itemID==TpiFT)then VQ.T19=VQ.T19+1 end end
for ggnA,JCH in pairs(VQ.setItemsT20)do if
(itemID==JCH)then VQ.T20=VQ.T20+1 end end end end
local function jv()hrVI4meU=GetSpecialization()
xEq6TAF=hrVI4meU and
select(1,GetSpecializationInfo(hrVI4meU))or 0;dk2X7J7()M7o_()local sJ05I={}AllSeven=false
for HrLCim=1,GetMaxTalentTier()do
talenetSelected=false
for w=1,3 do local sUu7z=select(4,GetTalentInfo(HrLCim,w,1))
if
(sUu7z==true)then sJ05I[HrLCim]=w/100;talenetSelected=true end
if talenetSelected==false and w==3 then sJ05I[HrLCim]=0 end end;if HrLCim==7 then AllSeven=true end end
if not AllSeven then for M5oB=GetMaxTalentTier(),7 do sJ05I[M5oB]=0 end end
W9yaJm[1].t:SetColorTexture(sJ05I[1],sJ05I[2],sJ05I[3],IWQcC)
W9yaJm[2].t:SetColorTexture(sJ05I[4],sJ05I[5],sJ05I[6],IWQcC)
W9yaJm[3].t:SetColorTexture(sJ05I[7],oTYNsnP[select(2,UnitRace("player"))],0,IWQcC)
W9yaJm[4].t:SetColorTexture(I.Id[xEq6TAF],VQ.T19/100,VQ.T20/100,IWQcC)
W9yaJm[5].t:SetColorTexture(VQ.Legendary1,VQ.Legendary2,0,IWQcC)end
local function MW()if not UnitExists("target")then return end
for xIyIKo,f2x in pairs(PlayerBuffs)do
local Nwl=GetSpellInfo(f2x)
local Xpt_SQ,xIyIKo,xIyIKo,xIyIKo,xIyIKo,xIyIKo,Y,xIyIKo,xIyIKo,xIyIKo,SMa=UnitBuff("target",Nwl,nil,"PLAYER")
if(Xpt_SQ==Nwl and Y~=0)then local Bo=Y-GetTime()-select(4,GetNetStats())/
1000
Bo=usLpLoaH(Bo,1)local zF6ZPjQ,nNQG3=strsplit(".",Bo)
local yW=tonumber(zF6ZPjQ)/100;local efGM8UMy=tonumber(nNQG3)/100;if(yW>1)then yW=1 end
gQGq[f2x].t:SetColorTexture(1,yW,efGM8UMy,IWQcC)gQGq[f2x].t:SetAllPoints(false)else
gQGq[f2x].t:SetColorTexture(0,1,1,IWQcC)gQGq[f2x].t:SetAllPoints(false)end end end
local function E2OQ()local KhH=0;if Q2waXkyp==2 then
KhH=UnitPower("player",SPELL_POWER_HOLY_POWER)end;if Q2waXkyp==9 then
KhH=UnitPower("player",SPELL_POWER_SOUL_SHARDS)end;if Q2waXkyp==8 then
KhH=UnitPower("player",SPELL_POWER_ARCANE_CHARGES)end;if Q2waXkyp==4 then
KhH=UnitPower("player",SPELL_POWER_COMBO_POINTS)end;if Q2waXkyp==11 then
KhH=UnitPower("player",SPELL_POWER_COMBO_POINTS)end
if Q2waXkyp==6 then
local H4tXd=UnitPower("player",SPELL_POWER_RUNES)local Nq6If=6;local II=1
for II=1,H4tXd do local Y_tefq=select(3,GetRuneCooldown(II))if not
Y_tefq then Nq6If=Nq6If-1 end end;KhH=Nq6If end
if Q2waXkyp==10 then KhH=UnitPower("player",SPELL_POWER_CHI)end
if KhH~=Gdp then
unitPowerFrame.t:SetColorTexture(0,KhH/100,0,IWQcC)unitPowerFrame.t:SetAllPoints(false)Gdp=KhH end end;local SnbfLb6=nil
local function ay(i,a3u)local nzhB=UnitExists("pet")
if
(nzhB==false or UnitIsDead("pet"))then if(nzhB~=SnbfLb6)then
a31jEAS.t:SetColorTexture(1,1,1,IWQcC)SnbfLb6=nzhB end else if nzhB~=SnbfLb6 and not
UnitIsDead("player")then
a31jEAS.t:SetColorTexture(1,0,0,IWQcC)SnbfLb6=nzhB end end end
local function W()
if
xEq6TAF==270 or xEq6TAF==65 or xEq6TAF==257 or
xEq6TAF==256 or xEq6TAF==264 or xEq6TAF==105 then return true else return false end end
local function WzM(sTxVGmb,GSIcq)
for Go,DGf in pairs(SpellCooldowns)do local kgRX7X,JB,Go=GetSpellCooldown(DGf)
local GGJhclKa=(kgRX7X+JB-
GetTime()-select(4,GetNetStats())/1000)if GGJhclKa<0 then GGJhclKa=0 end;local KWahIz=GetSpellInfo(DGf)
local X2kyW,pVlvW=IsUsableSpell(KWahIz)
if GGJhclKa~=0 then GGJhclKa=usLpLoaH(GGJhclKa,1)
local QcKn_,jiM=strsplit(".",GGJhclKa)local YUdA=tonumber(QcKn_)/100
local lx3cpJ=tonumber(jiM)/100
_k[DGf].t:SetColorTexture(0,YUdA,lx3cpJ,IWQcC)_k[DGf].t:SetAllPoints(false)else
if(pVlvW and W())then
_k[DGf].t:SetColorTexture(0,1,1,IWQcC)else _k[DGf].t:SetColorTexture(1,1,1,IWQcC)end;_k[DGf].t:SetAllPoints(false)end end end
local function PSx(Yx9,Mn)
for ut0,ZFhlP6eg in pairs(InventoryItems)do local ExUgDG,jc4o42jz,ut0=GetItemCooldown(ZFhlP6eg)local jc=ExUgDG+
jc4o42jz-GetTime()local Ojz_=0;if jc<0 then jc=0 end
local x=0;if IsEquippedItem(ZFhlP6eg)then x=1 else x=0 end
local Xtecl=GetItemCount(ZFhlP6eg)/100;if Xtecl>=100 then Ojz_=1 end;if jc==0 or Ojz_==0 then
OyHc5FEv[ZFhlP6eg].t:SetColorTexture(0,x,Ojz_,IWQcC)else
OyHc5FEv[ZFhlP6eg].t:SetColorTexture(1,x,Ojz_,IWQcC)end end end
local function IwnA(KVcYU,_)
for C,CJeG in pairs(SpellCooldowns)do charges,C,C,C=GetSpellCharges(CJeG)
if
(CJeG==205406 or
CJeG==115072 or CJeG==101546)then charges=GetSpellCount(CJeG)end;if(eux092_P[CJeG]~=charges)then
Ef[CJeG].t:SetColorTexture(0,charges/100,0,IWQcC)Ef[CJeG].t:SetAllPoints(false)
eux092_P[CJeG]=charges end end end
local function cW(F43eMG,mCzjh4)
for lU,epQue9 in pairs(PlayerBuffs)do local cHUJrj=GetSpellInfo(epQue9)if(cHUJrj==nil)then
print(
'Unable to find aura (Buff) with Id: '..epQue9)return end
local EI0x,lU,lU,E,lU,lacOdjf9,R2h4lP4l,lU,lU,lU,Fh=UnitBuff("player",cHUJrj)
if(epQue9 ==120694)and UnitBuff("player",cHUJrj)then
local a2e9fa=0
for LmR5gwW=1,40 do local EI0x,lU,lU,lU,lU,lU,lU,lU,lU,lU,Fh,lU,lU,lU,lU,lU=UnitBuff("player",LmR5gwW)if
Fh==120694 then a2e9fa=a2e9fa+1 end end;E=a2e9fa end
if(EI0x==cHUJrj)then local Rc9_ZID=GetTime()
remainingTime=usLpLoaH(R2h4lP4l-Rc9_ZID,1)local H1HF2wD6,hBph=strsplit(".",remainingTime)
local bxNo9h=tonumber(H1HF2wD6)/100;local Khst=tonumber(hBph)/100
KfM[epQue9].t:SetColorTexture(E/100,bxNo9h,Khst,IWQcC)KfM[epQue9].t:SetAllPoints(false)else
KfM[epQue9].t:SetColorTexture(1,1,1,IWQcC)KfM[epQue9].t:SetAllPoints(false)end end end
local function PHpCof2(pUT,ISg1)
for Gh5UJya,k in pairs(PlayerDebuffs)do local Z8Ue=GetSpellInfo(k)
if Z8Ue==nil then
if
(UBg54E[k]~="DebuffOff")then A[k].t:SetColorTexture(1,1,1,IWQcC)
A[k].t:SetAllPoints(false)UBg54E[k]="DebuffOff"end;return end
local TXbmx,Gh5UJya,Gh5UJya,r,Gh5UJya,Pqgz415t,McNxKV,Gh5UJya,Gh5UJya,Gh5UJya,WcwGYJh,Gh5UJya,Gh5UJya,Gh5UJya,Gh5UJya,Gh5UJya=UnitDebuff("target",Z8Ue,nil,"PLAYER|HARMFUL")
if k==233490 and(TXbmx==Z8Ue)then local gJt=0
for LmR5gwW=1,40 do
name2,Gh5UJya,Gh5UJya,count2,Gh5UJya,Pqgz415t,expirationTime2,Gh5UJya,Gh5UJya,Gh5UJya,spellId2,Gh5UJya,Gh5UJya,Gh5UJya,Gh5UJya,Gh5UJya=UnitDebuff("target",LmR5gwW,"PLAYER|HARMFUL")if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then gJt=gJt+1 end end;r=gJt end
if(TXbmx==Z8Ue)then local hCs8M=GetTime()
remainingTime=usLpLoaH(McNxKV-hCs8M,1)
if
(UBg54E[k]~="DebuffOn"..r..remainingTime)then local GkjCn_mq,T9sySp=strsplit(".",remainingTime)
local DL0mMXM=tonumber(GkjCn_mq)/100;local o4Kvi75g=tonumber(T9sySp)/100;if WcwGYJh==34914 then end;A[k].t:SetColorTexture(
r/100,DL0mMXM,o4Kvi75g,IWQcC)UBg54E[k]=
"DebuffOn"..r..remainingTime end else if(UBg54E[k]~="DebuffOff")then
A[k].t:SetColorTexture(1,1,1,IWQcC)UBg54E[k]="DebuffOff"end end end end;local bUPpn4T2={}
local function sode(ELb,FV5)
for sX,DH6mUlGB in pairs(SpellCooldowns)do local A4ZRczp=0
local rUT,sX,sX,sX,sX,sX=GetSpellInfo(DH6mUlGB)if(rUT==nil)then A4ZRczp=0 else
A4ZRczp=LibStub("SpellRange-1.0").IsSpellInRange(DH6mUlGB,"target")end
if
bUPpn4T2[DH6mUlGB]~=A4ZRczp then if(A4ZRczp==1)then
g3Qeqnr[DH6mUlGB].t:SetColorTexture(1,0,0,IWQcC)else
g3Qeqnr[DH6mUlGB].t:SetColorTexture(1,1,1,IWQcC)end
g3Qeqnr[DH6mUlGB].t:SetAllPoints(false)bUPpn4T2[DH6mUlGB]=A4ZRczp end end end
local function G9zkKODk()
if GetUnitSpeed("Player")==0 then Movetime=GetTime()
PlayerMovingFrame.t:SetColorTexture(1,1,1,IWQcC)else
PlayerMovingFrame.t:SetColorTexture(1,0,0,IWQcC)end end
local function G9zkKODk()mountedplayer=0;moveTime=1;if IsMounted()then mountedplayer=.5 end;if
GetUnitSpeed("Player")==0 then moveTime=0 end
PlayerMovingFrame.t:SetColorTexture(moveTime,mountedplayer,1,IWQcC)end
local function MGt()if IsCurrentSpell(6603)then
AutoAtackingFrame.t:SetColorTexture(1,0,0,IWQcC)else
AutoAtackingFrame.t:SetColorTexture(1,1,1,IWQcC)end end
local function ld9GuG4t()
if UnitGUID("target")==UnitGUID("player")then
targetIsPlayerFrame.t:SetColorTexture(1,0,0,IWQcC)else
targetIsPlayerFrame.t:SetColorTexture(1,1,1,IWQcC)end end
local function KpCCA()if IsOutdoors()then EEpoeR.t:SetColorTexture(1,0,0,IWQcC)else
EEpoeR.t:SetColorTexture(1,1,1,IWQcC)end end;local H6=0
local function hgsKvTz(gJPi,Kkl6fa)local t=UnitLevel("player")local H=0;local glZrOuSo=0;local Zdzaj=0
local UxRGyO9e="0.0"..t;if(t>=10)then UxRGyO9e="0."..t end
glZrOuSo=tonumber(UxRGyO9e)
if(t>100)then glZrOuSo=0;t=t-100;local Kwxn="0.0"..t
if(t>=10)then Kwxn="0."..t end;Zdzaj=tonumber(Kwxn)end;local fvj_L=UnitHealth("player")
local _CPU89l=UnitHealthMax("player")local U=ceil((fvj_L/_CPU89l)*100)if
UnitIsDead("player")or UnitIsGhost("player")then U=0 end
if(U~=
H6)then local yp5DGSwX="0.0"..U;if(U>=10)then yp5DGSwX="0."..U end
H=tonumber(yp5DGSwX)
if(U==100)then if(t==100)then
qccJ5b.t:SetColorTexture(1,1,0,IWQcC)else
qccJ5b.t:SetColorTexture(1,glZrOuSo,Zdzaj,IWQcC)end else
qccJ5b.t:SetColorTexture(H,glZrOuSo,Zdzaj,IWQcC)end;H6=U end end;local zEt=0
local function Wjojpvg(Sb1Mw7R,fuF)local pA2=UnitHealth("pet")local M5lAedm=UnitHealthMax("pet")if M5lAedm==
nil then M5lAedm=1 end;if M5lAedm==0 then M5lAedm=1 end;local _uYRl2kj=ceil(
(pA2/M5lAedm)*100)
if(zEt~=_uYRl2kj)then local tbN=0
local x="0.0".._uYRl2kj;if(_uYRl2kj>=10)then x="0.".._uYRl2kj end
tbN=tonumber(x)if(_uYRl2kj==100)then
petHealthFrame.t:SetColorTexture(1,0,0,IWQcC)else
petHealthFrame.t:SetColorTexture(tbN,0,0,IWQcC)end;zEt=_uYRl2kj end end;local l2PqbWw=0
local function EJTH9(m,VVQ)local Jb=UnitGUID("target")local qcpea=0;local tjDBv=100;local vmn7v=0;if(Jb~=nil)then
qcpea=UnitHealth("target")tjDBv=UnitHealthMax("target")
vmn7v=ceil((qcpea/tjDBv)*100)end
if(vmn7v~=l2PqbWw)then
local Au1mzs=0;local u39i="0.0"..vmn7v;if(vmn7v>=10)then u39i="0."..vmn7v end
Au1mzs=tonumber(u39i)if(vmn7v==100)then
targetHealthFrame.t:SetColorTexture(1,0,0,IWQcC)else
targetHealthFrame.t:SetColorTexture(Au1mzs,0,0,IWQcC)end
l2PqbWw=vmn7v end end
local function qTB82(Fdg7p,GD3AP)local jph00k=UnitPower("player")local wE_4o=UnitPowerMax("player")
if(jph00k~=
s4ggux)then s4ggux=jph00k
if
(




(Q2waXkyp==7 and xEq6TAF==264)or(Q2waXkyp==2)or(Q2waXkyp==5)or(Q2waXkyp==8)or(Q2waXkyp==9)or(Q2waXkyp==10 and xEq6TAF==270)or(Q2waXkyp==11 and xEq6TAF==102)or(Q2waXkyp==11 and xEq6TAF==105))then jph00k=ceil((jph00k/wE_4o)*100)end;local F=0;local bUO1NvT=0;local KRQG="0.0"..jph00k
if(jph00k>=10)then KRQG="0."..jph00k end;F=tonumber(KRQG)if(jph00k>100)then F=0;jph00k=jph00k-100
local tVwI_N="0.0"..jph00k;if(jph00k>=10)then tVwI_N="0."..jph00k end
bUO1NvT=tonumber(tVwI_N)end;if
(jph00k==100)then powerFrame.t:SetColorTexture(1,0,0,IWQcC)else
powerFrame.t:SetColorTexture(F,bUO1NvT,0,IWQcC)end end end;local KL=0
local function EATFLbgY()local Jkp2lGXG=math.floor(GetHaste())local ifcyuS=0;if
lasthaste==Jkp2lGXG then return end;lastehaste=Jkp2lGXG;local V03W=0;if
Jkp2lGXG==math.abs(Jkp2lGXG)then V03W=1 else V03W=0 end
if(Jkp2lGXG>=100)then
ifcyuS=math.floor(Jkp2lGXG/100)Jkp2lGXG=Jkp2lGXG- (ifcyuS*100)end
local R=math.abs(tonumber(strsub(tostring(Jkp2lGXG),1,2))/100)TI5.t:SetColorTexture(V03W,ifcyuS,R,IWQcC)end;local FF=true
local function rh(X6_,tN5u)isFriend=UnitIsFriend("player","target")
if
(isFriend~=FF)then
if(isFriend==true)then
XRfQ.t:SetColorTexture(0,1,0,IWQcC)else XRfQ.t:SetColorTexture(0,0,1,IWQcC)end;FF=isFriend end end;local YcCR=""
local function G3p2Yn()local Yqc0GWr=UnitGUID("target")
local UC7=LibStub("LibBossIDs-1.0")local WbvvcjER=UnitIsDead("target")local rOLxXC=UnitLevel("player")
if(Yqc0GWr~=
YcCR)then
if Yqc0GWr==nil then
gFPRdEC.t:SetColorTexture(0,0,0,IWQcC)else
if Yqc0GWr~=nil then
local w762p7sZ,_7jt,_7jt,_7jt,_7jt,ORXyFQ=strsplit(" - ",UnitGUID("target"))
if UC7.BossIDs[tonumber(ORXyFQ)]then
gFPRdEC.t:SetColorTexture(0,0,1,IWQcC)elseif w762p7sZ=="Player"then
gFPRdEC.t:SetColorTexture(1,0,0,IWQcC)elseif not UC7.BossIDs[tonumber(ORXyFQ)]then
if ORXyFQ~=nil then
if
tonumber(ORXyFQ)==114631 or tonumber(ORXyFQ)==114822 or
tonumber(ORXyFQ)==90463 or
tonumber(ORXyFQ)==90418 or
tonumber(ORXyFQ)==90431 then
gFPRdEC.t:SetColorTexture(0,0,0,IWQcC)else gFPRdEC.t:SetColorTexture(1,0,0,IWQcC)end end elseif(Yqc0GWr~=nil and WbvvcjER==true)then
gFPRdEC.t:SetColorTexture(0,0,0,IWQcC)end end end;YcCR=Yqc0GWr end end;local _jkkD9=0;local D=""
local function DMn(OL1oV,Q)spell,_,_,_,_,_,_,castID,_=UnitCastingInfo("player")
name,_,text,_,_,_,_,_=UnitChannelInfo("player")
if castID~=nil then if castID~=_jkkD9 then
JmE.t:SetColorTexture(1,0,0,IWQcC)_jkkD9=castID end else if castID~=_jkkD9 then
JmE.t:SetColorTexture(1,1,1,IWQcC)_jkkD9=castID end end;if name~=nil then
if text~=D then JmE.t:SetColorTexture(0,1,0,IWQcC)D=text end else
if text~=D then JmE.t:SetColorTexture(1,1,1,IWQcC)D=text end end end;local function GBzFRjVV(HQvT5,dN)return
math.abs(dN-GetTime()*1000)/math.abs(dN-HQvT5)end
local function pG4C8fDK(B35igHj,o8pPC2)
spell,_,_,_,startTime,endTime,_,_,notInterrupt=UnitCastingInfo("target")if(spell==nil)then
spell,_,_,_,startTime,endTime,_,notInterrupt=UnitChannelInfo("target")end
if spell~=nil then
if notInterrupt==false then
s4.t:SetColorTexture(1,GBzFRjVV(startTime,endTime),1,IWQcC)else
s4.t:SetColorTexture(0,GBzFRjVV(startTime,endTime),1,IWQcC)end else
if spell==nil then s4.t:SetColorTexture(0,0,0,IWQcC)end end end;local function LLFUU()wilds=tonumber("0.0"..EG72)
dreadstalkers=tonumber("0.0"..mlTMZ)
ARuba.t:SetColorTexture(wilds,0,dreadstalkers,IWQcC)end
local kdmQtj6=nil
local function Hc35_(f7nUIW,bDgD)local Kg8PhSq=UnitIsVisible("target")
if Kg8PhSq==nil then
if
(Kg8PhSq~=kdmQtj6)then FFG.t:SetColorTexture(1,1,1,IWQcC)kdmQtj6=Kg8PhSq end else if Kg8PhSq~=kdmQtj6 then FFG.t:SetColorTexture(1,0,0,IWQcC)
kdmQtj6=Kg8PhSq end end end
local function ubP(Tcv_,lygY,...)if(lygY=="UNIT_SPELLCAST_SUCCEEDED")then
UpdateCastingFrame("player",QBO,...)end end
local function eN0UMW()UpdateCastingFrame("target",jdLnB0vD)end
local function lAG()UpdateCastingFrame("arena1",PSlD)end;local function AvEtR8Y()UpdateCastingFrame("arena2",nN)end;local function rl3MMqfm()
UpdateCastingFrame("arena3",J)end
local function nQj(HG,u)
for m9i,EqPMP in pairs(PlayerBuffs)do
local JR=GetSpellInfo(EqPMP)
if JR==nil then if(hWgmxm[EqPMP]~="BuffOff")then
Oynw[EqPMP].t:SetColorTexture(1,1,1,IWQcC)Oynw[EqPMP].t:SetAllPoints(false)
hWgmxm[EqPMP]="BuffOff"end;return end;local G1Cl6,m9i,m9i,h,m9i,m9i,fYUikw,m9i,m9i,m9i,m9i=UnitBuff("pet",JR)
if(G1Cl6 ==JR)then
local W9qTCm=GetTime()remainingTime=usLpLoaH(fYUikw-W9qTCm,1)
if(hWgmxm[EqPMP]~="BuffOn"..h..
remainingTime)then
local YlaSjEKp,u_ogp8=strsplit(".",remainingTime)local Kob=tonumber(YlaSjEKp)/100
local a3=tonumber(u_ogp8)/100
Oynw[EqPMP].t:SetColorTexture(h/100,Kob,a3,IWQcC)Oynw[EqPMP].t:SetAllPoints(false)end else if(hWgmxm[EqPMP]~="BuffOff")then
Oynw[EqPMP].t:SetColorTexture(1,1,1,IWQcC)Oynw[EqPMP].t:SetAllPoints(false)
hWgmxm[EqPMP]="BuffOff"end end end end
local function Eq8jDq(MvWxr,HgY6)
for Wc,eQ5 in pairs(PlayerDebuffs)do local kvR="UnitDebuff"local So=GetSpellInfo(eQ5)
if So==nil then if(
UIjls[eQ5]~="DebuffOff")then
Vd[eQ5].t:SetColorTexture(1,1,1,IWQcC)Vd[eQ5].t:SetAllPoints(false)
UIjls[eQ5]="DebuffOff"end;return end
local Wi,Wc,Wc,X1WM,Wc,Wc,OVBAVy,Wc,Wc,Wc,Jos,Wc,Wc,Wc,Wc,Wc=UnitDebuff("player",So,nil,"PLAYER|HARMFUL")
if(Wi==So)then local NF0=GetTime()
local OeF=math.floor(OVBAVy-NF0+0.5)
if(UIjls[eQ5]~="DebuffOn"..X1WM..OeF)then UIjls[eQ5]=
"DebuffOn"..X1WM..OeF
OeF=string.format("%00.2f",tostring(OeF))
local sawaLtSr=tonumber(strsub(tostring(OeF),1,2))/100
local KWeL=tonumber(strsub(tostring(OeF),-2,-1))/100
Vd[eQ5].t:SetColorTexture(X1WM/100,sawaLtSr,KWeL,IWQcC)Vd[eQ5].t:SetAllPoints(false)end else if(UIjls[eQ5]~="DebuffOff")then
Vd[eQ5].t:SetColorTexture(1,1,1,IWQcC)Vd[eQ5].t:SetAllPoints(false)
UIjls[eQ5]="DebuffOff"end end end end
local function LnQUN(Krvhod9t,bfx5oN)
for XDKTNXw,RyTb in pairs(SpellCooldowns)do
if IsSpellOverlayed(RyTb)then
cvRh[RyTb].t:SetColorTexture(1,0,0,IWQcC)cvRh[RyTb].t:SetAllPoints(false)else
cvRh[RyTb].t:SetColorTexture(1,1,1,IWQcC)cvRh[RyTb].t:SetAllPoints(false)end end end
local function Gm1(ImqF1v)
for KRu,Vy5qF in pairs(dispel)do local rokDhenZ=GetSpellInfo(Vy5qF)
if rokDhenZ==nil then return 0 end
local td8OL,KRu,KRu,WCS,KRu,i,v2VylMn,KRu,KRu,KRu,Vy5qF,KRu,KRu,KRu,KRu,KRu=UnitDebuff(ImqF1v,rokDhenZ,nil,"HARMFUL")if(td8OL==rokDhenZ)then return 1 end end;return 0 end;local Jp=""
local function NwBqNl3C()if W()==false then return end
local Oi,KwcrRu=IsActiveBattlefieldArena()local bgFJ=IsInRaid()and"raid"or"party"
local fqGD1rfW=GetNumGroupMembers()if(Jp~=bgFJ)then SetupKeybinds()if fqGD1rfW==0 then bgFJ="solo"end
Jp=bgFJ end;local K0="0.0"..fqGD1rfW;if
(fqGD1rfW>=10)then K0="0."..fqGD1rfW end
if(IsInRaid())then
inGame.t:SetColorTexture(tonumber(K0),1,1,IWQcC)else if Oi==1 then
inGame.t:SetColorTexture(tonumber(K0),1,0.5,IWQcC)else
inGame.t:SetColorTexture(tonumber(K0),1,0,IWQcC)end end
if(fqGD1rfW==0)then health=UnitHealth("player")
maxHealth=UnitHealthMax("player")
percHealth=ceil((health/maxHealth)*100)needToDispel=Gm1("player")local _1To2="0.0"..percHealth;if
(percHealth>=10)then _1To2="0."..percHealth end
red=tonumber(_1To2)
for lkzs=1,5 do if(percHealth==100)then
oJ1ec[lkzs].t:SetColorTexture(1,needToDispel,0,IWQcC)else
oJ1ec[lkzs].t:SetColorTexture(red,needToDispel,0,IWQcC)end end;return end
for Hhwf3oO=1,fqGD1rfW do local Oh5=0;local LgQF=0
if(bgFJ=="party")then
if(Hhwf3oO==1)then
health=UnitHealth("player")maxHealth=UnitHealthMax("player")
Oh5=ceil((health/maxHealth)*100)LgQF=Gm1("player")else
health=UnitHealth(bgFJ.. (Hhwf3oO-1))maxHealth=UnitHealthMax(bgFJ.. (Hhwf3oO-1))Oh5=ceil((
health/maxHealth)*100)LgQF=Gm1(bgFJ.. (
Hhwf3oO-1))
local e_Ev8OQ,zBMvU6=xb6:GetRange(bgFJ.. (Hhwf3oO-1))if(zBMvU6 ==nil)then zBMvU6=41 end
if




UnitIsDead(bgFJ.. (Hhwf3oO-1))or UnitIsGhost(bgFJ.. (Hhwf3oO-1))or UnitIsConnected(bgFJ.. (Hhwf3oO-1))==false or UnitInPhase(bgFJ.. (Hhwf3oO-1))==false or zBMvU6 >40 then Oh5=100;LgQF=0 end end end
if(bgFJ=="raid")then health=UnitHealth(bgFJ..Hhwf3oO)maxHealth=UnitHealthMax(
bgFJ..Hhwf3oO)
Oh5=ceil((health/maxHealth)*100)LgQF=Gm1(bgFJ..Hhwf3oO)
local ZmbDgbg,hMxy=xb6:GetRange(bgFJ..Hhwf3oO)if(hMxy==nil)then hMxy=41 end
if

UnitIsDead(bgFJ..Hhwf3oO)or
UnitIsGhost(bgFJ..Hhwf3oO)or
UnitIsConnected(bgFJ..Hhwf3oO)==false or
UnitInPhase(bgFJ..Hhwf3oO)==false or hMxy>40 then Oh5=100;LgQF=0 end end;local emGbhJGH="0.0"..Oh5;if(Oh5 >=10)then emGbhJGH="0."..Oh5 end
red=tonumber(emGbhJGH)if(Oh5 ==100)then
oJ1ec[Hhwf3oO].t:SetColorTexture(1,LgQF,0,IWQcC)else
oJ1ec[Hhwf3oO].t:SetColorTexture(red,LgQF,0,IWQcC)end
oJ1ec[Hhwf3oO].t:SetAllPoints(false)end end;inGame=CreateFrame("frame","",parent)
inGame:SetSize(1,1)inGame:SetPoint("TOPLEFT",30,0)
inGame.t=inGame:CreateTexture()inGame.t:SetColorTexture(0,1,0,IWQcC)
inGame.t:SetAllPoints(inGame)inGame:Show()
startStopFrame=CreateFrame("frame","",parent)startStopFrame:SetSize(1,1)
startStopFrame:SetPoint("TOPLEFT",29,0)startStopFrame.t=startStopFrame:CreateTexture()
startStopFrame.t:SetColorTexture(0,0,0,IWQcC)
startStopFrame.t:SetAllPoints(startStopFrame)startStopFrame:Show()
rangeToTargetFrame=CreateFrame("frame","",parent)rangeToTargetFrame:SetSize(1,1)
rangeToTargetFrame:SetPoint("TOPLEFT",28,0)
rangeToTargetFrame.t=rangeToTargetFrame:CreateTexture()
rangeToTargetFrame.t:SetColorTexture(0,0,0,IWQcC)
rangeToTargetFrame.t:SetAllPoints(rangeToTargetFrame)rangeToTargetFrame:Show()
local function XuqjvYPF()NwBqNl3C()end
local function Trh()local hj3,M7q3pa8=xb6:GetRange("target")
if M7q3pa8 ==nil then M7q3pa8=100 end;local hj3,guEhw=xb6:GetRange("pet")if guEhw==nil then guEhw=100 end;local sll="0.0"..
guEhw;if(guEhw>=10)then sll="0."..guEhw end
green=tonumber(sll)local BzNBgGvD="0.0"..M7q3pa8
if(M7q3pa8 >=10)then BzNBgGvD="0."..M7q3pa8 end;red=tonumber(BzNBgGvD)if(guEhw>=100)then green=1 end;if
(M7q3pa8 >=100)then red=1 end;blue=0
if(UnitExists("Focus"))then blue=1 end
rangeToTargetFrame.t:SetColorTexture(red,green,blue,IWQcC)end;function UpdateHealthFrame(KIQCH,L4bw)local XhBEPD=e7dv(KIQCH)
L4bw.t:SetColorTexture(XhBEPD,0,0,IWQcC)end
function UpdateDebuffFrame(Uq,RmyiI_D)
for w_2iiJwx,RRESd in
pairs(PlayerDebuffs)do local S1qoVmFR=GetSpellInfo(RRESd)if S1qoVmFR==nil then
A5k5yt[RRESd].t:SetColorTexture(0,0,0,IWQcC)return end
local f2,w_2iiJwx,w_2iiJwx,O3rHR,w_2iiJwx,YU80,ARnO_0E,w_2iiJwx,w_2iiJwx,w_2iiJwx,Qh,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx=UnitDebuff(Uq,S1qoVmFR,nil,"PLAYER|HARMFUL")
if RRESd==233490 and(f2 ==S1qoVmFR)then local lqxbMC=0
for LmR5gwW=1,40 do
w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,spellId2,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx,w_2iiJwx=UnitDebuff(Uq,LmR5gwW,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then lqxbMC=lqxbMC+1 end end;O3rHR=lqxbMC end
if(f2 ==S1qoVmFR)then local qOk5Jm=GetTime()
remainingTime=usLpLoaH(ARnO_0E-qOk5Jm,1)local tpSe2fs,AuVgc7=strsplit(".",remainingTime)
local vxnB=tonumber(tpSe2fs)/100;local ZQOXXXd=tonumber(AuVgc7)/100
RmyiI_D[RRESd].t:SetColorTexture(1,vxnB,ZQOXXXd,IWQcC)else
RmyiI_D[RRESd].t:SetColorTexture(0,0,0,IWQcC)end end end
function UpdateCastingFrame(cyBmTv,_TKd0F,...)if not UnitExists(cyBmTv)then return end
local Z=select(10,UnitCastingInfo(cyBmTv))if Z==nil then local doBTofya,doBTofya,doBTofya,doBTofya,rNP=...Z=rNP end;if
Z==nil then
for TL=1,2 do _TKd0F[TL].t:SetColorTexture(0,0,0,IWQcC)end;return end;local Dw=""local bsFpM=""local h=""
for Tzgj_W=1,2 do
if
(Tzgj_W==1)then strRedTemp=strsub(Z,1,1)if(strRedTemp=="")then Dw=1 else
Dw="0."..strRedTemp end;strGreenTemp=strsub(Z,2,2)if
(strGreenTemp=="")then h=1 else h="0."..strGreenTemp end
strBlueTemp=strsub(Z,3,3)
if(strBlueTemp=="")then bsFpM=1 else bsFpM="0."..strBlueTemp end end
if(Tzgj_W==2)then strRedTemp=strsub(Z,4,4)if(strRedTemp=="")then Dw=1 else
Dw="0."..strRedTemp end;strGreenTemp=strsub(Z,5,5)if
(strGreenTemp=="")then h=1 else h="0."..strGreenTemp end
strBlueTemp=strsub(Z,6,6)
if(strBlueTemp=="")then bsFpM=1 else bsFpM="0."..strBlueTemp end end;local g0AS39=tonumber(Dw)local t2=tonumber(h)local PDewNmM=tonumber(bsFpM)
_TKd0F[Tzgj_W].t:SetColorTexture(g0AS39,t2,PDewNmM,IWQcC)end end
function FocusPulse()UpdateHealthFrame("focus",inx0)
UpdateDebuffFrame("focus",A5k5yt)UpdateCastingFrame("focus",B7SHDx7h)end;local K=0;function update(GFlD,y3owm5E)K=K+y3owm5E
if K>=0.2 then Trh()XuqjvYPF()if
(UnitExists("Focus"))then FocusPulse()end;K=0 end end
local function uK()local psHOEe2=0
qccJ5b=CreateFrame("frame","",parent)qccJ5b:SetSize(1,1)
qccJ5b:SetPoint("TOPLEFT",0,0)qccJ5b.t=qccJ5b:CreateTexture()
qccJ5b.t:SetColorTexture(1,1,1,IWQcC)qccJ5b.t:SetAllPoints(qccJ5b)qccJ5b:Show()
qccJ5b:RegisterEvent("PLAYER_ENTERING_WORLD")qccJ5b:RegisterEvent("PLAYER_REGEN_ENABLED")
qccJ5b:RegisterEvent("PLAYER_REGEN_DISABLED")qccJ5b:RegisterUnitEvent("UNIT_HEALTH","player")
qccJ5b:RegisterEvent("PLAYER_TARGET_CHANGED")qccJ5b:SetScript("OnEvent",hgsKvTz)
powerFrame=CreateFrame("frame","",parent)powerFrame:SetSize(1,1)
powerFrame:SetPoint("TOPLEFT",1,0)powerFrame.t=powerFrame:CreateTexture()
powerFrame.t:SetColorTexture(1,1,1,IWQcC)powerFrame.t:SetAllPoints(powerFrame)
powerFrame:Show()
powerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
powerFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
powerFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
powerFrame:RegisterUnitEvent("UNIT_POWER","player")powerFrame:SetScript("OnEvent",qTB82)
targetHealthFrame=CreateFrame("frame","",parent)targetHealthFrame:SetSize(1,1)
targetHealthFrame:SetPoint("TOPLEFT",2,0)
targetHealthFrame.t=targetHealthFrame:CreateTexture()
targetHealthFrame.t:SetColorTexture(1,1,1,IWQcC)
targetHealthFrame.t:SetAllPoints(targetHealthFrame)targetHealthFrame:Show()
targetHealthFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
targetHealthFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
targetHealthFrame:RegisterEvent("UNIT_HEALTH","target")
targetHealthFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
targetHealthFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
targetHealthFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")targetHealthFrame:SetScript("OnEvent",EJTH9)
unitCombatFrame=CreateFrame("frame","",parent)unitCombatFrame:SetSize(1,1)
unitCombatFrame:SetPoint("TOPLEFT",3,0)
unitCombatFrame.t=unitCombatFrame:CreateTexture()
unitCombatFrame.t:SetColorTexture(1,1,1,IWQcC)
unitCombatFrame.t:SetAllPoints(unitCombatFrame)unitCombatFrame:Show()
unitCombatFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
unitCombatFrame:RegisterEvent("PLAYER_REGEN_DISABLED")unitCombatFrame:SetScript("OnEvent",TKu)
unitPowerFrame=CreateFrame("frame","",parent)unitPowerFrame:SetSize(1,1)
unitPowerFrame:SetPoint("TOPLEFT",4,0)unitPowerFrame.t=unitPowerFrame:CreateTexture()
unitPowerFrame.t:SetColorTexture(0,0,0,IWQcC)
unitPowerFrame.t:SetAllPoints(unitPowerFrame)unitPowerFrame:Show()
unitPowerFrame:SetScript("OnUpdate",E2OQ)XRfQ=CreateFrame("frame","",parent)XRfQ:SetSize(1,1)
XRfQ:SetPoint("TOPLEFT",5,0)XRfQ.t=XRfQ:CreateTexture()
XRfQ.t:SetColorTexture(0,1,0,IWQcC)XRfQ.t:SetAllPoints(XRfQ)XRfQ:Show()
XRfQ:RegisterEvent("PLAYER_REGEN_ENABLED")XRfQ:RegisterEvent("PLAYER_REGEN_DISABLED")
XRfQ:RegisterEvent("UNIT_HEALTH","target")XRfQ:RegisterEvent("PLAYER_TARGET_CHANGED")
XRfQ:RegisterEvent("PLAYER_ENTER_COMBAT")XRfQ:RegisterEvent("PLAYER_LEAVE_COMBAT")
XRfQ:SetScript("OnEvent",rh)gFPRdEC=CreateFrame("frame","",parent)
gFPRdEC:SetSize(1,1)gFPRdEC:SetPoint("TOPLEFT",6,0)
gFPRdEC.t=gFPRdEC:CreateTexture()gFPRdEC.t:SetColorTexture(0,1,0,IWQcC)
gFPRdEC.t:SetAllPoints(gFPRdEC)gFPRdEC:Show()
gFPRdEC:RegisterEvent("PLAYER_TARGET_CHANGED")gFPRdEC:RegisterEvent("PLAYER_ENTER_COMBAT")
gFPRdEC:RegisterEvent("PLAYER_LEAVE_COMBAT")gFPRdEC:SetScript("OnEvent",G3p2Yn)
JmE=CreateFrame("frame","",parent)JmE:SetSize(1,1)JmE:SetPoint("TOPLEFT",7,0)
JmE.t=JmE:CreateTexture()JmE.t:SetColorTexture(1,1,1,IWQcC)
JmE.t:SetAllPoints(JmE)JmE:Show()JmE:SetScript("OnUpdate",DMn)
s4=CreateFrame("frame","",parent)s4:SetSize(1,1)s4:SetPoint("TOPLEFT",8,0)
s4.t=s4:CreateTexture()s4.t:SetColorTexture(1,1,1,IWQcC)
s4.t:SetAllPoints(s4)s4:Show()s4:SetScript("OnUpdate",pG4C8fDK)
TI5=CreateFrame("frame","",parent)TI5:SetSize(1,1)TI5:SetPoint("TOPLEFT",9,0)
TI5.t=TI5:CreateTexture()TI5.t:SetColorTexture(1,1,1,IWQcC)
TI5.t:SetAllPoints(TI5)TI5:Show()
TI5:RegisterEvent("PLAYER_ENTERING_WORLD")TI5:RegisterUnitEvent("UNIT_SPELL_HASTE","player")
TI5:SetScript("OnUpdate",EATFLbgY)FFG=CreateFrame("frame","",parent)FFG:SetSize(1,1)
FFG:SetPoint("TOPLEFT",10,0)FFG.t=FFG:CreateTexture()
FFG.t:SetColorTexture(0,1,0,IWQcC)FFG.t:SetAllPoints(FFG)FFG:Show()
FFG:SetScript("OnUpdate",Hc35_)
if
(
Q2waXkyp==6 or Q2waXkyp==3 or Q2waXkyp==9 or Q2waXkyp==8 or Q2waXkyp==7)then a31jEAS=CreateFrame("frame","",parent)
a31jEAS:SetSize(1,1)a31jEAS:SetPoint("TOPLEFT",11,0)
a31jEAS.t=a31jEAS:CreateTexture()a31jEAS.t:SetColorTexture(0,1,0,IWQcC)
a31jEAS.t:SetAllPoints(a31jEAS)a31jEAS:Show()a31jEAS:SetScript("OnUpdate",ay)
petHealthFrame=CreateFrame("frame","",parent)petHealthFrame:SetSize(1,1)
petHealthFrame:SetPoint("TOPLEFT",12,0)petHealthFrame.t=petHealthFrame:CreateTexture()
petHealthFrame.t:SetColorTexture(1,1,1,IWQcC)
petHealthFrame.t:SetAllPoints(petHealthFrame)petHealthFrame:Show()
petHealthFrame:RegisterEvent("UNIT_HEALTH","pet")petHealthFrame:SetScript("OnEvent",Wjojpvg)
ARuba=CreateFrame("frame","",parent)ARuba:SetSize(1,1)ARuba:SetPoint("TOPLEFT",13,0)
ARuba.t=ARuba:CreateTexture()ARuba.t:SetColorTexture(0,1,0,IWQcC)
ARuba.t:SetAllPoints(ARuba)ARuba:Show()ARuba:SetScript("OnUpdate",LLFUU)
local psHOEe2=0
for R1zT,J2Df in pairs(PlayerBuffs)do Oynw[J2Df]=CreateFrame("frame","",parent)
Oynw[J2Df]:SetSize(1,1)Oynw[J2Df]:SetPoint("TOPLEFT",psHOEe2,-9)
Oynw[J2Df].t=Oynw[J2Df]:CreateTexture()Oynw[J2Df].t:SetColorTexture(1,1,1,IWQcC)
Oynw[J2Df].t:SetAllPoints(Oynw[J2Df])Oynw[J2Df]:Show()psHOEe2=psHOEe2+1 end
Oynw[table.maxn(Oynw)]:SetScript("OnUpdate",nQj)end;psHOEe2=0
for YyS,o in pairs(SpellCooldowns)do
_k[o]=CreateFrame("frame","",parent)_k[o]:SetSize(1,1)
_k[o]:SetPoint("TOPLEFT",psHOEe2,-1)_k[o].t=_k[o]:CreateTexture()
_k[o].t:SetColorTexture(1,1,1,IWQcC)_k[o].t:SetAllPoints(_k[o])_k[o]:Show()psHOEe2=
psHOEe2+1 end
_k[table.maxn(_k)]:SetScript("OnUpdate",WzM)psHOEe2=0
for MY16y,ZBUghmX in pairs(SpellCooldowns)do
g3Qeqnr[ZBUghmX]=CreateFrame("frame","",parent)g3Qeqnr[ZBUghmX]:SetSize(1,1)g3Qeqnr[ZBUghmX]:SetPoint("TOPLEFT",psHOEe2,
-2)
g3Qeqnr[ZBUghmX].t=g3Qeqnr[ZBUghmX]:CreateTexture()
g3Qeqnr[ZBUghmX].t:SetColorTexture(1,1,1,IWQcC)
g3Qeqnr[ZBUghmX].t:SetAllPoints(g3Qeqnr[ZBUghmX])g3Qeqnr[ZBUghmX]:Show()psHOEe2=psHOEe2+1 end
g3Qeqnr[table.maxn(g3Qeqnr)]:SetScript("OnUpdate",sode)psHOEe2=0
for ncK,Deq in pairs(PlayerDebuffs)do
A[Deq]=CreateFrame("frame","",parent)A[Deq]:SetSize(1,1)
A[Deq]:SetPoint("TOPLEFT",psHOEe2,-3)A[Deq].t=A[Deq]:CreateTexture()
A[Deq].t:SetColorTexture(1,1,1,IWQcC)A[Deq].t:SetAllPoints(A[Deq])
A[Deq]:Show()psHOEe2=psHOEe2+1 end
A[table.maxn(A)]:SetScript("OnUpdate",PHpCof2)psHOEe2=0
for GH3wE,xZFv in pairs(SpellCooldowns)do
Ef[xZFv]=CreateFrame("frame","",parent)Ef[xZFv]:SetSize(1,1)
Ef[xZFv]:SetPoint("TOPLEFT",psHOEe2,-4)Ef[xZFv].t=Ef[xZFv]:CreateTexture()
Ef[xZFv].t:SetColorTexture(1,1,1,IWQcC)Ef[xZFv].t:SetAllPoints(Ef[xZFv])
Ef[xZFv]:Show()psHOEe2=psHOEe2+1 end
Ef[table.maxn(Ef)]:RegisterEvent("ACTIONBAR_UPDATE_STATE")
Ef[table.maxn(Ef)]:SetScript("OnEvent",IwnA)psHOEe2=0
for bc0w4j,OGMxal0 in pairs(PlayerBuffs)do
gQGq[OGMxal0]=CreateFrame("frame","",parent)gQGq[OGMxal0]:SetSize(1,1)gQGq[OGMxal0]:SetPoint("TOPLEFT",psHOEe2,
-5)
gQGq[OGMxal0].t=gQGq[OGMxal0]:CreateTexture()
gQGq[OGMxal0].t:SetColorTexture(0,1,1,IWQcC)
gQGq[OGMxal0].t:SetAllPoints(gQGq[OGMxal0])gQGq[OGMxal0]:Show()psHOEe2=psHOEe2+1 end
gQGq[table.maxn(gQGq)]:SetScript("OnUpdate",MW)PlayerMovingFrame=CreateFrame("frame","",parent)
PlayerMovingFrame:SetSize(1,1)PlayerMovingFrame:SetPoint("TOPLEFT",0,-6)
PlayerMovingFrame.t=PlayerMovingFrame:CreateTexture()
PlayerMovingFrame.t:SetColorTexture(1,1,1,IWQcC)
PlayerMovingFrame.t:SetAllPoints(PlayerMovingFrame)PlayerMovingFrame:Show()
PlayerMovingFrame:SetScript("OnUpdate",G9zkKODk)AutoAtackingFrame=CreateFrame("frame","",parent)
AutoAtackingFrame:SetSize(1,1)AutoAtackingFrame:SetPoint("TOPLEFT",1,-6)
AutoAtackingFrame.t=AutoAtackingFrame:CreateTexture()
AutoAtackingFrame.t:SetColorTexture(1,1,1,IWQcC)
AutoAtackingFrame.t:SetAllPoints(AutoAtackingFrame)AutoAtackingFrame:Show()
AutoAtackingFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
AutoAtackingFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
AutoAtackingFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")AutoAtackingFrame:SetScript("OnEvent",MGt)
targetIsPlayerFrame=CreateFrame("frame","",parent)targetIsPlayerFrame:SetSize(1,1)targetIsPlayerFrame:SetPoint("TOPLEFT",2,
-6)
targetIsPlayerFrame.t=targetIsPlayerFrame:CreateTexture()
targetIsPlayerFrame.t:SetColorTexture(1,1,1,IWQcC)
targetIsPlayerFrame.t:SetAllPoints(targetIsPlayerFrame)targetIsPlayerFrame:Show()
targetIsPlayerFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
targetIsPlayerFrame:SetScript("OnEvent",ld9GuG4t)EEpoeR=CreateFrame("frame","",parent)
EEpoeR:SetSize(1,1)EEpoeR:SetPoint("TOPLEFT",3,-6)
EEpoeR.t=EEpoeR:CreateTexture()EEpoeR.t:SetColorTexture(1,1,1,IWQcC)
EEpoeR.t:SetAllPoints(EEpoeR)EEpoeR:Show()EEpoeR:SetScript("OnUpdate",KpCCA)end
function GetKeyBinding(QlewVjkq)local Q
if QlewVjkq<=24 or QlewVjkq>72 then Q="ACTIONBUTTON".. (
((QlewVjkq-1)%12)+1)elseif QlewVjkq<=36 then Q=
"MULTIACTIONBAR3BUTTON".. (QlewVjkq-24)elseif QlewVjkq<=48 then Q=
"MULTIACTIONBAR4BUTTON".. (QlewVjkq-36)elseif QlewVjkq<=60 then Q=
"MULTIACTIONBAR2BUTTON".. (QlewVjkq-48)else Q="MULTIACTIONBAR1BUTTON"..
(QlewVjkq-60)end;local yI=Q and GetBindingKey(Q)
if yI and strlen(yI)>4 then
yI=strupper(yI)yI=gsub(yI,"%s+","")yI=gsub(yI,"ALT%-","A|")
yI=gsub(yI,"CTRL%-","C|")yI=gsub(yI,"SHIFT%-","S|")yI=gsub(yI,"NUMPAD","N")
yI=gsub(yI,"PLUS","+")yI=gsub(yI,"MINUS","-")yI=gsub(yI,"MULTIPLY","*")
yI=gsub(yI,"DIVIDE","/")end
if yI~=nil then else
if Bartender4 then
Q="CLICK BT4Button"..QlewVjkq..":LeftButton"yI=Q and GetBindingKey(Q)
if yI and strlen(yI)>4 then
yI=strupper(yI)yI=gsub(yI,"%s+","")yI=gsub(yI,"ALT%-","A|")
yI=gsub(yI,"CTRL%-","C|")yI=gsub(yI,"SHIFT%-","S|")yI=gsub(yI,"NUMPAD","N")
yI=gsub(yI,"PLUS","+")yI=gsub(yI,"MINUS","-")yI=gsub(yI,"MULTIPLY","*")
yI=gsub(yI,"DIVIDE","/")end end end;return yI end
function KeyModifierColor(EDE3)local FpWG11U=strfind(EDE3,"|")
if(FpWG11U~=nil)then
local kRY46C=strsub(EDE3,1,FpWG11U-1)if(kRY46C=="S")then return 0.01 end
if(kRY46C=="C")then return 0.02 end;if(kRY46C=="A")then return 0.03 end end;return 1 end
function KeyBindColor(MvOaiq)local DUic_1K=strfind(MvOaiq,"|")if(DUic_1K~=nil)then
MvOaiq=strsub(MvOaiq,DUic_1K+1)end
if MvOaiq=="\\"then return 0.01 elseif MvOaiq=="["then return 0.02 elseif MvOaiq=="]"then return
0.03 elseif MvOaiq==";"then return 0.04 elseif MvOaiq=="'"then return 0.05 elseif MvOaiq==","then return 0.06 elseif MvOaiq=="."then
return 0.07 elseif MvOaiq=="/"then return 0.08 elseif MvOaiq=="`"then return 0.09 elseif MvOaiq=="-"then return 0.10 elseif MvOaiq=="="then return 0.11 elseif
MvOaiq=="F1"then return 0.12 elseif MvOaiq=="F2"then return 0.13 elseif MvOaiq=="F3"then return 0.14 elseif MvOaiq=="F4"then return 0.15 elseif MvOaiq=="F5"then return
0.16 elseif MvOaiq=="F6"then return 0.17 elseif MvOaiq=="F7"then return 0.18 elseif MvOaiq=="F8"then return 0.19 elseif MvOaiq=="F9"then
return 0.20 elseif MvOaiq=="F10"then return 0.21 elseif MvOaiq=="F11"then return 0.22 elseif MvOaiq=="F12"then return 0.23 elseif MvOaiq=="1"then
return 0.24 elseif MvOaiq=="2"then return 0.25 elseif MvOaiq=="3"then return 0.26 elseif MvOaiq=="4"then return 0.27 elseif MvOaiq=="5"then return 0.28 elseif
MvOaiq=="6"then return 0.29 elseif MvOaiq=="7"then return 0.30 elseif MvOaiq=="8"then return 0.31 elseif MvOaiq=="9"then return 0.32 elseif MvOaiq=="0"then
return 0.33 elseif MvOaiq=="Q"then return 0.34 elseif MvOaiq=="W"then return 0.35 elseif MvOaiq=="E"then return 0.36 elseif MvOaiq=="R"then return 0.37 elseif
MvOaiq=="T"then return 0.38 elseif MvOaiq=="Y"then return 0.39 elseif MvOaiq=="U"then return 0.40 elseif MvOaiq=="I"then return 0.41 elseif MvOaiq=="O"then
return 0.42 elseif MvOaiq=="P"then return 0.43 elseif MvOaiq=="A"then return 0.44 elseif MvOaiq=="S"then return 0.45 elseif MvOaiq=="D"then return 0.46 elseif
MvOaiq=="F"then return 0.47 elseif MvOaiq=="G"then return 0.48 elseif MvOaiq=="H"then return 0.49 elseif MvOaiq=="J"then return 0.50 elseif MvOaiq=="K"then
return 0.51 elseif MvOaiq=="L"then return 0.52 elseif MvOaiq=="Z"then return 0.53 elseif MvOaiq=="X"then return 0.54 elseif MvOaiq=="C"then return 0.55 elseif
MvOaiq=="V"then return 0.56 elseif MvOaiq=="B"then return 0.57 elseif MvOaiq=="N"then return 0.58 elseif MvOaiq=="M"then return 0.59 elseif MvOaiq=="N1"then
return 0.60 elseif MvOaiq=="N2"then return 0.61 elseif MvOaiq=="N3"then return 0.62 elseif MvOaiq=="N4"then return 0.63 elseif MvOaiq=="N5"then return 0.64 elseif
MvOaiq=="N6"then return 0.65 elseif MvOaiq=="N7"then return 0.66 elseif MvOaiq=="N8"then return 0.67 elseif MvOaiq=="N9"then return 0.68 elseif MvOaiq==
"N0"then return 0.69 end;return 1 end
function fixSlots(rVj9z4)if(rVj9z4 <10)then return'00'..rVj9z4 end;if
(rVj9z4 >=10)then return'0'..rVj9z4 end;return''..rVj9z4 end;printKeybinds=0
function RefreshKeyBinds()
if(printKeybinds==1)then
ChatFrame1:Clear()if Bartender4 then print('Bartender4 detected')end end
for mWkmCx,qQpo in pairs(SpellCooldowns)do local qXKzBXo0=GetSpellInfo(qQpo)bindFound=false
for cJ=1,120 do
local HI4G3oH,ncWw,kdS=GetActionInfo(cJ)
if HI4G3oH=="spell"then local OS60=GetKeyBinding(cJ)
if OS60 ~=nil then
if(qQpo==ncWw)then
q[qQpo].t:SetColorTexture(KeyBindColor(OS60),KeyModifierColor(OS60),0,IWQcC)if(printKeybinds==1)then
print('Slot: '..fixSlots(cJ)..
' '..GetSpellLink(qQpo)..','..

KeyBindColor(OS60)..','..KeyModifierColor(OS60)..','..OS60)end
bindFound=true;break end end end
if HI4G3oH=="macro"then actionText=GetActionText(cJ)
name,rank,id=GetMacroSpell(actionText)local dl=GetKeyBinding(cJ)
if dl~=nil then
if(qQpo==id)then
q[qQpo].t:SetColorTexture(KeyBindColor(dl),KeyModifierColor(dl),0,IWQcC)if(printKeybinds==1)then
print('Slot: '..fixSlots(cJ)..
' '..GetSpellLink(qQpo)..','..

KeyBindColor(dl)..','..KeyModifierColor(dl)..','..dl)end
bindFound=true;break end end end end
if bindFound==false and(printKeybinds==1)then if
(GetSpellLink(qQpo))~=nil then
print(GetSpellLink(qQpo)..',not bound')else
print('Spell Id: '..qQpo..',NOT FOUND')end end end;printKeybinds=0 end
local function s0FU()i=0
for lL30T,zt in pairs(SpellCooldowns)do q[zt]=CreateFrame("frame","",parent)
q[zt]:SetSize(1,1)q[zt]:SetPoint("TOPLEFT",i,-14)
q[zt].t=q[zt]:CreateTexture()q[zt].t:SetColorTexture(0,0,0,IWQcC)
q[zt].t:SetAllPoints(q[zt])q[zt]:Show()i=i+1 end
q[table.maxn(q)]:RegisterEvent("SPELL_PUSHED_TO_ACTIONBAR")
q[table.maxn(q)]:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
q[table.maxn(q)]:RegisterEvent("SPELLS_CHANGED")
q[table.maxn(q)]:RegisterEvent("PLAYER_ENTERING_WORLD")
q[table.maxn(q)]:RegisterEvent("UNIT_MODEL_CHANGED")
q[table.maxn(q)]:SetScript("OnEvent",RefreshKeyBinds)local b2UK=0
for b2UK=1,2 do QBO[b2UK]=CreateFrame("FRAME","",parent)
QBO[b2UK]:SetSize(1,1)QBO[b2UK]:SetPoint("TOPLEFT",(b2UK+3),-6)
QBO[b2UK].t=QBO[b2UK]:CreateTexture()QBO[b2UK].t:SetColorTexture(0,0,0,IWQcC)
QBO[b2UK].t:SetAllPoints(QBO[b2UK])QBO[b2UK]:Show()end
QBO[table.maxn(QBO)]:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
QBO[table.maxn(QBO)]:SetScript("OnEvent",ubP)
for b2UK=1,2 do jdLnB0vD[b2UK]=CreateFrame("FRAME","",parent)
jdLnB0vD[b2UK]:SetSize(1,1)
jdLnB0vD[b2UK]:SetPoint("TOPLEFT",(b2UK+5),-6)
jdLnB0vD[b2UK].t=jdLnB0vD[b2UK]:CreateTexture()
jdLnB0vD[b2UK].t:SetColorTexture(0,0,0,IWQcC)
jdLnB0vD[b2UK].t:SetAllPoints(jdLnB0vD[b2UK])jdLnB0vD[b2UK]:Show()end
jdLnB0vD[table.maxn(jdLnB0vD)]:SetScript("OnUpdate",eN0UMW)
for b2UK=1,2 do PSlD[b2UK]=CreateFrame("FRAME","",parent)
PSlD[b2UK]:SetSize(1,1)
PSlD[b2UK]:SetPoint("TOPLEFT",(b2UK+7),-6)PSlD[b2UK].t=PSlD[b2UK]:CreateTexture()
PSlD[b2UK].t:SetColorTexture(0,0,0,IWQcC)PSlD[b2UK].t:SetAllPoints(PSlD[b2UK])
PSlD[b2UK]:Show()end
PSlD[table.maxn(PSlD)]:SetScript("OnUpdate",lAG)
for b2UK=1,2 do nN[b2UK]=CreateFrame("FRAME","",parent)
nN[b2UK]:SetSize(1,1)nN[b2UK]:SetPoint("TOPLEFT",(b2UK+9),-6)
nN[b2UK].t=nN[b2UK]:CreateTexture()nN[b2UK].t:SetColorTexture(0,0,0,IWQcC)
nN[b2UK].t:SetAllPoints(nN[b2UK])nN[b2UK]:Show()end
nN[table.maxn(nN)]:SetScript("OnUpdate",AvEtR8Y)
for b2UK=1,2 do J[b2UK]=CreateFrame("FRAME","",parent)
J[b2UK]:SetSize(1,1)J[b2UK]:SetPoint("TOPLEFT",(b2UK+11),-6)
J[b2UK].t=J[b2UK]:CreateTexture()J[b2UK].t:SetColorTexture(0,0,0,IWQcC)
J[b2UK].t:SetAllPoints(J[b2UK])J[b2UK]:Show()end
J[table.maxn(J)]:SetScript("OnUpdate",rl3MMqfm)b2UK=0
for Ofgm3g,z6WE21dc in pairs(PlayerBuffs)do
KfM[z6WE21dc]=CreateFrame("frame","",parent)KfM[z6WE21dc]:SetSize(1,1)KfM[z6WE21dc]:SetPoint("TOPLEFT",b2UK,
-7)
KfM[z6WE21dc].t=KfM[z6WE21dc]:CreateTexture()
KfM[z6WE21dc].t:SetColorTexture(1,1,1,IWQcC)
KfM[z6WE21dc].t:SetAllPoints(KfM[z6WE21dc])KfM[z6WE21dc]:Show()b2UK=b2UK+1 end
KfM[table.maxn(KfM)]:SetScript("OnUpdate",cW)b2UK=0
for rJg9H,sNyznm3W in pairs(InventoryItems)do
OyHc5FEv[sNyznm3W]=CreateFrame("frame","",parent)OyHc5FEv[sNyznm3W]:SetSize(1,1)OyHc5FEv[sNyznm3W]:SetPoint("TOPLEFT",b2UK,
-8)
OyHc5FEv[sNyznm3W].t=OyHc5FEv[sNyznm3W]:CreateTexture()
OyHc5FEv[sNyznm3W].t:SetColorTexture(1,1,1,IWQcC)
OyHc5FEv[sNyznm3W].t:SetAllPoints(OyHc5FEv[sNyznm3W])OyHc5FEv[sNyznm3W]:Show()b2UK=b2UK+1 end;if(table.getn(InventoryItems)~=0)then
OyHc5FEv[table.maxn(OyHc5FEv)]:SetScript("OnUpdate",PSx)end;b2UK=0
for UU,YBciOAz2 in pairs(PlayerDebuffs)do
Vd[YBciOAz2]=CreateFrame("frame","",parent)Vd[YBciOAz2]:SetSize(1,1)Vd[YBciOAz2]:SetPoint("TOPLEFT",b2UK,-
10)
Vd[YBciOAz2].t=Vd[YBciOAz2]:CreateTexture()
Vd[YBciOAz2].t:SetColorTexture(1,1,1,IWQcC)
Vd[YBciOAz2].t:SetAllPoints(Vd[YBciOAz2])Vd[YBciOAz2]:Show()
Vd[YBciOAz2]:SetScript("OnUpdate",Eq8jDq)b2UK=b2UK+1 end
Vd[table.maxn(Vd)]:SetScript("OnUpdate",Eq8jDq)b2UK=0
for wJvNH,dOvZoN in pairs(SpellCooldowns)do
cvRh[dOvZoN]=CreateFrame("frame","",parent)cvRh[dOvZoN]:SetSize(1,1)cvRh[dOvZoN]:SetPoint("TOPLEFT",b2UK,-
11)
cvRh[dOvZoN].t=cvRh[dOvZoN]:CreateTexture()
cvRh[dOvZoN].t:SetColorTexture(1,1,1,IWQcC)
cvRh[dOvZoN].t:SetAllPoints(cvRh[dOvZoN])cvRh[dOvZoN]:Show()b2UK=b2UK+1 end;if(table.getn(SpellCooldowns)~=0)then
cvRh[table.maxn(cvRh)]:SetScript("OnUpdate",LnQUN)end
for b2UK=1,5 do
W9yaJm[b2UK]=CreateFrame("frame","",parent)W9yaJm[b2UK]:SetSize(1,1)W9yaJm[b2UK]:SetPoint("TOPLEFT",(b2UK),
-12)
W9yaJm[b2UK].t=W9yaJm[b2UK]:CreateTexture()
W9yaJm[b2UK].t:SetColorTexture(1,1,1,IWQcC)
W9yaJm[b2UK].t:SetAllPoints(W9yaJm[b2UK])W9yaJm[b2UK]:Show()end
W9yaJm[table.maxn(W9yaJm)]:RegisterEvent("PLAYER_ENTERING_WORLD")
W9yaJm[table.maxn(W9yaJm)]:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
W9yaJm[table.maxn(W9yaJm)]:RegisterEvent("PLAYER_REGEN_DISABLED")
W9yaJm[table.maxn(W9yaJm)]:SetScript("OnEvent",jv)wUVm.npcCountFrame=CreateFrame("frame","",parent)
wUVm.npcCountFrame:SetSize(1,1)
wUVm.npcCountFrame:SetPoint("TOPLEFT",0,-22)
wUVm.npcCountFrame.t=wUVm.npcCountFrame:CreateTexture()
wUVm.npcCountFrame.t:SetColorTexture(1,1,1,IWQcC)
wUVm.npcCountFrame.t:SetAllPoints(wUVm.npcCountFrame)wUVm.npcCountFrame:Show()
wUVm.npcCountFrame:SetScript("OnUpdate",BlW0RhJA)local FC0yhp=IsInRaid()and"raid"or"party"b2UK=0
for IP01vP=1,30 do
oJ1ec[IP01vP]=CreateFrame("frame","",parent)oJ1ec[IP01vP]:SetSize(1,1)oJ1ec[IP01vP]:SetPoint("TOPLEFT",b2UK,
-13)
oJ1ec[IP01vP].t=oJ1ec[IP01vP]:CreateTexture()
oJ1ec[IP01vP].t:SetColorTexture(0,0,0,IWQcC)
oJ1ec[IP01vP].t:SetAllPoints(oJ1ec[IP01vP])oJ1ec[IP01vP]:Show()b2UK=b2UK+1 end;inx0=CreateFrame("frame","",parent)inx0:SetSize(1,1)inx0:SetPoint("TOPLEFT",0,
-19)inx0.t=inx0:CreateTexture()
inx0.t:SetColorTexture(0,0,0,IWQcC)inx0.t:SetAllPoints(inx0)inx0:Show()b2UK=0
for DIoX3,sjXYan in
pairs(PlayerDebuffs)do A5k5yt[sjXYan]=CreateFrame("frame","",parent)
A5k5yt[sjXYan]:SetSize(1,1)
A5k5yt[sjXYan]:SetPoint("TOPLEFT",b2UK,-20)
A5k5yt[sjXYan].t=A5k5yt[sjXYan]:CreateTexture()
A5k5yt[sjXYan].t:SetColorTexture(0,0,0,IWQcC)
A5k5yt[sjXYan].t:SetAllPoints(A5k5yt[sjXYan])A5k5yt[sjXYan]:Show()b2UK=b2UK+1 end
for b2UK=1,2 do B7SHDx7h[b2UK]=CreateFrame("FRAME","",parent)
B7SHDx7h[b2UK]:SetSize(1,1)
B7SHDx7h[b2UK]:SetPoint("TOPLEFT",b2UK,-19)
B7SHDx7h[b2UK].t=B7SHDx7h[b2UK]:CreateTexture()
B7SHDx7h[b2UK].t:SetColorTexture(0,0,0,IWQcC)
B7SHDx7h[b2UK].t:SetAllPoints(B7SHDx7h[b2UK])B7SHDx7h[b2UK]:Show()end end;local function wQl()EG72=0 end;local function g()mlTMZ=0 end
local function m4u(KxB8fW,M,...)local JmyAd=...if M=="ADDON_LOADED"then if
(JmyAd=="[Frozen]")then uK()s0FU()end end
if M==
"NAME_PLATE_UNIT_ADDED"then Uy(select(1,...))rHLz2GD()end
if M=="PLAYER_ENTERING_WORLD"then EG72=0;mlTMZ=0;hrVI4meU=GetSpecialization()xEq6TAF=

hrVI4meU and select(1,GetSpecializationInfo(hrVI4meU))or 0;yK()end;if M=="PLAYER_REGEN_DISABLED"then n()end;if M=="PLAYER_REGEN_ENABLED"then
n()rHLz2GD()end
if M=="COMBAT_LOG_EVENT_UNFILTERED"then
local L,U,uAbuU,EF205E,YFR5myC,K1Lgio,KMu,PPqE,sOE,hf9m_U8,dTQ=...
if EF205E==UnitGUID('player')then
if U=="SPELL_SUMMON"then
local k29Z4,k29Z4,k29Z4,k29Z4,k29Z4,k29Z4,k29Z4,a,k29Z4=PPqE:find('(%S+)-(%d+)-(%d+)-(%d+)-(%d+)-(%d+)-(%S+)')a=tonumber(a)if(a==55659)then EG72=EG72+1
C_Timer.After(12,wQl)end;if(a==98035)then mlTMZ=mlTMZ+1
C_Timer.After(12,g)end;return end end end end;parent:SetScript("OnEvent",m4u)
parent:SetScript("OnUpdate",update)