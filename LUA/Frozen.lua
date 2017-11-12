local rb21L2=0;local o_v255=0;local wUVm={}local VQ=nil
local oTYNsnP={["Human"]=0.01,["Dwarf"]=0.02,["NightElf"]=0.03,["Gnome"]=0.04,["Draenei"]=0.05,["Pandaren"]=0.06,["Orc"]=0.07,["Scourge"]=0.08,["Tauren"]=0.09,["Troll"]=0.10,["BloodElf"]=0.11,["Goblin"]=0.12,["Worgen"]=0.13}
local I={[0]=0.00,[250]=0.01,[251]=0.02,[252]=0.03,[577]=0.04,[581]=0.05,[102]=0.06,[103]=0.07,[104]=0.08,[105]=0.09,[253]=0.10,[254]=0.11,[255]=0.12,[62]=0.13,[63]=0.14,[64]=0.15,[268]=0.16,[269]=0.17,[270]=0.18,[65]=0.19,[66]=0.20,[70]=0.21,[256]=0.22,[257]=0.23,[258]=0.24,[259]=0.25,[260]=0.26,[261]=0.27,[262]=0.28,[263]=0.29,[264]=0.30,[265]=0.31,[71]=0.32,[72]=0.33,[73]=0.34,[266]=0.35,[267]=0.36}
local LmR5gwW={[0]="Death Strike",[250]="Death Strike",[251]="Frost Strike",[252]="Festering Strike",[577]="Chaos Strike",[581]="Shear",[102]="Solar Wrath",[103]="Shred",[104]="Mangle",[105]="Solar Wrath",[253]="Counter Shot",[254]="Counter Shot",[255]="Mongoose Bite",[62]="Arcane Blast",[63]="Fireball",[64]="Frostbolt",[268]="Blackout Strike",[269]="Rising Sun Kick",[270]="Rising Sun Kick",[65]="Crusader Strike",[66]="Shield of the Righteous",[70]="Crusader Strike",[256]="Penance",[257]="Smite",[258]="Mind Blast",[259]="Mutilate",[260]="Saber Slash",[261]="Backstab",[262]="Lightning Bolt",[263]="Rockbiter",[264]="Lightning Bolt",[265]="Agony",[71]="Mortal Strike",[72]="Bloodthirst",[73]="Devastate",[266]="Doom",[267]="Incinerate"}local DfbW;local sh={}local rrFLbCtj={}local YcPea0vg={}local usLpLoaH={}local e7dv={}local inx0={}local A5k5yt={}local B7SHDx7h={}
local EEpoeR={}local _k=0;local Ef=GetSpecialization()local KfM=0;local Vd={}local Oynw={}local QBO={}local s4ggux={}
local hrVI4meU={}local xEq6TAF={}local UIjls={}local jdLnB0vD={}local PSlD={}local nN=nil;local J=nil;local A={}local g3Qeqnr=nil;local qHpY64=nil
local z={}local qccJ5b=nil;local ARuba=nil;local Wo53nZ=nil;local XRfQ=nil;local gFPRdEC=nil;local lw9gLt3={}local TI5={}local JmE={}
local s4={}local FFG={}local a31jEAS={}local LS4h={}local eux092_P={}local ZA9=0;local hWgmxm=0;local UBg54E=0;local gQGq=0;local OyHc5FEv=0
local Dn1Xi=nil;local _gGmBBE=1;local rIX4={}local AI14eFhp={}local iW2O={}local Gdp,nbqmx,IWQcC=UnitClass("player")
local cvRh=0;local W9yaJm=0;local oJ1ec={}local LMMNWLk=LibStub("LibRangeCheck-2.0")
PlayerIsInCombat=false;local x6Ni=GetCurrentResolution()
local Q2waXkyp=select(x6Ni,GetScreenResolutions())local EG72,mlTMZ=strsplit("x",Q2waXkyp,2)
local q=GetScreenWidth()/EG72;parent=CreateFrame("frame","Recount",UIParent)
parent:SetSize(40,25)parent:SetPoint("TOPLEFT",0,0)parent:SetScale(q)
parent:RegisterEvent("ADDON_LOADED")parent:RegisterEvent("NAME_PLATE_UNIT_ADDED")
parent:RegisterEvent("PLAYER_ENTERING_WORLD")parent:RegisterEvent("PLAYER_REGEN_DISABLED")
parent:RegisterEvent("PLAYER_REGEN_ENABLED")
parent:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")parent.t=parent:CreateTexture()
parent.t:SetColorTexture(0,0,0,1)parent.t:SetAllPoints(parent)
parent:SetFrameStrata("TOOLTIP")local function xb6(s0FU,wQl)return
(("%%.%df"):format(wQl)):format(s0FU)end
local function yK(g)if UnitIsDead(g)or
UnitIsGhost(g)then return 0 end;local m4u=UnitHealth(g)
local StZ=UnitHealthMax(g)local C1NqzxY=ceil((m4u/StZ)*100)local T1gVrYq="0.0"..C1NqzxY;if(
C1NqzxY>=10)then T1gVrYq="0."..C1NqzxY end
val=tonumber(T1gVrYq)if C1NqzxY==100 then val=1 end;return val end
local function rHLz2GD()
KfM=Ef and
select(1,GetSpecializationInfo(GetSpecialization()))or 0;o_v255=0;local P5G=LmR5gwW[KfM]
for JC,PDA in pairs(wUVm)do
if PDA~=nil then
if
(







KfM==581 or KfM==70 or
KfM==261 or KfM==269 or KfM==263 or KfM==71 or KfM==72 or KfM==73 or KfM==66 or KfM==259 or KfM==250 or KfM==251 or KfM==252 or KfM==255 or KfM==268 or KfM==270)then local Kqne5Stra,FKLmmhnQ=LMMNWLk:GetRange(JC)
if FKLmmhnQ==nil then FKLmmhnQ=100 end;local F82=8;if(KfM==261 or KfM==250 or KfM==259)then
F82=10 end;if
UnitCanAttack("player",JC)and FKLmmhnQ<=F82 and UnitIsDead(JC)==false then
o_v255=o_v255+1 end else if UnitCanAttack("player",JC)and
LibStub("SpellRange-1.0").IsSpellInRange(P5G,JC)==1 and
UnitIsDead(JC)==false then
o_v255=o_v255+1 end end end end;o_v255=o_v255/100
VQ.t:SetColorTexture(1,o_v255,rb21L2,_gGmBBE)end
local function BlW0RhJA(wJ6tY_)local TNg=false;for wO9T,QMcSUqdi in pairs(wUVm)do wUVm[wO9T]=nil end
for sKy2P9i=1,30 do
if UnitGUID("nameplate"..
sKy2P9i)~=nil and not
UnitIsPlayer("nameplate"..sKy2P9i)then for S,AD in pairs(wUVm)do
if AD==UnitGUID(
"nameplate"..sKy2P9i)then TNg=true end end
if TNg==false then wUVm["nameplate"..sKy2P9i]=UnitGUID(
"nameplate"..sKy2P9i)TNg=false end end;TNg=false end end
local function Uy(AkxLdb66,aUR,...)if aUR=="PLAYER_REGEN_ENABLED"then PlayerIsInCombat=false
unitCombatFrame.t:SetColorTexture(1,1,1,_gGmBBE)end;if
aUR=="PLAYER_REGEN_DISABLED"then PlayerIsInCombat=true
unitCombatFrame.t:SetColorTexture(1,0,0,_gGmBBE)end end
local function n(c4)under=math.floor(c4)upper=math.floor(c4)+1;underV=-
(under-c4)upperV=upper-c4
if(upperV>underV)then return under else return upper end end
local function TKu()Ef=GetSpecialization()KfM=Ef and
select(1,GetSpecializationInfo(Ef))or 0
local ZNXs3Bwd={}AllSeven=false
for Ginn=1,GetMaxTalentTier()do talenetSelected=false
for h_pK=1,3 do
local L=select(4,GetTalentInfo(Ginn,h_pK,1))
if(L==true)then ZNXs3Bwd[Ginn]=h_pK/100;talenetSelected=true end
if talenetSelected==false and h_pK==3 then ZNXs3Bwd[Ginn]=0 end end;if Ginn==7 then AllSeven=true end end;if not AllSeven then
for vBKFXR3=GetMaxTalentTier(),7 do ZNXs3Bwd[vBKFXR3]=0 end end
AI14eFhp[1].t:SetColorTexture(ZNXs3Bwd[1],ZNXs3Bwd[2],ZNXs3Bwd[3],_gGmBBE)
AI14eFhp[2].t:SetColorTexture(ZNXs3Bwd[4],ZNXs3Bwd[5],ZNXs3Bwd[6],_gGmBBE)
AI14eFhp[3].t:SetColorTexture(ZNXs3Bwd[7],oTYNsnP[select(2,UnitRace("player"))],0,_gGmBBE)
AI14eFhp[4].t:SetColorTexture(I[KfM],0,0,_gGmBBE)end
local function M6kL()if not UnitExists("target")then return end
for FP3j,fe in pairs(PlayerBuffs)do
local ggnA=GetSpellInfo(fe)
local KaD2ExEO,FP3j,FP3j,FP3j,FP3j,FP3j,TpiFT,FP3j,FP3j,FP3j,JCH=UnitBuff("target",ggnA,nil,"PLAYER")
if(KaD2ExEO==ggnA and TpiFT~=0)then local sJ05I=TpiFT-GetTime()-
select(4,GetNetStats())/1000
sJ05I=xb6(sJ05I,1)local HrLCim,w=strsplit(".",sJ05I)
local sUu7z=tonumber(HrLCim)/100;local M5oB=tonumber(w)/100;if(sUu7z>1)then sUu7z=1 end
a31jEAS[fe].t:SetColorTexture(1,sUu7z,M5oB,_gGmBBE)a31jEAS[fe].t:SetAllPoints(false)else
a31jEAS[fe].t:SetColorTexture(0,1,1,_gGmBBE)a31jEAS[fe].t:SetAllPoints(false)end end end
local function M7o_()local xIyIKo=0;if IWQcC==2 then
xIyIKo=UnitPower("player",SPELL_POWER_HOLY_POWER)end;if IWQcC==9 then
xIyIKo=UnitPower("player",SPELL_POWER_SOUL_SHARDS)end;if IWQcC==8 then
xIyIKo=UnitPower("player",SPELL_POWER_ARCANE_CHARGES)end;if IWQcC==4 then
xIyIKo=UnitPower("player",SPELL_POWER_COMBO_POINTS)end;if IWQcC==11 then
xIyIKo=UnitPower("player",SPELL_POWER_COMBO_POINTS)end
if IWQcC==6 then
local f2x=UnitPower("player",SPELL_POWER_RUNES)local Nwl=6;local Xpt_SQ=1;for Xpt_SQ=1,f2x do
local Y=select(3,GetRuneCooldown(Xpt_SQ))if not Y then Nwl=Nwl-1 end end
xIyIKo=Nwl end
if IWQcC==10 then xIyIKo=UnitPower("player",SPELL_POWER_CHI)end;if xIyIKo~=OyHc5FEv then
unitPowerFrame.t:SetColorTexture(0,xIyIKo/100,0,_gGmBBE)unitPowerFrame.t:SetAllPoints(false)
OyHc5FEv=xIyIKo end end;local dk2X7J7=nil
local function jv(SMa,Bo)local zF6ZPjQ=UnitExists("pet")
if
(zF6ZPjQ==false or UnitIsDead("pet"))then if(zF6ZPjQ~=dk2X7J7)then
gFPRdEC.t:SetColorTexture(1,1,1,_gGmBBE)dk2X7J7=zF6ZPjQ end else if zF6ZPjQ~=dk2X7J7 and not
UnitIsDead("player")then
gFPRdEC.t:SetColorTexture(1,0,0,_gGmBBE)dk2X7J7=zF6ZPjQ end end end
local function MW()if KfM==270 or KfM==65 or KfM==257 or KfM==256 or KfM==
264 or KfM==105 then return
true else return false end end
local function E2OQ(nNQG3,yW)
for efGM8UMy,KhH in pairs(SpellCooldowns)do local H4tXd,Nq6If,efGM8UMy=GetSpellCooldown(KhH)
local II=(H4tXd+Nq6If-
GetTime()-select(4,GetNetStats())/1000)if II<0 then II=0 end;local Y_tefq=GetSpellInfo(KhH)
local i,a3u=IsUsableSpell(Y_tefq)
if II~=0 then II=xb6(II,1)local nzhB,sTxVGmb=strsplit(".",II)
local GSIcq=tonumber(nzhB)/100;local Go=tonumber(sTxVGmb)/100
usLpLoaH[KhH].t:SetColorTexture(0,GSIcq,Go,_gGmBBE)usLpLoaH[KhH].t:SetAllPoints(false)else if(a3u and
MW())then
usLpLoaH[KhH].t:SetColorTexture(0,1,1,_gGmBBE)else
usLpLoaH[KhH].t:SetColorTexture(1,1,1,_gGmBBE)end
usLpLoaH[KhH].t:SetAllPoints(false)end end end
local function SnbfLb6(DGf,kgRX7X)
for JB,GGJhclKa in pairs(InventoryItems)do local KWahIz,X2kyW,JB=GetItemCooldown(GGJhclKa)local pVlvW=
KWahIz+X2kyW-GetTime()local QcKn_=0;if pVlvW<0 then pVlvW=0 end
local jiM=0;if IsEquippedItem(GGJhclKa)then jiM=1 else jiM=0 end;local YUdA=
GetItemCount(GGJhclKa)/100;if YUdA>=100 then QcKn_=1 end;if pVlvW==0 or
QcKn_==0 then
LS4h[GGJhclKa].t:SetColorTexture(0,jiM,QcKn_,_gGmBBE)else
LS4h[GGJhclKa].t:SetColorTexture(1,jiM,QcKn_,_gGmBBE)end end end
local function ay(lx3cpJ,Yx9)
for Mn,ut0 in pairs(SpellCooldowns)do charges,Mn,Mn,Mn=GetSpellCharges(ut0)if
(ut0 ==205406 or
ut0 ==115072 or ut0 ==101546)then charges=GetSpellCount(ut0)end;if(
TI5[ut0]~=charges)then
e7dv[ut0].t:SetColorTexture(0,charges/100,0,_gGmBBE)e7dv[ut0].t:SetAllPoints(false)
TI5[ut0]=charges end end end
local function W(ZFhlP6eg,ExUgDG)
for jc4o42jz,jc in pairs(PlayerBuffs)do local Ojz_=GetSpellInfo(jc)if(Ojz_==nil)then print(
'Unable to find aura (Buff) with Id: '..jc)
return end
local x,jc4o42jz,jc4o42jz,Xtecl,jc4o42jz,KVcYU,_,jc4o42jz,jc4o42jz,jc4o42jz,C=UnitBuff("player",Ojz_)
if(jc==120694)and UnitBuff("player",Ojz_)then local CJeG=0
for x6Ni=1,40 do
local x,jc4o42jz,jc4o42jz,jc4o42jz,jc4o42jz,jc4o42jz,jc4o42jz,jc4o42jz,jc4o42jz,jc4o42jz,C,jc4o42jz,jc4o42jz,jc4o42jz,jc4o42jz,jc4o42jz=UnitBuff("player",x6Ni)if C==120694 then CJeG=CJeG+1 end end;Xtecl=CJeG end
if(x==Ojz_)then local F43eMG=GetTime()remainingTime=xb6(_-F43eMG,1)
local mCzjh4,lU=strsplit(".",remainingTime)local epQue9=tonumber(mCzjh4)/100
local cHUJrj=tonumber(lU)/100
inx0[jc].t:SetColorTexture(Xtecl/100,epQue9,cHUJrj,_gGmBBE)inx0[jc].t:SetAllPoints(false)else
inx0[jc].t:SetColorTexture(1,1,1,_gGmBBE)inx0[jc].t:SetAllPoints(false)end end end
local function WzM(EI0x,E)
for lacOdjf9,R2h4lP4l in pairs(PlayerDebuffs)do local Fh=GetSpellInfo(R2h4lP4l)
if Fh==nil then
if(FFG[R2h4lP4l]~=
"DebuffOff")then
xEq6TAF[R2h4lP4l].t:SetColorTexture(1,1,1,_gGmBBE)
xEq6TAF[R2h4lP4l].t:SetAllPoints(false)FFG[R2h4lP4l]="DebuffOff"end;return end
local a2e9fa,lacOdjf9,lacOdjf9,Rc9_ZID,lacOdjf9,H1HF2wD6,hBph,lacOdjf9,lacOdjf9,lacOdjf9,bxNo9h,lacOdjf9,lacOdjf9,lacOdjf9,lacOdjf9,lacOdjf9=UnitDebuff("target",Fh,nil,"PLAYER|HARMFUL")
if R2h4lP4l==233490 and(a2e9fa==Fh)then local Khst=0
for x6Ni=1,40 do
name2,lacOdjf9,lacOdjf9,count2,lacOdjf9,H1HF2wD6,expirationTime2,lacOdjf9,lacOdjf9,lacOdjf9,spellId2,lacOdjf9,lacOdjf9,lacOdjf9,lacOdjf9,lacOdjf9=UnitDebuff("target",x6Ni,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then Khst=Khst+1 end end;Rc9_ZID=Khst end
if(a2e9fa==Fh)then local pUT=GetTime()remainingTime=xb6(hBph-pUT,1)
if
(
FFG[R2h4lP4l]~="DebuffOn"..Rc9_ZID..remainingTime)then local ISg1,Gh5UJya=strsplit(".",remainingTime)
local k=tonumber(ISg1)/100;local Z8Ue=tonumber(Gh5UJya)/100;if bxNo9h==34914 then end
xEq6TAF[R2h4lP4l].t:SetColorTexture(
Rc9_ZID/100,k,Z8Ue,_gGmBBE)
FFG[R2h4lP4l]="DebuffOn"..Rc9_ZID..remainingTime end else
if(FFG[R2h4lP4l]~="DebuffOff")then
xEq6TAF[R2h4lP4l].t:SetColorTexture(1,1,1,_gGmBBE)FFG[R2h4lP4l]="DebuffOff"end end end end;local PSx={}
local function IwnA(TXbmx,r)
for Pqgz415t,McNxKV in pairs(SpellCooldowns)do local WcwGYJh=0
local gJt,Pqgz415t,Pqgz415t,Pqgz415t,Pqgz415t,Pqgz415t=GetSpellInfo(McNxKV)if(gJt==nil)then WcwGYJh=0 else
WcwGYJh=LibStub("SpellRange-1.0").IsSpellInRange(McNxKV,"target")end
if PSx[McNxKV]~=WcwGYJh then if(
WcwGYJh==1)then
UIjls[McNxKV].t:SetColorTexture(1,0,0,_gGmBBE)else
UIjls[McNxKV].t:SetColorTexture(1,1,1,_gGmBBE)end
UIjls[McNxKV].t:SetAllPoints(false)PSx[McNxKV]=WcwGYJh end end end
local function cW()
if GetUnitSpeed("Player")==0 then Movetime=GetTime()
PlayerMovingFrame.t:SetColorTexture(1,1,1,_gGmBBE)else
PlayerMovingFrame.t:SetColorTexture(1,0,0,_gGmBBE)end end
local function cW()mountedplayer=0;moveTime=1;if IsMounted()then mountedplayer=.5 end;if
GetUnitSpeed("Player")==0 then moveTime=0 end
PlayerMovingFrame.t:SetColorTexture(moveTime,mountedplayer,1,_gGmBBE)end
local function PHpCof2()if IsCurrentSpell(6603)then
AutoAtackingFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
AutoAtackingFrame.t:SetColorTexture(1,1,1,_gGmBBE)end end
local function bUPpn4T2()
if UnitGUID("target")==UnitGUID("player")then
targetIsPlayerFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
targetIsPlayerFrame.t:SetColorTexture(1,1,1,_gGmBBE)end end;local function sode()
if IsOutdoors()then
YcPea0vg.t:SetColorTexture(1,0,0,_gGmBBE)else YcPea0vg.t:SetColorTexture(1,1,1,_gGmBBE)end end
local G9zkKODk=0
local function MGt(hCs8M,GkjCn_mq)local T9sySp=UnitLevel("player")local DL0mMXM=0;local o4Kvi75g=0;local ELb=0
local FV5="0.0"..T9sySp;if(T9sySp>=10)then FV5="0."..T9sySp end
o4Kvi75g=tonumber(FV5)
if(T9sySp>100)then o4Kvi75g=0;T9sySp=T9sySp-100;local rUT="0.0"..T9sySp;if
(T9sySp>=10)then rUT="0."..T9sySp end;ELb=tonumber(rUT)end;local sX=UnitHealth("player")local DH6mUlGB=UnitHealthMax("player")local A4ZRczp=ceil((
sX/DH6mUlGB)*100)
if
UnitIsDead("player")or UnitIsGhost("player")then A4ZRczp=0 end
if(A4ZRczp~=G9zkKODk)then local g="0.0"..A4ZRczp;if(A4ZRczp>=10)then
g="0."..A4ZRczp end;DL0mMXM=tonumber(g)
if(A4ZRczp==100)then if
(T9sySp==100)then nN.t:SetColorTexture(1,1,0,_gGmBBE)else
nN.t:SetColorTexture(1,o4Kvi75g,ELb,_gGmBBE)end else
nN.t:SetColorTexture(DL0mMXM,o4Kvi75g,ELb,_gGmBBE)end;G9zkKODk=A4ZRczp end end;local ld9GuG4t=0
local function KpCCA(JPi,Kkl6fa)local t=UnitHealth("pet")local H=UnitHealthMax("pet")if H==nil then
H=1 end;if H==0 then H=1 end;local glZrOuSo=ceil((t/H)*100)
if
(ld9GuG4t~=glZrOuSo)then local Zdzaj=0;local UxRGyO9e="0.0"..glZrOuSo;if(glZrOuSo>=10)then
UxRGyO9e="0."..glZrOuSo end;Zdzaj=tonumber(UxRGyO9e)if(glZrOuSo==100)then
petHealthFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
petHealthFrame.t:SetColorTexture(Zdzaj,0,0,_gGmBBE)end
ld9GuG4t=glZrOuSo end end;local H6=0
local function hgsKvTz(fvj_L,_CPU89l)local U=UnitGUID("target")local Kwxn=0;local yp5DGSwX=100;local Sb1Mw7R=0;if(U~=nil)then
Kwxn=UnitHealth("target")yp5DGSwX=UnitHealthMax("target")
Sb1Mw7R=ceil((Kwxn/yp5DGSwX)*100)end
if(Sb1Mw7R~=H6)then
local fuF=0;local pA2="0.0"..Sb1Mw7R
if(Sb1Mw7R>=10)then pA2="0."..Sb1Mw7R end;fuF=tonumber(pA2)if(Sb1Mw7R==100)then
targetHealthFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
targetHealthFrame.t:SetColorTexture(fuF,0,0,_gGmBBE)end;H6=Sb1Mw7R end end
local function zEt(M5lAedm,_uYRl2kj)local tbN=UnitPower("player")local x=UnitPowerMax("player")
if
(tbN~=_k)then _k=tbN
if
(

(IWQcC==7 and KfM==264)or(IWQcC==2)or
(IWQcC==5)or(IWQcC==8)or
(IWQcC==9)or(IWQcC==10 and KfM==270)or(IWQcC==11 and KfM==102)or(IWQcC==11 and KfM==105))then tbN=ceil((tbN/x)*100)end;local m=0;local VVQ=0;local Jb="0.0"..tbN;if(tbN>=10)then Jb="0."..tbN end
m=tonumber(Jb)
if(tbN>100)then m=0;tbN=tbN-100;local qcpea="0.0"..tbN;if(tbN>=10)then
qcpea="0."..tbN end;VVQ=tonumber(qcpea)end;if(tbN==100)then
powerFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
powerFrame.t:SetColorTexture(m,VVQ,0,_gGmBBE)end end end;local Wjojpvg=0
local function l2PqbWw()local tjDBv=math.floor(GetHaste())local vmn7v=0;if lasthaste==tjDBv then
return end;lastehaste=tjDBv;local Au1mzs=0;if tjDBv==math.abs(tjDBv)then
Au1mzs=1 else Au1mzs=0 end
if(tjDBv>=100)then
vmn7v=math.floor(tjDBv/100)tjDBv=tjDBv- (vmn7v*100)end
local u39i=math.abs(tonumber(strsub(tostring(tjDBv),1,2))/100)
qccJ5b.t:SetColorTexture(Au1mzs,vmn7v,u39i,_gGmBBE)end;local EJTH9=true
local function qTB82(Fdg7p,GD3AP)isFriend=UnitIsFriend("player","target")
if
(isFriend~=EJTH9)then
if(isFriend==true)then
g3Qeqnr.t:SetColorTexture(0,1,0,_gGmBBE)else g3Qeqnr.t:SetColorTexture(0,0,1,_gGmBBE)end;EJTH9=isFriend end end;local KL=""
local function EATFLbgY()local jph00k=UnitGUID("target")
local wE_4o=LibStub("LibBossIDs-1.0")local F=UnitIsDead("target")local bUO1NvT=UnitLevel("player")
if
(jph00k~=KL)then
if jph00k==nil then qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)else
if
jph00k~=nil then
local KRQG,tVwI_N,tVwI_N,tVwI_N,tVwI_N,Jkp2lGXG=strsplit(" - ",UnitGUID("target"))
if wE_4o.BossIDs[tonumber(Jkp2lGXG)]then
qHpY64.t:SetColorTexture(0,0,1,_gGmBBE)elseif KRQG=="Player"then
qHpY64.t:SetColorTexture(1,0,0,_gGmBBE)elseif not wE_4o.BossIDs[tonumber(Jkp2lGXG)]then
if Jkp2lGXG~=nil then
if




tonumber(Jkp2lGXG)==114631 or tonumber(Jkp2lGXG)==114822 or tonumber(Jkp2lGXG)==90463 or tonumber(Jkp2lGXG)==90418 or tonumber(Jkp2lGXG)==90431 then qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)else
qHpY64.t:SetColorTexture(1,0,0,_gGmBBE)end end elseif(jph00k~=nil and F==true)then
qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)end end end;KL=jph00k end end;local FF=0;local rh=""
local function YcCR(ifcyuS,V03W)spell,_,_,_,_,_,_,castID,_=UnitCastingInfo("player")
name,_,text,_,_,_,_,_=UnitChannelInfo("player")
if castID~=nil then if castID~=FF then
ARuba.t:SetColorTexture(1,0,0,_gGmBBE)FF=castID end else if castID~=FF then
ARuba.t:SetColorTexture(1,1,1,_gGmBBE)FF=castID end end
if name~=nil then if text~=rh then
ARuba.t:SetColorTexture(0,1,0,_gGmBBE)rh=text end else if text~=rh then
ARuba.t:SetColorTexture(1,1,1,_gGmBBE)rh=text end end end;local function G3p2Yn(R,X6_)return
math.abs(X6_-GetTime()*1000)/math.abs(X6_-R)end
local function _jkkD9(tN5u,Yqc0GWr)
spell,_,_,_,startTime,endTime,_,_,notInterrupt=UnitCastingInfo("target")if(spell==nil)then
spell,_,_,_,startTime,endTime,_,notInterrupt=UnitChannelInfo("target")end
if spell~=nil then
if notInterrupt==false then
Wo53nZ.t:SetColorTexture(1,G3p2Yn(startTime,endTime),1,_gGmBBE)else
Wo53nZ.t:SetColorTexture(0,G3p2Yn(startTime,endTime),1,_gGmBBE)end else
if spell==nil then Wo53nZ.t:SetColorTexture(0,0,0,_gGmBBE)end end end
local function D()wilds=tonumber("0.0"..cvRh)
dreadstalkers=tonumber("0.0"..W9yaJm)J.t:SetColorTexture(wilds,0,dreadstalkers,_gGmBBE)end;local DMn=nil
local function GBzFRjVV(UC7,WbvvcjER)local rOLxXC=UnitIsVisible("target")
if rOLxXC==nil then if(rOLxXC~=DMn)then
XRfQ.t:SetColorTexture(1,1,1,_gGmBBE)DMn=rOLxXC end else if rOLxXC~=DMn then
XRfQ.t:SetColorTexture(1,0,0,_gGmBBE)DMn=rOLxXC end end end
local function pG4C8fDK(w762p7sZ,_7jt,...)if(_7jt=="UNIT_SPELLCAST_SUCCEEDED")then
UpdateCastingFrame("player",EEpoeR,...)end end
local function LLFUU()UpdateCastingFrame("target",Oynw)end
local function kdmQtj6()UpdateCastingFrame("arena1",QBO)end
local function Hc35_()UpdateCastingFrame("arena2",s4ggux)end
local function ubP()UpdateCastingFrame("arena3",hrVI4meU)end
local function eN0UMW(ORXyFQ,OL1oV)
for Q,HQvT5 in pairs(PlayerBuffs)do local dN=GetSpellInfo(HQvT5)
if dN==nil then
if
(s4[HQvT5]~="BuffOff")then
B7SHDx7h[HQvT5].t:SetColorTexture(1,1,1,_gGmBBE)
B7SHDx7h[HQvT5].t:SetAllPoints(false)s4[HQvT5]="BuffOff"end;return end;local B35igHj,Q,Q,o8pPC2,Q,Q,f7nUIW,Q,Q,Q,Q=UnitBuff("pet",dN)
if(B35igHj==dN)then
local bDgD=GetTime()remainingTime=xb6(f7nUIW-bDgD,1)
if(s4[HQvT5]~="BuffOn"..
o8pPC2 ..remainingTime)then
local Kg8PhSq,Tcv_=strsplit(".",remainingTime)local lygY=tonumber(Kg8PhSq)/100
local HG=tonumber(Tcv_)/100
B7SHDx7h[HQvT5].t:SetColorTexture(o8pPC2/100,lygY,HG,_gGmBBE)
B7SHDx7h[HQvT5].t:SetAllPoints(false)end else
if(s4[HQvT5]~="BuffOff")then
B7SHDx7h[HQvT5].t:SetColorTexture(1,1,1,_gGmBBE)
B7SHDx7h[HQvT5].t:SetAllPoints(false)s4[HQvT5]="BuffOff"end end end end
local function lAG(u,m9i)
for EqPMP,JR in pairs(PlayerDebuffs)do local G1Cl6="UnitDebuff"local h=GetSpellInfo(JR)
if h==nil then if(Vd[JR]~=
"DebuffOff")then
A5k5yt[JR].t:SetColorTexture(1,1,1,_gGmBBE)A5k5yt[JR].t:SetAllPoints(false)
Vd[JR]="DebuffOff"end;return end
local fYUikw,EqPMP,EqPMP,W9qTCm,EqPMP,EqPMP,YlaSjEKp,EqPMP,EqPMP,EqPMP,u_ogp8,EqPMP,EqPMP,EqPMP,EqPMP,EqPMP=UnitDebuff("player",h,nil,"PLAYER|HARMFUL")
if(fYUikw==h)then local Kob=GetTime()
local a3=math.floor(YlaSjEKp-Kob+0.5)
if(Vd[JR]~="DebuffOn"..W9qTCm..a3)then Vd[JR]="DebuffOn"..
W9qTCm..a3
a3=string.format("%00.2f",tostring(a3))
local MvWxr=tonumber(strsub(tostring(a3),1,2))/100
local HgY6=tonumber(strsub(tostring(a3),-2,-1))/100
A5k5yt[JR].t:SetColorTexture(W9qTCm/100,MvWxr,HgY6,_gGmBBE)A5k5yt[JR].t:SetAllPoints(false)end else if(Vd[JR]~="DebuffOff")then
A5k5yt[JR].t:SetColorTexture(1,1,1,_gGmBBE)A5k5yt[JR].t:SetAllPoints(false)
Vd[JR]="DebuffOff"end end end end
local function AvEtR8Y(Wc,eQ5)
for kvR,So in pairs(SpellCooldowns)do
if IsSpellOverlayed(So)then
rIX4[So].t:SetColorTexture(1,0,0,_gGmBBE)rIX4[So].t:SetAllPoints(false)else
rIX4[So].t:SetColorTexture(1,1,1,_gGmBBE)rIX4[So].t:SetAllPoints(false)end end end
local function rl3MMqfm(Wi)
for X1WM,OVBAVy in pairs(dispel)do local Jos=GetSpellInfo(OVBAVy)if Jos==nil then return 0 end
local NF0,X1WM,X1WM,OeF,X1WM,sawaLtSr,KWeL,X1WM,X1WM,X1WM,OVBAVy,X1WM,X1WM,X1WM,X1WM,X1WM=UnitDebuff(Wi,Jos,
nil,"HARMFUL")if(NF0 ==Jos)then return 1 end end;return 0 end;local nQj=""
local function Eq8jDq()if MW()==false then return end
local Krvhod9t,bfx5oN=IsActiveBattlefieldArena()local XDKTNXw=IsInRaid()and"raid"or"party"
local RyTb=GetNumGroupMembers()if(nQj~=XDKTNXw)then SetupKeybinds()
if RyTb==0 then XDKTNXw="solo"end;nQj=XDKTNXw end
local ImqF1v="0.0"..RyTb;if(RyTb>=10)then ImqF1v="0."..RyTb end
if(IsInRaid())then
inGame.t:SetColorTexture(tonumber(ImqF1v),1,1,_gGmBBE)else if Krvhod9t==1 then
inGame.t:SetColorTexture(tonumber(ImqF1v),1,0.5,_gGmBBE)else
inGame.t:SetColorTexture(tonumber(ImqF1v),1,0,_gGmBBE)end end
if(RyTb==0)then health=UnitHealth("player")
maxHealth=UnitHealthMax("player")
percHealth=ceil((health/maxHealth)*100)needToDispel=rl3MMqfm("player")local KRu="0.0"..percHealth;if
(percHealth>=10)then KRu="0."..percHealth end;red=tonumber(KRu)
for Vy5qF=1,5 do if(
percHealth==100)then
iW2O[Vy5qF].t:SetColorTexture(1,needToDispel,0,_gGmBBE)else
iW2O[Vy5qF].t:SetColorTexture(red,needToDispel,0,_gGmBBE)end end;return end
for rokDhenZ=1,RyTb do local td8OL=0;local WCS=0
if(XDKTNXw=="party")then
if(rokDhenZ==1)then
health=UnitHealth("player")maxHealth=UnitHealthMax("player")
td8OL=ceil((health/maxHealth)*100)WCS=rl3MMqfm("player")else
health=UnitHealth(XDKTNXw.. (rokDhenZ-1))
maxHealth=UnitHealthMax(XDKTNXw.. (rokDhenZ-1))td8OL=ceil((health/maxHealth)*100)WCS=rl3MMqfm(
XDKTNXw.. (rokDhenZ-1))
local v2VylMn,Oi=LMMNWLk:GetRange(
XDKTNXw.. (rokDhenZ-1))if(Oi==nil)then Oi=41 end
if



UnitIsDead(XDKTNXw.. (rokDhenZ-1))or UnitIsGhost(XDKTNXw.. (rokDhenZ-1))or
UnitIsConnected(XDKTNXw.. (rokDhenZ-1))==false or UnitInPhase(XDKTNXw..
(rokDhenZ-1))==false or Oi>40 then td8OL=100;WCS=0 end end end
if(XDKTNXw=="raid")then
health=UnitHealth(XDKTNXw..rokDhenZ)maxHealth=UnitHealthMax(XDKTNXw..rokDhenZ)td8OL=ceil((health/
maxHealth)*100)WCS=rl3MMqfm(XDKTNXw..
rokDhenZ)
local KwcrRu,bgFJ=LMMNWLk:GetRange(XDKTNXw..rokDhenZ)if(bgFJ==nil)then bgFJ=41 end
if


UnitIsDead(XDKTNXw..rokDhenZ)or UnitIsGhost(
XDKTNXw..rokDhenZ)or
UnitIsConnected(XDKTNXw..rokDhenZ)==false or UnitInPhase(XDKTNXw..rokDhenZ)==false or bgFJ>40 then td8OL=100;WCS=0 end end;local i="0.0"..td8OL;if(td8OL>=10)then i="0."..td8OL end
red=tonumber(i)if(td8OL==100)then
iW2O[rokDhenZ].t:SetColorTexture(1,WCS,0,_gGmBBE)else
iW2O[rokDhenZ].t:SetColorTexture(red,WCS,0,_gGmBBE)end
iW2O[rokDhenZ].t:SetAllPoints(false)end end;inGame=CreateFrame("frame","",parent)
inGame:SetSize(1,1)inGame:SetPoint("TOPLEFT",30,0)
inGame.t=inGame:CreateTexture()inGame.t:SetColorTexture(0,1,0,_gGmBBE)
inGame.t:SetAllPoints(inGame)inGame:Show()
startStopFrame=CreateFrame("frame","",parent)startStopFrame:SetSize(1,1)
startStopFrame:SetPoint("TOPLEFT",29,0)startStopFrame.t=startStopFrame:CreateTexture()
startStopFrame.t:SetColorTexture(0,0,0,_gGmBBE)
startStopFrame.t:SetAllPoints(startStopFrame)startStopFrame:Show()
rangeToTargetFrame=CreateFrame("frame","",parent)rangeToTargetFrame:SetSize(1,1)
rangeToTargetFrame:SetPoint("TOPLEFT",28,0)
rangeToTargetFrame.t=rangeToTargetFrame:CreateTexture()
rangeToTargetFrame.t:SetColorTexture(0,0,0,_gGmBBE)
rangeToTargetFrame.t:SetAllPoints(rangeToTargetFrame)rangeToTargetFrame:Show()local function LnQUN()Eq8jDq()end
local function Gm1()
local fqGD1rfW,K0=LMMNWLk:GetRange("target")if K0 ==nil then K0=100 end;local fqGD1rfW,_1To2=LMMNWLk:GetRange("pet")if
_1To2 ==nil then _1To2=100 end;local lkzs="0.0".._1To2;if(_1To2 >=10)then lkzs="0."..
_1To2 end;green=tonumber(lkzs)
local Hhwf3oO="0.0"..K0;if(K0 >=10)then Hhwf3oO="0."..K0 end;red=tonumber(Hhwf3oO)if(
_1To2 >=100)then green=1 end;if(K0 >=100)then red=1 end;blue=0;if
(UnitExists("Focus"))then blue=1 end
rangeToTargetFrame.t:SetColorTexture(red,green,blue,_gGmBBE)end;function UpdateHealthFrame(Oh5,LgQF)local emGbhJGH=yK(Oh5)
LgQF.t:SetColorTexture(emGbhJGH,0,0,_gGmBBE)end
function UpdateDebuffFrame(e_Ev8OQ,zBMvU6)
for ZmbDgbg,hMxy in
pairs(PlayerDebuffs)do local hj3=GetSpellInfo(hMxy)if hj3 ==nil then
sh[hMxy].t:SetColorTexture(0,0,0,_gGmBBE)return end
local M7q3pa8,ZmbDgbg,ZmbDgbg,guEhw,ZmbDgbg,sll,BzNBgGvD,ZmbDgbg,ZmbDgbg,ZmbDgbg,KIQCH,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg=UnitDebuff(e_Ev8OQ,hj3,nil,"PLAYER|HARMFUL")
if hMxy==233490 and(M7q3pa8 ==hj3)then local L4bw=0
for x6Ni=1,40 do
ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,spellId2,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg,ZmbDgbg=UnitDebuff(e_Ev8OQ,x6Ni,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then L4bw=L4bw+1 end end;guEhw=L4bw end
if(M7q3pa8 ==hj3)then local XhBEPD=GetTime()
remainingTime=xb6(BzNBgGvD-XhBEPD,1)local Uq,RmyiI_D=strsplit(".",remainingTime)
local w_2iiJwx=tonumber(Uq)/100;local RRESd=tonumber(RmyiI_D)/100
zBMvU6[hMxy].t:SetColorTexture(1,w_2iiJwx,RRESd,_gGmBBE)else
zBMvU6[hMxy].t:SetColorTexture(0,0,0,_gGmBBE)end end end
function UpdateCastingFrame(S1qoVmFR,f2,...)if not UnitExists(S1qoVmFR)then return end
local O3rHR=select(10,UnitCastingInfo(S1qoVmFR))
if O3rHR==nil then local lqxbMC,lqxbMC,lqxbMC,lqxbMC,qOk5Jm=...O3rHR=qOk5Jm end
if O3rHR==nil then for tpSe2fs=1,2 do
f2[tpSe2fs].t:SetColorTexture(0,0,0,_gGmBBE)end;return end;local YU80=""local ARnO_0E=""local Qh=""
for AuVgc7=1,2 do
if(AuVgc7 ==1)then strRedTemp=strsub(O3rHR,1,1)
if(
strRedTemp=="")then YU80=1 else YU80="0."..strRedTemp end;strGreenTemp=strsub(O3rHR,2,2)if(strGreenTemp=="")then Qh=1 else
Qh="0."..strGreenTemp end;strBlueTemp=strsub(O3rHR,3,3)if
(strBlueTemp=="")then ARnO_0E=1 else ARnO_0E="0."..strBlueTemp end end
if(AuVgc7 ==2)then strRedTemp=strsub(O3rHR,4,4)if(strRedTemp=="")then YU80=1 else YU80=
"0."..strRedTemp end
strGreenTemp=strsub(O3rHR,5,5)
if(strGreenTemp=="")then Qh=1 else Qh="0."..strGreenTemp end;strBlueTemp=strsub(O3rHR,6,6)if(strBlueTemp=="")then ARnO_0E=1 else ARnO_0E="0."..
strBlueTemp end end;local vxnB=tonumber(YU80)local ZQOXXXd=tonumber(Qh)
local cyBmTv=tonumber(ARnO_0E)
f2[AuVgc7].t:SetColorTexture(vxnB,ZQOXXXd,cyBmTv,_gGmBBE)end end
function FocusPulse()UpdateHealthFrame("focus",DfbW)
UpdateDebuffFrame("focus",sh)UpdateCastingFrame("focus",rrFLbCtj)end;local Jp=0
function update(_TKd0F,Z)Jp=Jp+Z;if Jp>=0.2 then Gm1()LnQUN()if(UnitExists("Focus"))then
FocusPulse()end;Jp=0 end end
local function NwBqNl3C()local Dw=0;nN=CreateFrame("frame","",parent)nN:SetSize(1,1)
nN:SetPoint("TOPLEFT",0,0)nN.t=nN:CreateTexture()
nN.t:SetColorTexture(1,1,1,_gGmBBE)nN.t:SetAllPoints(nN)nN:Show()
nN:RegisterEvent("PLAYER_ENTERING_WORLD")nN:RegisterEvent("PLAYER_REGEN_ENABLED")
nN:RegisterEvent("PLAYER_REGEN_DISABLED")nN:RegisterUnitEvent("UNIT_HEALTH","player")
nN:RegisterEvent("PLAYER_TARGET_CHANGED")nN:SetScript("OnEvent",MGt)
powerFrame=CreateFrame("frame","",parent)powerFrame:SetSize(1,1)
powerFrame:SetPoint("TOPLEFT",1,0)powerFrame.t=powerFrame:CreateTexture()
powerFrame.t:SetColorTexture(1,1,1,_gGmBBE)powerFrame.t:SetAllPoints(powerFrame)
powerFrame:Show()
powerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
powerFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
powerFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
powerFrame:RegisterUnitEvent("UNIT_POWER","player")powerFrame:SetScript("OnEvent",zEt)
targetHealthFrame=CreateFrame("frame","",parent)targetHealthFrame:SetSize(1,1)
targetHealthFrame:SetPoint("TOPLEFT",2,0)
targetHealthFrame.t=targetHealthFrame:CreateTexture()
targetHealthFrame.t:SetColorTexture(1,1,1,_gGmBBE)
targetHealthFrame.t:SetAllPoints(targetHealthFrame)targetHealthFrame:Show()
targetHealthFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
targetHealthFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
targetHealthFrame:RegisterEvent("UNIT_HEALTH","target")
targetHealthFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
targetHealthFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
targetHealthFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")
targetHealthFrame:SetScript("OnEvent",hgsKvTz)unitCombatFrame=CreateFrame("frame","",parent)
unitCombatFrame:SetSize(1,1)unitCombatFrame:SetPoint("TOPLEFT",3,0)
unitCombatFrame.t=unitCombatFrame:CreateTexture()
unitCombatFrame.t:SetColorTexture(1,1,1,_gGmBBE)
unitCombatFrame.t:SetAllPoints(unitCombatFrame)unitCombatFrame:Show()
unitCombatFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
unitCombatFrame:RegisterEvent("PLAYER_REGEN_DISABLED")unitCombatFrame:SetScript("OnEvent",Uy)
unitPowerFrame=CreateFrame("frame","",parent)unitPowerFrame:SetSize(1,1)
unitPowerFrame:SetPoint("TOPLEFT",4,0)unitPowerFrame.t=unitPowerFrame:CreateTexture()
unitPowerFrame.t:SetColorTexture(0,0,0,_gGmBBE)
unitPowerFrame.t:SetAllPoints(unitPowerFrame)unitPowerFrame:Show()
unitPowerFrame:SetScript("OnUpdate",M7o_)g3Qeqnr=CreateFrame("frame","",parent)
g3Qeqnr:SetSize(1,1)g3Qeqnr:SetPoint("TOPLEFT",5,0)
g3Qeqnr.t=g3Qeqnr:CreateTexture()g3Qeqnr.t:SetColorTexture(0,1,0,_gGmBBE)
g3Qeqnr.t:SetAllPoints(g3Qeqnr)g3Qeqnr:Show()
g3Qeqnr:RegisterEvent("PLAYER_REGEN_ENABLED")g3Qeqnr:RegisterEvent("PLAYER_REGEN_DISABLED")
g3Qeqnr:RegisterEvent("UNIT_HEALTH","target")g3Qeqnr:RegisterEvent("PLAYER_TARGET_CHANGED")
g3Qeqnr:RegisterEvent("PLAYER_ENTER_COMBAT")g3Qeqnr:RegisterEvent("PLAYER_LEAVE_COMBAT")
g3Qeqnr:SetScript("OnEvent",qTB82)qHpY64=CreateFrame("frame","",parent)
qHpY64:SetSize(1,1)qHpY64:SetPoint("TOPLEFT",6,0)
qHpY64.t=qHpY64:CreateTexture()qHpY64.t:SetColorTexture(0,1,0,_gGmBBE)
qHpY64.t:SetAllPoints(qHpY64)qHpY64:Show()
qHpY64:RegisterEvent("PLAYER_TARGET_CHANGED")qHpY64:RegisterEvent("PLAYER_ENTER_COMBAT")
qHpY64:RegisterEvent("PLAYER_LEAVE_COMBAT")qHpY64:SetScript("OnEvent",EATFLbgY)
ARuba=CreateFrame("frame","",parent)ARuba:SetSize(1,1)ARuba:SetPoint("TOPLEFT",7,0)
ARuba.t=ARuba:CreateTexture()ARuba.t:SetColorTexture(1,1,1,_gGmBBE)
ARuba.t:SetAllPoints(ARuba)ARuba:Show()ARuba:SetScript("OnUpdate",YcCR)
Wo53nZ=CreateFrame("frame","",parent)Wo53nZ:SetSize(1,1)
Wo53nZ:SetPoint("TOPLEFT",8,0)Wo53nZ.t=Wo53nZ:CreateTexture()
Wo53nZ.t:SetColorTexture(1,1,1,_gGmBBE)Wo53nZ.t:SetAllPoints(Wo53nZ)Wo53nZ:Show()
Wo53nZ:SetScript("OnUpdate",_jkkD9)qccJ5b=CreateFrame("frame","",parent)
qccJ5b:SetSize(1,1)qccJ5b:SetPoint("TOPLEFT",9,0)
qccJ5b.t=qccJ5b:CreateTexture()qccJ5b.t:SetColorTexture(1,1,1,_gGmBBE)
qccJ5b.t:SetAllPoints(qccJ5b)qccJ5b:Show()
qccJ5b:RegisterEvent("PLAYER_ENTERING_WORLD")
qccJ5b:RegisterUnitEvent("UNIT_SPELL_HASTE","player")qccJ5b:SetScript("OnUpdate",l2PqbWw)
XRfQ=CreateFrame("frame","",parent)XRfQ:SetSize(1,1)XRfQ:SetPoint("TOPLEFT",10,0)
XRfQ.t=XRfQ:CreateTexture()XRfQ.t:SetColorTexture(0,1,0,_gGmBBE)
XRfQ.t:SetAllPoints(XRfQ)XRfQ:Show()XRfQ:SetScript("OnUpdate",GBzFRjVV)
if(
IWQcC==6 or IWQcC==3 or IWQcC==9 or IWQcC==8 or
IWQcC==7)then
gFPRdEC=CreateFrame("frame","",parent)gFPRdEC:SetSize(1,1)
gFPRdEC:SetPoint("TOPLEFT",11,0)gFPRdEC.t=gFPRdEC:CreateTexture()
gFPRdEC.t:SetColorTexture(0,1,0,_gGmBBE)gFPRdEC.t:SetAllPoints(gFPRdEC)
gFPRdEC:Show()gFPRdEC:SetScript("OnUpdate",jv)
petHealthFrame=CreateFrame("frame","",parent)petHealthFrame:SetSize(1,1)
petHealthFrame:SetPoint("TOPLEFT",12,0)petHealthFrame.t=petHealthFrame:CreateTexture()
petHealthFrame.t:SetColorTexture(1,1,1,_gGmBBE)
petHealthFrame.t:SetAllPoints(petHealthFrame)petHealthFrame:Show()
petHealthFrame:RegisterEvent("UNIT_HEALTH","pet")petHealthFrame:SetScript("OnEvent",KpCCA)
J=CreateFrame("frame","",parent)J:SetSize(1,1)J:SetPoint("TOPLEFT",13,0)
J.t=J:CreateTexture()J.t:SetColorTexture(0,1,0,_gGmBBE)
J.t:SetAllPoints(J)J:Show()J:SetScript("OnUpdate",D)local Dw=0
for bsFpM,h in pairs(PlayerBuffs)do
B7SHDx7h[h]=CreateFrame("frame","",parent)B7SHDx7h[h]:SetSize(1,1)
B7SHDx7h[h]:SetPoint("TOPLEFT",Dw,-9)B7SHDx7h[h].t=B7SHDx7h[h]:CreateTexture()
B7SHDx7h[h].t:SetColorTexture(1,1,1,_gGmBBE)
B7SHDx7h[h].t:SetAllPoints(B7SHDx7h[h])B7SHDx7h[h]:Show()Dw=Dw+1 end
B7SHDx7h[table.maxn(B7SHDx7h)]:SetScript("OnUpdate",eN0UMW)end;Dw=0
for doBTofya,rNP in pairs(SpellCooldowns)do
usLpLoaH[rNP]=CreateFrame("frame","",parent)usLpLoaH[rNP]:SetSize(1,1)usLpLoaH[rNP]:SetPoint("TOPLEFT",Dw,
-1)
usLpLoaH[rNP].t=usLpLoaH[rNP]:CreateTexture()
usLpLoaH[rNP].t:SetColorTexture(1,1,1,_gGmBBE)
usLpLoaH[rNP].t:SetAllPoints(usLpLoaH[rNP])usLpLoaH[rNP]:Show()Dw=Dw+1 end
usLpLoaH[table.maxn(usLpLoaH)]:SetScript("OnUpdate",E2OQ)Dw=0
for TL,Tzgj_W in pairs(SpellCooldowns)do
UIjls[Tzgj_W]=CreateFrame("frame","",parent)UIjls[Tzgj_W]:SetSize(1,1)UIjls[Tzgj_W]:SetPoint("TOPLEFT",Dw,
-2)
UIjls[Tzgj_W].t=UIjls[Tzgj_W]:CreateTexture()
UIjls[Tzgj_W].t:SetColorTexture(1,1,1,_gGmBBE)
UIjls[Tzgj_W].t:SetAllPoints(UIjls[Tzgj_W])UIjls[Tzgj_W]:Show()Dw=Dw+1 end
UIjls[table.maxn(UIjls)]:SetScript("OnUpdate",IwnA)Dw=0
for g0AS39,t2 in pairs(PlayerDebuffs)do
xEq6TAF[t2]=CreateFrame("frame","",parent)xEq6TAF[t2]:SetSize(1,1)
xEq6TAF[t2]:SetPoint("TOPLEFT",Dw,-3)xEq6TAF[t2].t=xEq6TAF[t2]:CreateTexture()
xEq6TAF[t2].t:SetColorTexture(1,1,1,_gGmBBE)
xEq6TAF[t2].t:SetAllPoints(xEq6TAF[t2])xEq6TAF[t2]:Show()Dw=Dw+1 end
xEq6TAF[table.maxn(xEq6TAF)]:SetScript("OnUpdate",WzM)Dw=0
for PDewNmM,GFlD in pairs(SpellCooldowns)do
e7dv[GFlD]=CreateFrame("frame","",parent)e7dv[GFlD]:SetSize(1,1)
e7dv[GFlD]:SetPoint("TOPLEFT",Dw,-4)e7dv[GFlD].t=e7dv[GFlD]:CreateTexture()
e7dv[GFlD].t:SetColorTexture(1,1,1,_gGmBBE)e7dv[GFlD].t:SetAllPoints(e7dv[GFlD])
e7dv[GFlD]:Show()Dw=Dw+1 end
e7dv[table.maxn(e7dv)]:RegisterEvent("ACTIONBAR_UPDATE_STATE")
e7dv[table.maxn(e7dv)]:SetScript("OnEvent",ay)Dw=0
for y3owm5E,psHOEe2 in pairs(PlayerBuffs)do
a31jEAS[psHOEe2]=CreateFrame("frame","",parent)a31jEAS[psHOEe2]:SetSize(1,1)a31jEAS[psHOEe2]:SetPoint("TOPLEFT",Dw,
-5)
a31jEAS[psHOEe2].t=a31jEAS[psHOEe2]:CreateTexture()
a31jEAS[psHOEe2].t:SetColorTexture(0,1,1,_gGmBBE)
a31jEAS[psHOEe2].t:SetAllPoints(a31jEAS[psHOEe2])a31jEAS[psHOEe2]:Show()Dw=Dw+1 end
a31jEAS[table.maxn(a31jEAS)]:SetScript("OnUpdate",M6kL)PlayerMovingFrame=CreateFrame("frame","",parent)
PlayerMovingFrame:SetSize(1,1)PlayerMovingFrame:SetPoint("TOPLEFT",0,-6)
PlayerMovingFrame.t=PlayerMovingFrame:CreateTexture()
PlayerMovingFrame.t:SetColorTexture(1,1,1,_gGmBBE)
PlayerMovingFrame.t:SetAllPoints(PlayerMovingFrame)PlayerMovingFrame:Show()
PlayerMovingFrame:SetScript("OnUpdate",cW)AutoAtackingFrame=CreateFrame("frame","",parent)
AutoAtackingFrame:SetSize(1,1)AutoAtackingFrame:SetPoint("TOPLEFT",1,-6)
AutoAtackingFrame.t=AutoAtackingFrame:CreateTexture()
AutoAtackingFrame.t:SetColorTexture(1,1,1,_gGmBBE)
AutoAtackingFrame.t:SetAllPoints(AutoAtackingFrame)AutoAtackingFrame:Show()
AutoAtackingFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
AutoAtackingFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
AutoAtackingFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")
AutoAtackingFrame:SetScript("OnEvent",PHpCof2)targetIsPlayerFrame=CreateFrame("frame","",parent)
targetIsPlayerFrame:SetSize(1,1)targetIsPlayerFrame:SetPoint("TOPLEFT",2,-6)
targetIsPlayerFrame.t=targetIsPlayerFrame:CreateTexture()
targetIsPlayerFrame.t:SetColorTexture(1,1,1,_gGmBBE)
targetIsPlayerFrame.t:SetAllPoints(targetIsPlayerFrame)targetIsPlayerFrame:Show()
targetIsPlayerFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
targetIsPlayerFrame:SetScript("OnEvent",bUPpn4T2)YcPea0vg=CreateFrame("frame","",parent)
YcPea0vg:SetSize(1,1)YcPea0vg:SetPoint("TOPLEFT",3,-6)
YcPea0vg.t=YcPea0vg:CreateTexture()YcPea0vg.t:SetColorTexture(1,1,1,_gGmBBE)
YcPea0vg.t:SetAllPoints(YcPea0vg)YcPea0vg:Show()
YcPea0vg:SetScript("OnUpdate",sode)end
function GetKeyBinding(R1zT)local J2Df
if R1zT<=24 or R1zT>72 then J2Df="ACTIONBUTTON"..
(((R1zT-1)%12)+1)elseif R1zT<=36 then
J2Df="MULTIACTIONBAR3BUTTON".. (R1zT-24)elseif R1zT<=48 then J2Df="MULTIACTIONBAR4BUTTON".. (R1zT-36)elseif
R1zT<=60 then J2Df="MULTIACTIONBAR2BUTTON".. (R1zT-48)else J2Df=
"MULTIACTIONBAR1BUTTON".. (R1zT-60)end;local YyS=J2Df and GetBindingKey(J2Df)
if
YyS and strlen(YyS)>4 then YyS=strupper(YyS)YyS=gsub(YyS,"%s+","")
YyS=gsub(YyS,"ALT%-","A|")YyS=gsub(YyS,"CTRL%-","C|")YyS=gsub(YyS,"SHIFT%-","S|")
YyS=gsub(YyS,"NUMPAD","N")YyS=gsub(YyS,"PLUS","+")YyS=gsub(YyS,"MINUS","-")
YyS=gsub(YyS,"MULTIPLY","*")YyS=gsub(YyS,"DIVIDE","/")end
if YyS~=nil then else
if Bartender4 then
J2Df="CLICK BT4Button"..R1zT..":LeftButton"YyS=J2Df and GetBindingKey(J2Df)
if
YyS and strlen(YyS)>4 then YyS=strupper(YyS)YyS=gsub(YyS,"%s+","")
YyS=gsub(YyS,"ALT%-","A|")YyS=gsub(YyS,"CTRL%-","C|")YyS=gsub(YyS,"SHIFT%-","S|")
YyS=gsub(YyS,"NUMPAD","N")YyS=gsub(YyS,"PLUS","+")YyS=gsub(YyS,"MINUS","-")
YyS=gsub(YyS,"MULTIPLY","*")YyS=gsub(YyS,"DIVIDE","/")end end end;return YyS end
function KeyModifierColor(o)local MY16y=strfind(o,"|")
if(MY16y~=nil)then
local ZBUghmX=strsub(o,1,MY16y-1)if(ZBUghmX=="S")then return 0.01 end
if(ZBUghmX=="C")then return 0.02 end;if(ZBUghmX=="A")then return 0.03 end end;return 1 end
function KeyBindColor(ncK)local Deq=strfind(ncK,"|")
if(Deq~=nil)then ncK=strsub(ncK,Deq+1)end
if ncK=="\\"then return 0.01 elseif ncK=="["then return 0.02 elseif ncK=="]"then return 0.03 elseif ncK==";"then return 0.04 elseif ncK=="'"then return 0.05 elseif ncK==
","then return 0.06 elseif ncK=="."then return 0.07 elseif ncK=="/"then return 0.08 elseif ncK=="`"then return 0.09 elseif ncK=="-"then return 0.10 elseif
ncK=="="then return 0.11 elseif ncK=="F1"then return 0.12 elseif ncK=="F2"then return 0.13 elseif ncK=="F3"then return 0.14 elseif ncK=="F4"then return 0.15 elseif
ncK=="F5"then return 0.16 elseif ncK=="F6"then return 0.17 elseif ncK=="F7"then return 0.18 elseif ncK=="F8"then return 0.19 elseif ncK=="F9"then return 0.20 elseif
ncK=="F10"then return 0.21 elseif ncK=="F11"then return 0.22 elseif ncK=="F12"then return 0.23 elseif ncK=="1"then return 0.24 elseif ncK=="2"then return 0.25 elseif
ncK=="3"then return 0.26 elseif ncK=="4"then return 0.27 elseif ncK=="5"then return 0.28 elseif ncK=="6"then return 0.29 elseif ncK=="7"then return 0.30 elseif ncK=="8"then
return 0.31 elseif ncK=="9"then return 0.32 elseif ncK=="0"then return 0.33 elseif ncK=="Q"then return 0.34 elseif ncK=="W"then return 0.35 elseif ncK=="E"then return 0.36 elseif ncK==
"R"then return 0.37 elseif ncK=="T"then return 0.38 elseif ncK=="Y"then return 0.39 elseif ncK=="U"then return 0.40 elseif ncK=="I"then return 0.41 elseif
ncK=="O"then return 0.42 elseif ncK=="P"then return 0.43 elseif ncK=="A"then return 0.44 elseif ncK=="S"then return 0.45 elseif ncK=="D"then return 0.46 elseif ncK=="F"then
return 0.47 elseif ncK=="G"then return 0.48 elseif ncK=="H"then return 0.49 elseif ncK=="J"then return 0.50 elseif ncK=="K"then return 0.51 elseif ncK=="L"then return 0.52 elseif ncK==
"Z"then return 0.53 elseif ncK=="X"then return 0.54 elseif ncK=="C"then return 0.55 elseif ncK=="V"then return 0.56 elseif ncK=="B"then return 0.57 elseif
ncK=="N"then return 0.58 elseif ncK=="M"then return 0.59 elseif ncK=="N1"then return 0.60 elseif ncK=="N2"then return 0.61 elseif ncK=="N3"then return 0.62 elseif
ncK=="N4"then return 0.63 elseif ncK=="N5"then return 0.64 elseif ncK=="N6"then return 0.65 elseif ncK=="N7"then return 0.66 elseif ncK=="N8"then return 0.67 elseif
ncK=="N9"then return 0.68 elseif ncK=="N0"then return 0.69 end;return 1 end
function fixSlots(GH3wE)if(GH3wE<10)then return'00'..GH3wE end;if(GH3wE>=10)then return
'0'..GH3wE end;return''..GH3wE end;printKeybinds=0
function RefreshKeyBinds()
if(printKeybinds==1)then
ChatFrame1:Clear()if Bartender4 then print('Bartender4 detected')end end
for xZFv,bc0w4j in pairs(SpellCooldowns)do local OGMxal0=GetSpellInfo(bc0w4j)bindFound=false
for QlewVjkq=1,120 do
local Q,yI,EDE3=GetActionInfo(QlewVjkq)
if Q=="spell"then local FpWG11U=GetKeyBinding(QlewVjkq)
if FpWG11U~=nil then
if
(bc0w4j==yI)then
oJ1ec[bc0w4j].t:SetColorTexture(KeyBindColor(FpWG11U),KeyModifierColor(FpWG11U),0,_gGmBBE)
if(printKeybinds==1)then
print('Slot: '..
fixSlots(QlewVjkq)..' '..
GetSpellLink(bc0w4j)..','..
KeyBindColor(FpWG11U)..
','..KeyModifierColor(FpWG11U)..','..FpWG11U)end;bindFound=true;break end end end
if Q=="macro"then actionText=GetActionText(QlewVjkq)
name,rank,id=GetMacroSpell(actionText)local kRY46C=GetKeyBinding(QlewVjkq)
if kRY46C~=nil then
if(bc0w4j==id)then
oJ1ec[bc0w4j].t:SetColorTexture(KeyBindColor(kRY46C),KeyModifierColor(kRY46C),0,_gGmBBE)
if(printKeybinds==1)then
print('Slot: '..
fixSlots(QlewVjkq)..' '..
GetSpellLink(bc0w4j)..','..

KeyBindColor(kRY46C)..','..KeyModifierColor(kRY46C)..','..kRY46C)end;bindFound=true;break end end end end
if bindFound==false and(printKeybinds==1)then if
(GetSpellLink(bc0w4j))~=nil then
print(GetSpellLink(bc0w4j)..',not bound')else
print('Spell Id: '..bc0w4j..',NOT FOUND')end end end;printKeybinds=0 end
local function XuqjvYPF()i=0
for rVj9z4,mWkmCx in pairs(SpellCooldowns)do
oJ1ec[mWkmCx]=CreateFrame("frame","",parent)oJ1ec[mWkmCx]:SetSize(1,1)oJ1ec[mWkmCx]:SetPoint("TOPLEFT",i,
-14)
oJ1ec[mWkmCx].t=oJ1ec[mWkmCx]:CreateTexture()
oJ1ec[mWkmCx].t:SetColorTexture(0,0,0,_gGmBBE)
oJ1ec[mWkmCx].t:SetAllPoints(oJ1ec[mWkmCx])oJ1ec[mWkmCx]:Show()i=i+1 end
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("SPELL_PUSHED_TO_ACTIONBAR")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("SPELLS_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("PLAYER_ENTERING_WORLD")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("UNIT_MODEL_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:SetScript("OnEvent",RefreshKeyBinds)local MvOaiq=0
for MvOaiq=1,2 do EEpoeR[MvOaiq]=CreateFrame("FRAME","",parent)
EEpoeR[MvOaiq]:SetSize(1,1)
EEpoeR[MvOaiq]:SetPoint("TOPLEFT",(MvOaiq+3),-6)
EEpoeR[MvOaiq].t=EEpoeR[MvOaiq]:CreateTexture()
EEpoeR[MvOaiq].t:SetColorTexture(0,0,0,_gGmBBE)
EEpoeR[MvOaiq].t:SetAllPoints(EEpoeR[MvOaiq])EEpoeR[MvOaiq]:Show()end
EEpoeR[table.maxn(EEpoeR)]:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
EEpoeR[table.maxn(EEpoeR)]:SetScript("OnEvent",pG4C8fDK)
for MvOaiq=1,2 do Oynw[MvOaiq]=CreateFrame("FRAME","",parent)
Oynw[MvOaiq]:SetSize(1,1)
Oynw[MvOaiq]:SetPoint("TOPLEFT",(MvOaiq+5),-6)
Oynw[MvOaiq].t=Oynw[MvOaiq]:CreateTexture()
Oynw[MvOaiq].t:SetColorTexture(0,0,0,_gGmBBE)
Oynw[MvOaiq].t:SetAllPoints(Oynw[MvOaiq])Oynw[MvOaiq]:Show()end
Oynw[table.maxn(Oynw)]:SetScript("OnUpdate",LLFUU)
for MvOaiq=1,2 do QBO[MvOaiq]=CreateFrame("FRAME","",parent)
QBO[MvOaiq]:SetSize(1,1)
QBO[MvOaiq]:SetPoint("TOPLEFT",(MvOaiq+7),-6)QBO[MvOaiq].t=QBO[MvOaiq]:CreateTexture()
QBO[MvOaiq].t:SetColorTexture(0,0,0,_gGmBBE)
QBO[MvOaiq].t:SetAllPoints(QBO[MvOaiq])QBO[MvOaiq]:Show()end
QBO[table.maxn(QBO)]:SetScript("OnUpdate",kdmQtj6)
for MvOaiq=1,2 do s4ggux[MvOaiq]=CreateFrame("FRAME","",parent)
s4ggux[MvOaiq]:SetSize(1,1)
s4ggux[MvOaiq]:SetPoint("TOPLEFT",(MvOaiq+9),-6)
s4ggux[MvOaiq].t=s4ggux[MvOaiq]:CreateTexture()
s4ggux[MvOaiq].t:SetColorTexture(0,0,0,_gGmBBE)
s4ggux[MvOaiq].t:SetAllPoints(s4ggux[MvOaiq])s4ggux[MvOaiq]:Show()end
s4ggux[table.maxn(s4ggux)]:SetScript("OnUpdate",Hc35_)
for MvOaiq=1,2 do hrVI4meU[MvOaiq]=CreateFrame("FRAME","",parent)
hrVI4meU[MvOaiq]:SetSize(1,1)
hrVI4meU[MvOaiq]:SetPoint("TOPLEFT",(MvOaiq+11),-6)
hrVI4meU[MvOaiq].t=hrVI4meU[MvOaiq]:CreateTexture()
hrVI4meU[MvOaiq].t:SetColorTexture(0,0,0,_gGmBBE)
hrVI4meU[MvOaiq].t:SetAllPoints(hrVI4meU[MvOaiq])hrVI4meU[MvOaiq]:Show()end
hrVI4meU[table.maxn(hrVI4meU)]:SetScript("OnUpdate",ubP)MvOaiq=0
for qQpo,qXKzBXo0 in pairs(PlayerBuffs)do
inx0[qXKzBXo0]=CreateFrame("frame","",parent)inx0[qXKzBXo0]:SetSize(1,1)inx0[qXKzBXo0]:SetPoint("TOPLEFT",MvOaiq,
-7)
inx0[qXKzBXo0].t=inx0[qXKzBXo0]:CreateTexture()
inx0[qXKzBXo0].t:SetColorTexture(1,1,1,_gGmBBE)
inx0[qXKzBXo0].t:SetAllPoints(inx0[qXKzBXo0])inx0[qXKzBXo0]:Show()MvOaiq=MvOaiq+1 end
inx0[table.maxn(inx0)]:SetScript("OnUpdate",W)MvOaiq=0
for cJ,HI4G3oH in pairs(InventoryItems)do
LS4h[HI4G3oH]=CreateFrame("frame","",parent)LS4h[HI4G3oH]:SetSize(1,1)LS4h[HI4G3oH]:SetPoint("TOPLEFT",MvOaiq,
-8)
LS4h[HI4G3oH].t=LS4h[HI4G3oH]:CreateTexture()
LS4h[HI4G3oH].t:SetColorTexture(1,1,1,_gGmBBE)
LS4h[HI4G3oH].t:SetAllPoints(LS4h[HI4G3oH])LS4h[HI4G3oH]:Show()MvOaiq=MvOaiq+1 end;if(table.getn(InventoryItems)~=0)then
LS4h[table.maxn(LS4h)]:SetScript("OnUpdate",SnbfLb6)end;MvOaiq=0
for ncWw,kdS in pairs(PlayerDebuffs)do
A5k5yt[kdS]=CreateFrame("frame","",parent)A5k5yt[kdS]:SetSize(1,1)
A5k5yt[kdS]:SetPoint("TOPLEFT",MvOaiq,-10)A5k5yt[kdS].t=A5k5yt[kdS]:CreateTexture()
A5k5yt[kdS].t:SetColorTexture(1,1,1,_gGmBBE)
A5k5yt[kdS].t:SetAllPoints(A5k5yt[kdS])A5k5yt[kdS]:Show()
A5k5yt[kdS]:SetScript("OnUpdate",lAG)MvOaiq=MvOaiq+1 end
A5k5yt[table.maxn(A5k5yt)]:SetScript("OnUpdate",lAG)MvOaiq=0
for OS60,dl in pairs(SpellCooldowns)do
rIX4[dl]=CreateFrame("frame","",parent)rIX4[dl]:SetSize(1,1)
rIX4[dl]:SetPoint("TOPLEFT",MvOaiq,-11)rIX4[dl].t=rIX4[dl]:CreateTexture()
rIX4[dl].t:SetColorTexture(1,1,1,_gGmBBE)rIX4[dl].t:SetAllPoints(rIX4[dl])
rIX4[dl]:Show()MvOaiq=MvOaiq+1 end;if(table.getn(SpellCooldowns)~=0)then
rIX4[table.maxn(rIX4)]:SetScript("OnUpdate",AvEtR8Y)end
for MvOaiq=1,4 do
AI14eFhp[MvOaiq]=CreateFrame("frame","",parent)AI14eFhp[MvOaiq]:SetSize(1,1)AI14eFhp[MvOaiq]:SetPoint("TOPLEFT",(MvOaiq),
-12)
AI14eFhp[MvOaiq].t=AI14eFhp[MvOaiq]:CreateTexture()
AI14eFhp[MvOaiq].t:SetColorTexture(1,1,1,_gGmBBE)
AI14eFhp[MvOaiq].t:SetAllPoints(AI14eFhp[MvOaiq])AI14eFhp[MvOaiq]:Show()end
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_ENTERING_WORLD")
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_REGEN_DISABLED")
AI14eFhp[table.maxn(AI14eFhp)]:SetScript("OnEvent",TKu)VQ=CreateFrame("frame","",parent)VQ:SetSize(1,1)VQ:SetPoint("TOPLEFT",0,
-22)VQ.t=VQ:CreateTexture()
VQ.t:SetColorTexture(1,1,1,_gGmBBE)VQ.t:SetAllPoints(VQ)VQ:Show()
VQ:SetScript("OnUpdate",rHLz2GD)local DUic_1K=IsInRaid()and"raid"or"party"MvOaiq=0
for b2UK=1,30 do
iW2O[b2UK]=CreateFrame("frame","",parent)iW2O[b2UK]:SetSize(1,1)
iW2O[b2UK]:SetPoint("TOPLEFT",MvOaiq,-13)iW2O[b2UK].t=iW2O[b2UK]:CreateTexture()
iW2O[b2UK].t:SetColorTexture(0,0,0,_gGmBBE)iW2O[b2UK].t:SetAllPoints(iW2O[b2UK])
iW2O[b2UK]:Show()MvOaiq=MvOaiq+1 end;DfbW=CreateFrame("frame","",parent)DfbW:SetSize(1,1)DfbW:SetPoint("TOPLEFT",0,
-19)DfbW.t=DfbW:CreateTexture()
DfbW.t:SetColorTexture(0,0,0,_gGmBBE)DfbW.t:SetAllPoints(DfbW)DfbW:Show()MvOaiq=0
for FC0yhp,lL30T in
pairs(PlayerDebuffs)do sh[lL30T]=CreateFrame("frame","",parent)
sh[lL30T]:SetSize(1,1)sh[lL30T]:SetPoint("TOPLEFT",MvOaiq,-20)
sh[lL30T].t=sh[lL30T]:CreateTexture()sh[lL30T].t:SetColorTexture(0,0,0,_gGmBBE)
sh[lL30T].t:SetAllPoints(sh[lL30T])sh[lL30T]:Show()MvOaiq=MvOaiq+1 end
for MvOaiq=1,2 do rrFLbCtj[MvOaiq]=CreateFrame("FRAME","",parent)
rrFLbCtj[MvOaiq]:SetSize(1,1)
rrFLbCtj[MvOaiq]:SetPoint("TOPLEFT",MvOaiq,-19)
rrFLbCtj[MvOaiq].t=rrFLbCtj[MvOaiq]:CreateTexture()
rrFLbCtj[MvOaiq].t:SetColorTexture(0,0,0,_gGmBBE)
rrFLbCtj[MvOaiq].t:SetAllPoints(rrFLbCtj[MvOaiq])rrFLbCtj[MvOaiq]:Show()end end;local function Trh()cvRh=0 end;local function K()W9yaJm=0 end
local function uK(zt,Ofgm3g,...)local z6WE21dc=...if Ofgm3g=="ADDON_LOADED"then
if(
z6WE21dc=="[Frozen]")then NwBqNl3C()XuqjvYPF()end end;if Ofgm3g=="NAME_PLATE_UNIT_ADDED"then
BlW0RhJA(select(1,...))rHLz2GD()end
if
Ofgm3g=="PLAYER_ENTERING_WORLD"then cvRh=0;W9yaJm=0;Ef=GetSpecialization()KfM=Ef and
select(1,GetSpecializationInfo(Ef))or 0
if
GetCVar("nameplateShowEnemies")=="0"then SetCVar("nameplateShowEnemies","1")end;rb21L2=1 end;if Ofgm3g=="PLAYER_REGEN_DISABLED"then rHLz2GD()end;if Ofgm3g==
"PLAYER_REGEN_ENABLED"then rHLz2GD()end
if
Ofgm3g=="COMBAT_LOG_EVENT_UNFILTERED"then local rJg9H,sNyznm3W,UU,YBciOAz2,wJvNH,dOvZoN,IP01vP,DIoX3,sjXYan,KxB8fW,M=...
if
YBciOAz2 ==UnitGUID('player')then
if sNyznm3W=="SPELL_SUMMON"then
local JmyAd,JmyAd,JmyAd,JmyAd,JmyAd,JmyAd,JmyAd,L,JmyAd=DIoX3:find('(%S+)-(%d+)-(%d+)-(%d+)-(%d+)-(%d+)-(%S+)')L=tonumber(L)if(L==55659)then cvRh=cvRh+1
C_Timer.After(12,Trh)end;if(L==98035)then W9yaJm=W9yaJm+1
C_Timer.After(12,K)end;return end end end end;parent:SetScript("OnEvent",uK)
parent:SetScript("OnUpdate",update)