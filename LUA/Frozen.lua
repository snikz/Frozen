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
(KfM==581 or KfM==70)then local Kqne5Stra,FKLmmhnQ=LMMNWLk:GetRange(JC)
if FKLmmhnQ==nil then FKLmmhnQ=100 end
if UnitCanAttack("player",JC)and FKLmmhnQ<=8 and
UnitIsDead(JC)==false then o_v255=o_v255+1 end else if UnitCanAttack("player",JC)and
LibStub("SpellRange-1.0").IsSpellInRange(P5G,JC)==1 and
UnitIsDead(JC)==false then
o_v255=o_v255+1 end end end end;o_v255=o_v255/100
VQ.t:SetColorTexture(1,o_v255,rb21L2,_gGmBBE)end
local function BlW0RhJA(F82)local wJ6tY_=false;for TNg,wO9T in pairs(wUVm)do wUVm[TNg]=nil end
for QMcSUqdi=1,30 do
if UnitGUID("nameplate"..
QMcSUqdi)~=nil and not
UnitIsPlayer("nameplate"..QMcSUqdi)then for sKy2P9i,S in pairs(wUVm)do
if S==UnitGUID(
"nameplate"..QMcSUqdi)then wJ6tY_=true end end
if wJ6tY_==false then wUVm["nameplate"..QMcSUqdi]=UnitGUID(
"nameplate"..QMcSUqdi)wJ6tY_=false end end;wJ6tY_=false end end
local function Uy(AD,AkxLdb66,...)if AkxLdb66 =="PLAYER_REGEN_ENABLED"then PlayerIsInCombat=false
unitCombatFrame.t:SetColorTexture(1,1,1,_gGmBBE)end;if
AkxLdb66 =="PLAYER_REGEN_DISABLED"then PlayerIsInCombat=true
unitCombatFrame.t:SetColorTexture(1,0,0,_gGmBBE)end end
local function n(aUR)under=math.floor(aUR)upper=math.floor(aUR)+1;underV=-
(under-aUR)upperV=upper-aUR
if(upperV>underV)then return under else return upper end end
local function TKu()Ef=GetSpecialization()KfM=Ef and
select(1,GetSpecializationInfo(Ef))or 0
local c4={}AllSeven=false
for ZNXs3Bwd=1,GetMaxTalentTier()do talenetSelected=false
for Ginn=1,3 do
local h_pK=select(4,GetTalentInfo(ZNXs3Bwd,Ginn,1))
if(h_pK==true)then c4[ZNXs3Bwd]=Ginn/100;talenetSelected=true end
if talenetSelected==false and Ginn==3 then c4[ZNXs3Bwd]=0 end end;if ZNXs3Bwd==7 then AllSeven=true end end
if not AllSeven then for L=GetMaxTalentTier(),7 do c4[L]=0 end end
AI14eFhp[1].t:SetColorTexture(c4[1],c4[2],c4[3],_gGmBBE)
AI14eFhp[2].t:SetColorTexture(c4[4],c4[5],c4[6],_gGmBBE)
AI14eFhp[3].t:SetColorTexture(c4[7],oTYNsnP[select(2,UnitRace("player"))],0,_gGmBBE)
AI14eFhp[4].t:SetColorTexture(I[KfM],0,0,_gGmBBE)end
local function M6kL()if not UnitExists("target")then return end
for vBKFXR3,FP3j in pairs(PlayerBuffs)do
local fe=GetSpellInfo(FP3j)
local ggnA,vBKFXR3,vBKFXR3,vBKFXR3,vBKFXR3,vBKFXR3,KaD2ExEO,vBKFXR3,vBKFXR3,vBKFXR3,TpiFT=UnitBuff("target",fe,nil,"PLAYER")
if(ggnA==fe and KaD2ExEO~=0)then local JCH=KaD2ExEO-GetTime()-
select(4,GetNetStats())/1000
JCH=xb6(JCH,1)local sJ05I,HrLCim=strsplit(".",JCH)local w=tonumber(sJ05I)/100;local sUu7z=
tonumber(HrLCim)/100;if(w>1)then w=1 end
a31jEAS[FP3j].t:SetColorTexture(1,w,sUu7z,_gGmBBE)a31jEAS[FP3j].t:SetAllPoints(false)else
a31jEAS[FP3j].t:SetColorTexture(0,1,1,_gGmBBE)a31jEAS[FP3j].t:SetAllPoints(false)end end end
local function M7o_()local M5oB=0;if IWQcC==2 then
M5oB=UnitPower("player",SPELL_POWER_HOLY_POWER)end;if IWQcC==9 then
M5oB=UnitPower("player",SPELL_POWER_SOUL_SHARDS)end;if IWQcC==8 then
M5oB=UnitPower("player",SPELL_POWER_ARCANE_CHARGES)end;if IWQcC==4 then
M5oB=UnitPower("player",SPELL_POWER_COMBO_POINTS)end;if IWQcC==11 then
M5oB=UnitPower("player",SPELL_POWER_COMBO_POINTS)end
if IWQcC==6 then
local xIyIKo=UnitPower("player",SPELL_POWER_RUNES)local f2x=6;local Nwl=1
for Nwl=1,xIyIKo do local Xpt_SQ=select(3,GetRuneCooldown(Nwl))if not
Xpt_SQ then f2x=f2x-1 end end;M5oB=f2x end
if IWQcC==10 then M5oB=UnitPower("player",SPELL_POWER_CHI)end;if M5oB~=OyHc5FEv then
unitPowerFrame.t:SetColorTexture(0,M5oB/100,0,_gGmBBE)unitPowerFrame.t:SetAllPoints(false)
OyHc5FEv=M5oB end end;local dk2X7J7=nil
local function jv(Y,SMa)local Bo=UnitExists("pet")
if
(Bo==false or UnitIsDead("pet"))then if(Bo~=dk2X7J7)then
gFPRdEC.t:SetColorTexture(1,1,1,_gGmBBE)dk2X7J7=Bo end else if Bo~=dk2X7J7 and not
UnitIsDead("player")then
gFPRdEC.t:SetColorTexture(1,0,0,_gGmBBE)dk2X7J7=Bo end end end
local function MW()if KfM==270 or KfM==65 or KfM==257 or KfM==256 or KfM==
264 or KfM==105 then return
true else return false end end
local function E2OQ(zF6ZPjQ,nNQG3)
for yW,efGM8UMy in pairs(SpellCooldowns)do local KhH,H4tXd,yW=GetSpellCooldown(efGM8UMy)
local Nq6If=(
KhH+H4tXd-GetTime()-select(4,GetNetStats())/1000)if Nq6If<0 then Nq6If=0 end;local II=GetSpellInfo(efGM8UMy)
local Y_tefq,i=IsUsableSpell(II)
if Nq6If~=0 then Nq6If=xb6(Nq6If,1)local a3u,nzhB=strsplit(".",Nq6If)local sTxVGmb=
tonumber(a3u)/100;local GSIcq=tonumber(nzhB)/100
usLpLoaH[efGM8UMy].t:SetColorTexture(0,sTxVGmb,GSIcq,_gGmBBE)
usLpLoaH[efGM8UMy].t:SetAllPoints(false)else if(i and MW())then
usLpLoaH[efGM8UMy].t:SetColorTexture(0,1,1,_gGmBBE)else
usLpLoaH[efGM8UMy].t:SetColorTexture(1,1,1,_gGmBBE)end
usLpLoaH[efGM8UMy].t:SetAllPoints(false)end end end
local function SnbfLb6(Go,DGf)
for kgRX7X,JB in pairs(InventoryItems)do local GGJhclKa,KWahIz,kgRX7X=GetItemCooldown(JB)local X2kyW=
GGJhclKa+KWahIz-GetTime()local pVlvW=0;if X2kyW<0 then X2kyW=0 end
local QcKn_=0;if IsEquippedItem(JB)then QcKn_=1 else QcKn_=0 end
local jiM=GetItemCount(JB)/100;if jiM>=100 then pVlvW=1 end;if X2kyW==0 or pVlvW==0 then
LS4h[JB].t:SetColorTexture(0,QcKn_,pVlvW,_gGmBBE)else
LS4h[JB].t:SetColorTexture(1,QcKn_,pVlvW,_gGmBBE)end end end
local function ay(YUdA,lx3cpJ)
for Yx9,Mn in pairs(SpellCooldowns)do charges,Yx9,Yx9,Yx9=GetSpellCharges(Mn)if(Mn==205406 or
Mn==115072 or Mn==101546)then
charges=GetSpellCount(Mn)end
if(TI5[Mn]~=charges)then e7dv[Mn].t:SetColorTexture(0,
charges/100,0,_gGmBBE)
e7dv[Mn].t:SetAllPoints(false)TI5[Mn]=charges end end end
local function W(ut0,ZFhlP6eg)
for ExUgDG,jc4o42jz in pairs(PlayerBuffs)do local jc=GetSpellInfo(jc4o42jz)if(jc==nil)then
print(
'Unable to find aura (Buff) with Id: '..jc4o42jz)return end
local Ojz_,ExUgDG,ExUgDG,x,ExUgDG,Xtecl,KVcYU,ExUgDG,ExUgDG,ExUgDG,_=UnitBuff("player",jc)
if(jc4o42jz==120694)and UnitBuff("player",jc)then local C=0
for x6Ni=1,40 do
local Ojz_,ExUgDG,ExUgDG,ExUgDG,ExUgDG,ExUgDG,ExUgDG,ExUgDG,ExUgDG,ExUgDG,_,ExUgDG,ExUgDG,ExUgDG,ExUgDG,ExUgDG=UnitBuff("player",x6Ni)if _==120694 then C=C+1 end end;x=C end
if(Ojz_==jc)then local CJeG=GetTime()remainingTime=xb6(KVcYU-CJeG,1)
local F43eMG,mCzjh4=strsplit(".",remainingTime)local lU=tonumber(F43eMG)/100
local epQue9=tonumber(mCzjh4)/100
inx0[jc4o42jz].t:SetColorTexture(x/100,lU,epQue9,_gGmBBE)inx0[jc4o42jz].t:SetAllPoints(false)else
inx0[jc4o42jz].t:SetColorTexture(1,1,1,_gGmBBE)inx0[jc4o42jz].t:SetAllPoints(false)end end end
local function WzM(cHUJrj,EI0x)
for E,lacOdjf9 in pairs(PlayerDebuffs)do local R2h4lP4l=GetSpellInfo(lacOdjf9)
if R2h4lP4l==nil then
if(
FFG[lacOdjf9]~="DebuffOff")then
xEq6TAF[lacOdjf9].t:SetColorTexture(1,1,1,_gGmBBE)
xEq6TAF[lacOdjf9].t:SetAllPoints(false)FFG[lacOdjf9]="DebuffOff"end;return end
local Fh,E,E,a2e9fa,E,Rc9_ZID,H1HF2wD6,E,E,E,hBph,E,E,E,E,E=UnitDebuff("target",R2h4lP4l,nil,"PLAYER|HARMFUL")
if lacOdjf9 ==233490 and(Fh==R2h4lP4l)then local bxNo9h=0
for x6Ni=1,40 do
name2,E,E,count2,E,Rc9_ZID,expirationTime2,E,E,E,spellId2,E,E,E,E,E=UnitDebuff("target",x6Ni,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then bxNo9h=bxNo9h+1 end end;a2e9fa=bxNo9h end
if(Fh==R2h4lP4l)then local Khst=GetTime()
remainingTime=xb6(H1HF2wD6-Khst,1)
if
(FFG[lacOdjf9]~="DebuffOn"..a2e9fa..remainingTime)then local pUT,ISg1=strsplit(".",remainingTime)
local Gh5UJya=tonumber(pUT)/100;local k=tonumber(ISg1)/100;if hBph==34914 then end
xEq6TAF[lacOdjf9].t:SetColorTexture(
a2e9fa/100,Gh5UJya,k,_gGmBBE)
FFG[lacOdjf9]="DebuffOn"..a2e9fa..remainingTime end else
if(FFG[lacOdjf9]~="DebuffOff")then
xEq6TAF[lacOdjf9].t:SetColorTexture(1,1,1,_gGmBBE)FFG[lacOdjf9]="DebuffOff"end end end end;local PSx={}
local function IwnA(Z8Ue,TXbmx)
for r,Pqgz415t in pairs(SpellCooldowns)do local McNxKV=0
local WcwGYJh,r,r,r,r,r=GetSpellInfo(Pqgz415t)if(WcwGYJh==nil)then McNxKV=0 else
McNxKV=LibStub("SpellRange-1.0").IsSpellInRange(Pqgz415t,"target")end
if
PSx[Pqgz415t]~=McNxKV then if(McNxKV==1)then
UIjls[Pqgz415t].t:SetColorTexture(1,0,0,_gGmBBE)else
UIjls[Pqgz415t].t:SetColorTexture(1,1,1,_gGmBBE)end
UIjls[Pqgz415t].t:SetAllPoints(false)PSx[Pqgz415t]=McNxKV end end end
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
local function MGt(gJt,hCs8M)local GkjCn_mq=UnitLevel("player")local T9sySp=0;local DL0mMXM=0;local o4Kvi75g=0
local ELb="0.0"..GkjCn_mq;if(GkjCn_mq>=10)then ELb="0."..GkjCn_mq end
DL0mMXM=tonumber(ELb)
if(GkjCn_mq>100)then DL0mMXM=0;GkjCn_mq=GkjCn_mq-100
local A4ZRczp="0.0"..GkjCn_mq;if(GkjCn_mq>=10)then A4ZRczp="0."..GkjCn_mq end
o4Kvi75g=tonumber(A4ZRczp)end;local FV5=UnitHealth("player")local sX=UnitHealthMax("player")local DH6mUlGB=ceil((
FV5/sX)*100)if UnitIsDead("player")or
UnitIsGhost("player")then DH6mUlGB=0 end
if
(DH6mUlGB~=G9zkKODk)then local rUT="0.0"..DH6mUlGB
if(DH6mUlGB>=10)then rUT="0."..DH6mUlGB end;T9sySp=tonumber(rUT)
if(DH6mUlGB==100)then
if(GkjCn_mq==100)then
nN.t:SetColorTexture(1,1,0,_gGmBBE)else nN.t:SetColorTexture(1,DL0mMXM,o4Kvi75g,_gGmBBE)end else
nN.t:SetColorTexture(T9sySp,DL0mMXM,o4Kvi75g,_gGmBBE)end;G9zkKODk=DH6mUlGB end end;local ld9GuG4t=0
local function KpCCA(g,JPi)local Kkl6fa=UnitHealth("pet")local t=UnitHealthMax("pet")if
t==nil then t=1 end;if t==0 then t=1 end
local H=ceil((Kkl6fa/t)*100)
if(ld9GuG4t~=H)then local glZrOuSo=0;local Zdzaj="0.0"..H
if(H>=10)then Zdzaj="0."..H end;glZrOuSo=tonumber(Zdzaj)if(H==100)then
petHealthFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
petHealthFrame.t:SetColorTexture(glZrOuSo,0,0,_gGmBBE)end;ld9GuG4t=H end end;local H6=0
local function hgsKvTz(UxRGyO9e,fvj_L)local _CPU89l=UnitGUID("target")local U=0;local Kwxn=100;local yp5DGSwX=0
if
(_CPU89l~=nil)then U=UnitHealth("target")Kwxn=UnitHealthMax("target")yp5DGSwX=ceil((U/
Kwxn)*100)end
if(yp5DGSwX~=H6)then local Sb1Mw7R=0;local fuF="0.0"..yp5DGSwX;if(yp5DGSwX>=10)then fuF="0."..
yp5DGSwX end;Sb1Mw7R=tonumber(fuF)if
(yp5DGSwX==100)then
targetHealthFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
targetHealthFrame.t:SetColorTexture(Sb1Mw7R,0,0,_gGmBBE)end
H6=yp5DGSwX end end
local function zEt(pA2,M5lAedm)local _uYRl2kj=UnitPower("player")local tbN=UnitPowerMax("player")
if(
_uYRl2kj~=_k)then _k=_uYRl2kj
if
(

(IWQcC==7 and KfM==264)or(IWQcC==2)or(IWQcC==5)or(IWQcC==8)or(IWQcC==9)or
(IWQcC==10 and KfM==270)or
(IWQcC==11 and KfM==102)or(IWQcC==11 and
KfM==105))then _uYRl2kj=ceil((_uYRl2kj/tbN)*100)end;local x=0;local m=0;local VVQ="0.0".._uYRl2kj;if(_uYRl2kj>=10)then
VVQ="0.".._uYRl2kj end;x=tonumber(VVQ)
if(_uYRl2kj>100)then x=0
_uYRl2kj=_uYRl2kj-100;local Jb="0.0".._uYRl2kj
if(_uYRl2kj>=10)then Jb="0.".._uYRl2kj end;m=tonumber(Jb)end
if(_uYRl2kj==100)then
powerFrame.t:SetColorTexture(1,0,0,_gGmBBE)else powerFrame.t:SetColorTexture(x,m,0,_gGmBBE)end end end;local Wjojpvg=0
local function l2PqbWw()local qcpea=math.floor(GetHaste())local tjDBv=0;if lasthaste==qcpea then
return end;lastehaste=qcpea;local vmn7v=0;if qcpea==math.abs(qcpea)then
vmn7v=1 else vmn7v=0 end
if(qcpea>=100)then
tjDBv=math.floor(qcpea/100)qcpea=qcpea- (tjDBv*100)end
local Au1mzs=math.abs(tonumber(strsub(tostring(qcpea),1,2))/100)
qccJ5b.t:SetColorTexture(vmn7v,tjDBv,Au1mzs,_gGmBBE)end;local EJTH9=true
local function qTB82(u39i,Fdg7p)isFriend=UnitIsFriend("player","target")
if
(isFriend~=EJTH9)then
if(isFriend==true)then
g3Qeqnr.t:SetColorTexture(0,1,0,_gGmBBE)else g3Qeqnr.t:SetColorTexture(0,0,1,_gGmBBE)end;EJTH9=isFriend end end;local KL=""
local function EATFLbgY()local GD3AP=UnitGUID("target")
local jph00k=LibStub("LibBossIDs-1.0")local wE_4o=UnitIsDead("target")local F=UnitLevel("player")
if
(GD3AP~=KL)then
if GD3AP==nil then qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)else
if GD3AP~=
nil then
local bUO1NvT,KRQG,KRQG,KRQG,KRQG,tVwI_N=strsplit(" - ",UnitGUID("target"))
if jph00k.BossIDs[tonumber(tVwI_N)]then
qHpY64.t:SetColorTexture(0,0,1,_gGmBBE)elseif bUO1NvT=="Player"then
qHpY64.t:SetColorTexture(1,0,0,_gGmBBE)elseif not jph00k.BossIDs[tonumber(tVwI_N)]then
if tVwI_N~=nil then
if
tonumber(tVwI_N)==114631 or tonumber(tVwI_N)==114822 or
tonumber(tVwI_N)==90463 or
tonumber(tVwI_N)==90418 or
tonumber(tVwI_N)==90431 then
qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)else qHpY64.t:SetColorTexture(1,0,0,_gGmBBE)end end elseif(GD3AP~=nil and wE_4o==true)then
qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)end end end;KL=GD3AP end end;local FF=0;local rh=""
local function YcCR(Jkp2lGXG,ifcyuS)spell,_,_,_,_,_,_,castID,_=UnitCastingInfo("player")
name,_,text,_,_,_,_,_=UnitChannelInfo("player")
if castID~=nil then if castID~=FF then
ARuba.t:SetColorTexture(1,0,0,_gGmBBE)FF=castID end else if castID~=FF then
ARuba.t:SetColorTexture(1,1,1,_gGmBBE)FF=castID end end
if name~=nil then if text~=rh then
ARuba.t:SetColorTexture(0,1,0,_gGmBBE)rh=text end else if text~=rh then
ARuba.t:SetColorTexture(1,1,1,_gGmBBE)rh=text end end end;local function G3p2Yn(V03W,R)return
math.abs(R-GetTime()*1000)/math.abs(R-V03W)end
local function _jkkD9(X6_,tN5u)
spell,_,_,_,startTime,endTime,_,_,notInterrupt=UnitCastingInfo("target")if(spell==nil)then
spell,_,_,_,startTime,endTime,_,notInterrupt=UnitChannelInfo("target")end
if spell~=nil then
if notInterrupt==false then
Wo53nZ.t:SetColorTexture(1,G3p2Yn(startTime,endTime),1,_gGmBBE)else
Wo53nZ.t:SetColorTexture(0,G3p2Yn(startTime,endTime),1,_gGmBBE)end else
if spell==nil then Wo53nZ.t:SetColorTexture(0,0,0,_gGmBBE)end end end
local function D()wilds=tonumber("0.0"..cvRh)
dreadstalkers=tonumber("0.0"..W9yaJm)J.t:SetColorTexture(wilds,0,dreadstalkers,_gGmBBE)end;local DMn=nil
local function GBzFRjVV(Yqc0GWr,UC7)local WbvvcjER=UnitIsVisible("target")
if WbvvcjER==nil then
if
(WbvvcjER~=DMn)then XRfQ.t:SetColorTexture(1,1,1,_gGmBBE)DMn=WbvvcjER end else if WbvvcjER~=DMn then XRfQ.t:SetColorTexture(1,0,0,_gGmBBE)
DMn=WbvvcjER end end end
local function pG4C8fDK(rOLxXC,w762p7sZ,...)if(w762p7sZ=="UNIT_SPELLCAST_SUCCEEDED")then
UpdateCastingFrame("player",EEpoeR,...)end end
local function LLFUU()UpdateCastingFrame("target",Oynw)end
local function kdmQtj6()UpdateCastingFrame("arena1",QBO)end
local function Hc35_()UpdateCastingFrame("arena2",s4ggux)end
local function ubP()UpdateCastingFrame("arena3",hrVI4meU)end
local function eN0UMW(_7jt,ORXyFQ)
for OL1oV,Q in pairs(PlayerBuffs)do local HQvT5=GetSpellInfo(Q)
if HQvT5 ==nil then if
(s4[Q]~="BuffOff")then
B7SHDx7h[Q].t:SetColorTexture(1,1,1,_gGmBBE)B7SHDx7h[Q].t:SetAllPoints(false)
s4[Q]="BuffOff"end;return end;local dN,OL1oV,OL1oV,B35igHj,OL1oV,OL1oV,o8pPC2,OL1oV,OL1oV,OL1oV,OL1oV=UnitBuff("pet",HQvT5)
if
(dN==HQvT5)then local f7nUIW=GetTime()remainingTime=xb6(o8pPC2-f7nUIW,1)
if
(s4[Q]~="BuffOn"..
B35igHj..remainingTime)then local bDgD,Kg8PhSq=strsplit(".",remainingTime)
local Tcv_=tonumber(bDgD)/100;local lygY=tonumber(Kg8PhSq)/100
B7SHDx7h[Q].t:SetColorTexture(
B35igHj/100,Tcv_,lygY,_gGmBBE)B7SHDx7h[Q].t:SetAllPoints(false)end else if(s4[Q]~="BuffOff")then
B7SHDx7h[Q].t:SetColorTexture(1,1,1,_gGmBBE)B7SHDx7h[Q].t:SetAllPoints(false)
s4[Q]="BuffOff"end end end end
local function lAG(HG,u)
for m9i,EqPMP in pairs(PlayerDebuffs)do local JR="UnitDebuff"local G1Cl6=GetSpellInfo(EqPMP)
if
G1Cl6 ==nil then if(Vd[EqPMP]~="DebuffOff")then
A5k5yt[EqPMP].t:SetColorTexture(1,1,1,_gGmBBE)A5k5yt[EqPMP].t:SetAllPoints(false)
Vd[EqPMP]="DebuffOff"end;return end
local h,m9i,m9i,fYUikw,m9i,m9i,W9qTCm,m9i,m9i,m9i,YlaSjEKp,m9i,m9i,m9i,m9i,m9i=UnitDebuff("player",G1Cl6,nil,"PLAYER|HARMFUL")
if(h==G1Cl6)then local u_ogp8=GetTime()
local Kob=math.floor(W9qTCm-u_ogp8+0.5)
if(Vd[EqPMP]~="DebuffOn"..fYUikw..Kob)then Vd[EqPMP]=
"DebuffOn"..fYUikw..Kob
Kob=string.format("%00.2f",tostring(Kob))
local a3=tonumber(strsub(tostring(Kob),1,2))/100
local MvWxr=tonumber(strsub(tostring(Kob),-2,-1))/100
A5k5yt[EqPMP].t:SetColorTexture(fYUikw/100,a3,MvWxr,_gGmBBE)A5k5yt[EqPMP].t:SetAllPoints(false)end else if(Vd[EqPMP]~="DebuffOff")then
A5k5yt[EqPMP].t:SetColorTexture(1,1,1,_gGmBBE)A5k5yt[EqPMP].t:SetAllPoints(false)
Vd[EqPMP]="DebuffOff"end end end end
local function AvEtR8Y(HgY6,Wc)
for eQ5,kvR in pairs(SpellCooldowns)do
if IsSpellOverlayed(kvR)then
rIX4[kvR].t:SetColorTexture(1,0,0,_gGmBBE)rIX4[kvR].t:SetAllPoints(false)else
rIX4[kvR].t:SetColorTexture(1,1,1,_gGmBBE)rIX4[kvR].t:SetAllPoints(false)end end end
local function rl3MMqfm(So)
for Wi,X1WM in pairs(dispel)do local OVBAVy=GetSpellInfo(X1WM)if OVBAVy==nil then return 0 end;local Jos,Wi,Wi,NF0,Wi,OeF,sawaLtSr,Wi,Wi,Wi,X1WM,Wi,Wi,Wi,Wi,Wi=UnitDebuff(So,OVBAVy,
nil,"HARMFUL")if(
Jos==OVBAVy)then return 1 end end;return 0 end;local nQj=""
local function Eq8jDq()if MW()==false then return end
local KWeL,Krvhod9t=IsActiveBattlefieldArena()local bfx5oN=IsInRaid()and"raid"or"party"
local XDKTNXw=GetNumGroupMembers()if(nQj~=bfx5oN)then SetupKeybinds()
if XDKTNXw==0 then bfx5oN="solo"end;nQj=bfx5oN end
local RyTb="0.0"..XDKTNXw;if(XDKTNXw>=10)then RyTb="0."..XDKTNXw end
if
(IsInRaid())then
inGame.t:SetColorTexture(tonumber(RyTb),1,1,_gGmBBE)else if KWeL==1 then
inGame.t:SetColorTexture(tonumber(RyTb),1,0.5,_gGmBBE)else
inGame.t:SetColorTexture(tonumber(RyTb),1,0,_gGmBBE)end end
if(XDKTNXw==0)then health=UnitHealth("player")
maxHealth=UnitHealthMax("player")
percHealth=ceil((health/maxHealth)*100)needToDispel=rl3MMqfm("player")local ImqF1v="0.0"..percHealth;if(percHealth>=
10)then ImqF1v="0."..percHealth end
red=tonumber(ImqF1v)
for KRu=1,5 do if(percHealth==100)then
iW2O[KRu].t:SetColorTexture(1,needToDispel,0,_gGmBBE)else
iW2O[KRu].t:SetColorTexture(red,needToDispel,0,_gGmBBE)end end;return end
for Vy5qF=1,XDKTNXw do local rokDhenZ=0;local td8OL=0
if(bfx5oN=="party")then
if(Vy5qF==1)then
health=UnitHealth("player")maxHealth=UnitHealthMax("player")
rokDhenZ=ceil((health/maxHealth)*100)td8OL=rl3MMqfm("player")else
health=UnitHealth(bfx5oN.. (Vy5qF-1))maxHealth=UnitHealthMax(bfx5oN.. (Vy5qF-1))rokDhenZ=ceil((
health/maxHealth)*100)td8OL=rl3MMqfm(
bfx5oN.. (Vy5qF-1))local i,v2VylMn=LMMNWLk:GetRange(bfx5oN..
(Vy5qF-1))if(v2VylMn==nil)then
v2VylMn=41 end
if


UnitIsDead(bfx5oN.. (Vy5qF-1))or UnitIsGhost(bfx5oN..
(Vy5qF-1))or UnitIsConnected(bfx5oN..
(Vy5qF-1))==false or UnitInPhase(bfx5oN.. (Vy5qF-1))==false or v2VylMn>40 then rokDhenZ=100;td8OL=0 end end end
if(bfx5oN=="raid")then health=UnitHealth(bfx5oN..Vy5qF)maxHealth=UnitHealthMax(
bfx5oN..Vy5qF)rokDhenZ=ceil((health/maxHealth)*
100)
td8OL=rl3MMqfm(bfx5oN..Vy5qF)local Oi,KwcrRu=LMMNWLk:GetRange(bfx5oN..Vy5qF)if
(KwcrRu==nil)then KwcrRu=41 end
if

UnitIsDead(bfx5oN..Vy5qF)or
UnitIsGhost(bfx5oN..Vy5qF)or
UnitIsConnected(bfx5oN..Vy5qF)==false or
UnitInPhase(bfx5oN..Vy5qF)==false or KwcrRu>40 then rokDhenZ=100;td8OL=0 end end;local WCS="0.0"..rokDhenZ
if(rokDhenZ>=10)then WCS="0."..rokDhenZ end;red=tonumber(WCS)if(rokDhenZ==100)then
iW2O[Vy5qF].t:SetColorTexture(1,td8OL,0,_gGmBBE)else
iW2O[Vy5qF].t:SetColorTexture(red,td8OL,0,_gGmBBE)end
iW2O[Vy5qF].t:SetAllPoints(false)end end;inGame=CreateFrame("frame","",parent)
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
local bgFJ,fqGD1rfW=LMMNWLk:GetRange("target")if fqGD1rfW==nil then fqGD1rfW=100 end
local bgFJ,K0=LMMNWLk:GetRange("pet")if K0 ==nil then K0=100 end;local _1To2="0.0"..K0
if(K0 >=10)then _1To2="0."..K0 end;green=tonumber(_1To2)local lkzs="0.0"..fqGD1rfW;if(fqGD1rfW>=10)then lkzs=
"0."..fqGD1rfW end;red=tonumber(lkzs)if
(K0 >=100)then green=1 end;if(fqGD1rfW>=100)then red=1 end;blue=0;if
(UnitExists("Focus"))then blue=1 end
rangeToTargetFrame.t:SetColorTexture(red,green,blue,_gGmBBE)end;function UpdateHealthFrame(Hhwf3oO,Oh5)local LgQF=yK(Hhwf3oO)
Oh5.t:SetColorTexture(LgQF,0,0,_gGmBBE)end
function UpdateDebuffFrame(emGbhJGH,e_Ev8OQ)
for zBMvU6,ZmbDgbg in
pairs(PlayerDebuffs)do local hMxy=GetSpellInfo(ZmbDgbg)if hMxy==nil then
sh[ZmbDgbg].t:SetColorTexture(0,0,0,_gGmBBE)return end
local hj3,zBMvU6,zBMvU6,M7q3pa8,zBMvU6,guEhw,sll,zBMvU6,zBMvU6,zBMvU6,BzNBgGvD,zBMvU6,zBMvU6,zBMvU6,zBMvU6,zBMvU6=UnitDebuff(emGbhJGH,hMxy,nil,"PLAYER|HARMFUL")
if ZmbDgbg==233490 and(hj3 ==hMxy)then local KIQCH=0
for x6Ni=1,40 do
zBMvU6,zBMvU6,zBMvU6,zBMvU6,zBMvU6,zBMvU6,zBMvU6,zBMvU6,zBMvU6,zBMvU6,spellId2,zBMvU6,zBMvU6,zBMvU6,zBMvU6,zBMvU6=UnitDebuff(emGbhJGH,x6Ni,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then KIQCH=KIQCH+1 end end;M7q3pa8=KIQCH end
if(hj3 ==hMxy)then local L4bw=GetTime()remainingTime=xb6(sll-L4bw,1)
local XhBEPD,Uq=strsplit(".",remainingTime)local RmyiI_D=tonumber(XhBEPD)/100
local w_2iiJwx=tonumber(Uq)/100
e_Ev8OQ[ZmbDgbg].t:SetColorTexture(1,RmyiI_D,w_2iiJwx,_gGmBBE)else
e_Ev8OQ[ZmbDgbg].t:SetColorTexture(0,0,0,_gGmBBE)end end end
function UpdateCastingFrame(RRESd,S1qoVmFR,...)if not UnitExists(RRESd)then return end
local f2=select(10,UnitCastingInfo(RRESd))if f2 ==nil then local Qh,Qh,Qh,Qh,lqxbMC=...f2=lqxbMC end
if f2 ==nil then for qOk5Jm=1,2 do
S1qoVmFR[qOk5Jm].t:SetColorTexture(0,0,0,_gGmBBE)end;return end;local O3rHR=""local YU80=""local ARnO_0E=""
for tpSe2fs=1,2 do
if(tpSe2fs==1)then strRedTemp=strsub(f2,1,1)
if(strRedTemp==
"")then O3rHR=1 else O3rHR="0."..strRedTemp end;strGreenTemp=strsub(f2,2,2)if(strGreenTemp=="")then ARnO_0E=1 else ARnO_0E="0."..
strGreenTemp end
strBlueTemp=strsub(f2,3,3)
if(strBlueTemp=="")then YU80=1 else YU80="0."..strBlueTemp end end
if(tpSe2fs==2)then strRedTemp=strsub(f2,4,4)if(strRedTemp=="")then O3rHR=1 else O3rHR=
"0."..strRedTemp end
strGreenTemp=strsub(f2,5,5)
if(strGreenTemp=="")then ARnO_0E=1 else ARnO_0E="0."..strGreenTemp end;strBlueTemp=strsub(f2,6,6)if(strBlueTemp=="")then YU80=1 else
YU80="0."..strBlueTemp end end;local AuVgc7=tonumber(O3rHR)local vxnB=tonumber(ARnO_0E)
local ZQOXXXd=tonumber(YU80)
S1qoVmFR[tpSe2fs].t:SetColorTexture(AuVgc7,vxnB,ZQOXXXd,_gGmBBE)end end
function FocusPulse()UpdateHealthFrame("focus",DfbW)
UpdateDebuffFrame("focus",sh)UpdateCastingFrame("focus",rrFLbCtj)end;local Jp=0
function update(cyBmTv,_TKd0F)Jp=Jp+_TKd0F;if Jp>=0.2 then Gm1()LnQUN()if(UnitExists("Focus"))then
FocusPulse()end;Jp=0 end end
local function NwBqNl3C()local Z=0;nN=CreateFrame("frame","",parent)nN:SetSize(1,1)
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
J.t:SetAllPoints(J)J:Show()J:SetScript("OnUpdate",D)local Z=0
for Dw,bsFpM in pairs(PlayerBuffs)do
B7SHDx7h[bsFpM]=CreateFrame("frame","",parent)B7SHDx7h[bsFpM]:SetSize(1,1)B7SHDx7h[bsFpM]:SetPoint("TOPLEFT",Z,
-9)
B7SHDx7h[bsFpM].t=B7SHDx7h[bsFpM]:CreateTexture()
B7SHDx7h[bsFpM].t:SetColorTexture(1,1,1,_gGmBBE)
B7SHDx7h[bsFpM].t:SetAllPoints(B7SHDx7h[bsFpM])B7SHDx7h[bsFpM]:Show()Z=Z+1 end
B7SHDx7h[table.maxn(B7SHDx7h)]:SetScript("OnUpdate",eN0UMW)end;Z=0
for h,doBTofya in pairs(SpellCooldowns)do
usLpLoaH[doBTofya]=CreateFrame("frame","",parent)usLpLoaH[doBTofya]:SetSize(1,1)usLpLoaH[doBTofya]:SetPoint("TOPLEFT",Z,
-1)
usLpLoaH[doBTofya].t=usLpLoaH[doBTofya]:CreateTexture()
usLpLoaH[doBTofya].t:SetColorTexture(1,1,1,_gGmBBE)
usLpLoaH[doBTofya].t:SetAllPoints(usLpLoaH[doBTofya])usLpLoaH[doBTofya]:Show()Z=Z+1 end
usLpLoaH[table.maxn(usLpLoaH)]:SetScript("OnUpdate",E2OQ)Z=0
for rNP,TL in pairs(SpellCooldowns)do
UIjls[TL]=CreateFrame("frame","",parent)UIjls[TL]:SetSize(1,1)
UIjls[TL]:SetPoint("TOPLEFT",Z,-2)UIjls[TL].t=UIjls[TL]:CreateTexture()
UIjls[TL].t:SetColorTexture(1,1,1,_gGmBBE)UIjls[TL].t:SetAllPoints(UIjls[TL])
UIjls[TL]:Show()Z=Z+1 end
UIjls[table.maxn(UIjls)]:SetScript("OnUpdate",IwnA)Z=0
for Tzgj_W,g0AS39 in pairs(PlayerDebuffs)do
xEq6TAF[g0AS39]=CreateFrame("frame","",parent)xEq6TAF[g0AS39]:SetSize(1,1)xEq6TAF[g0AS39]:SetPoint("TOPLEFT",Z,
-3)
xEq6TAF[g0AS39].t=xEq6TAF[g0AS39]:CreateTexture()
xEq6TAF[g0AS39].t:SetColorTexture(1,1,1,_gGmBBE)
xEq6TAF[g0AS39].t:SetAllPoints(xEq6TAF[g0AS39])xEq6TAF[g0AS39]:Show()Z=Z+1 end
xEq6TAF[table.maxn(xEq6TAF)]:SetScript("OnUpdate",WzM)Z=0
for t2,PDewNmM in pairs(SpellCooldowns)do
e7dv[PDewNmM]=CreateFrame("frame","",parent)e7dv[PDewNmM]:SetSize(1,1)e7dv[PDewNmM]:SetPoint("TOPLEFT",Z,
-4)
e7dv[PDewNmM].t=e7dv[PDewNmM]:CreateTexture()
e7dv[PDewNmM].t:SetColorTexture(1,1,1,_gGmBBE)
e7dv[PDewNmM].t:SetAllPoints(e7dv[PDewNmM])e7dv[PDewNmM]:Show()Z=Z+1 end
e7dv[table.maxn(e7dv)]:RegisterEvent("ACTIONBAR_UPDATE_STATE")
e7dv[table.maxn(e7dv)]:SetScript("OnEvent",ay)Z=0
for GFlD,y3owm5E in pairs(PlayerBuffs)do
a31jEAS[y3owm5E]=CreateFrame("frame","",parent)a31jEAS[y3owm5E]:SetSize(1,1)a31jEAS[y3owm5E]:SetPoint("TOPLEFT",Z,
-5)
a31jEAS[y3owm5E].t=a31jEAS[y3owm5E]:CreateTexture()
a31jEAS[y3owm5E].t:SetColorTexture(0,1,1,_gGmBBE)
a31jEAS[y3owm5E].t:SetAllPoints(a31jEAS[y3owm5E])a31jEAS[y3owm5E]:Show()Z=Z+1 end
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
function GetKeyBinding(psHOEe2)local R1zT
if psHOEe2 <=24 or psHOEe2 >72 then R1zT="ACTIONBUTTON".. (
((psHOEe2-1)%12)+1)elseif psHOEe2 <=36 then R1zT=
"MULTIACTIONBAR3BUTTON".. (psHOEe2-24)elseif psHOEe2 <=48 then R1zT=
"MULTIACTIONBAR4BUTTON".. (psHOEe2-36)elseif psHOEe2 <=60 then R1zT=
"MULTIACTIONBAR2BUTTON".. (psHOEe2-48)else R1zT="MULTIACTIONBAR1BUTTON"..
(psHOEe2-60)end;local J2Df=R1zT and GetBindingKey(R1zT)
if
J2Df and strlen(J2Df)>4 then J2Df=strupper(J2Df)J2Df=gsub(J2Df,"%s+","")
J2Df=gsub(J2Df,"ALT%-","A|")J2Df=gsub(J2Df,"CTRL%-","C|")
J2Df=gsub(J2Df,"SHIFT%-","S|")J2Df=gsub(J2Df,"NUMPAD","N")J2Df=gsub(J2Df,"PLUS","+")
J2Df=gsub(J2Df,"MINUS","-")J2Df=gsub(J2Df,"MULTIPLY","*")
J2Df=gsub(J2Df,"DIVIDE","/")end
if J2Df~=nil then else
if Bartender4 then
R1zT="CLICK BT4Button"..psHOEe2 ..":LeftButton"J2Df=R1zT and GetBindingKey(R1zT)
if
J2Df and strlen(J2Df)>4 then J2Df=strupper(J2Df)J2Df=gsub(J2Df,"%s+","")
J2Df=gsub(J2Df,"ALT%-","A|")J2Df=gsub(J2Df,"CTRL%-","C|")
J2Df=gsub(J2Df,"SHIFT%-","S|")J2Df=gsub(J2Df,"NUMPAD","N")J2Df=gsub(J2Df,"PLUS","+")
J2Df=gsub(J2Df,"MINUS","-")J2Df=gsub(J2Df,"MULTIPLY","*")
J2Df=gsub(J2Df,"DIVIDE","/")end end end;return J2Df end
function KeyModifierColor(YyS)local o=strfind(YyS,"|")
if(o~=nil)then local MY16y=strsub(YyS,1,o-1)if(
MY16y=="S")then return 0.01 end
if(MY16y=="C")then return 0.02 end;if(MY16y=="A")then return 0.03 end end;return 1 end
function KeyBindColor(ZBUghmX)local ncK=strfind(ZBUghmX,"|")if(ncK~=nil)then
ZBUghmX=strsub(ZBUghmX,ncK+1)end
if ZBUghmX=="\\"then return 0.01 elseif ZBUghmX=="["then return 0.02 elseif ZBUghmX=="]"then return
0.03 elseif ZBUghmX==";"then return 0.04 elseif ZBUghmX=="'"then return 0.05 elseif ZBUghmX==","then return 0.06 elseif ZBUghmX=="."then
return 0.07 elseif ZBUghmX=="/"then return 0.08 elseif ZBUghmX=="`"then return 0.09 elseif ZBUghmX=="-"then return 0.10 elseif ZBUghmX=="="then return 0.11 elseif
ZBUghmX=="F1"then return 0.12 elseif ZBUghmX=="F2"then return 0.13 elseif ZBUghmX=="F3"then return 0.14 elseif ZBUghmX=="F4"then return 0.15 elseif
ZBUghmX=="F5"then return 0.16 elseif ZBUghmX=="F6"then return 0.17 elseif ZBUghmX=="F7"then return 0.18 elseif ZBUghmX=="F8"then return 0.19 elseif
ZBUghmX=="F9"then return 0.20 elseif ZBUghmX=="F10"then return 0.21 elseif ZBUghmX=="F11"then return 0.22 elseif ZBUghmX=="F12"then
return 0.23 elseif ZBUghmX=="1"then return 0.24 elseif ZBUghmX=="2"then return 0.25 elseif ZBUghmX=="3"then return 0.26 elseif ZBUghmX=="4"then return 0.27 elseif
ZBUghmX=="5"then return 0.28 elseif ZBUghmX=="6"then return 0.29 elseif ZBUghmX=="7"then return 0.30 elseif ZBUghmX=="8"then return 0.31 elseif ZBUghmX==
"9"then return 0.32 elseif ZBUghmX=="0"then return 0.33 elseif ZBUghmX=="Q"then return 0.34 elseif ZBUghmX=="W"then return 0.35 elseif
ZBUghmX=="E"then return 0.36 elseif ZBUghmX=="R"then return 0.37 elseif ZBUghmX=="T"then return 0.38 elseif ZBUghmX=="Y"then return 0.39 elseif ZBUghmX=="U"then return
0.40 elseif ZBUghmX=="I"then return 0.41 elseif ZBUghmX=="O"then return 0.42 elseif ZBUghmX=="P"then return 0.43 elseif ZBUghmX=="A"then
return 0.44 elseif ZBUghmX=="S"then return 0.45 elseif ZBUghmX=="D"then return 0.46 elseif ZBUghmX=="F"then return 0.47 elseif ZBUghmX=="G"then return 0.48 elseif
ZBUghmX=="H"then return 0.49 elseif ZBUghmX=="J"then return 0.50 elseif ZBUghmX=="K"then return 0.51 elseif ZBUghmX=="L"then return 0.52 elseif ZBUghmX==
"Z"then return 0.53 elseif ZBUghmX=="X"then return 0.54 elseif ZBUghmX=="C"then return 0.55 elseif ZBUghmX=="V"then return 0.56 elseif
ZBUghmX=="B"then return 0.57 elseif ZBUghmX=="N"then return 0.58 elseif ZBUghmX=="M"then return 0.59 elseif ZBUghmX=="N1"then return 0.60 elseif
ZBUghmX=="N2"then return 0.61 elseif ZBUghmX=="N3"then return 0.62 elseif ZBUghmX=="N4"then return 0.63 elseif ZBUghmX=="N5"then return 0.64 elseif
ZBUghmX=="N6"then return 0.65 elseif ZBUghmX=="N7"then return 0.66 elseif ZBUghmX=="N8"then return 0.67 elseif ZBUghmX=="N9"then return 0.68 elseif
ZBUghmX=="N0"then return 0.69 end;return 1 end;function fixSlots(Deq)if(Deq<10)then return'00'..Deq end
if(Deq>=10)then return'0'..Deq end;return''..Deq end
printKeybinds=0
function RefreshKeyBinds()if(printKeybinds==1)then ChatFrame1:Clear()if Bartender4 then
print('Bartender4 detected')end end
for GH3wE,xZFv in
pairs(SpellCooldowns)do local bc0w4j=GetSpellInfo(xZFv)bindFound=false
for OGMxal0=1,120 do
local QlewVjkq,Q,yI=GetActionInfo(OGMxal0)
if QlewVjkq=="spell"then local EDE3=GetKeyBinding(OGMxal0)
if EDE3 ~=nil then
if(xZFv==Q)then
oJ1ec[xZFv].t:SetColorTexture(KeyBindColor(EDE3),KeyModifierColor(EDE3),0,_gGmBBE)
if(printKeybinds==1)then
print('Slot: '..fixSlots(OGMxal0)..
' '..GetSpellLink(xZFv)..','..

KeyBindColor(EDE3)..','..KeyModifierColor(EDE3)..','..EDE3)end;bindFound=true;break end end end
if QlewVjkq=="macro"then actionText=GetActionText(OGMxal0)
name,rank,id=GetMacroSpell(actionText)local FpWG11U=GetKeyBinding(OGMxal0)
if FpWG11U~=nil then
if(xZFv==id)then
oJ1ec[xZFv].t:SetColorTexture(KeyBindColor(FpWG11U),KeyModifierColor(FpWG11U),0,_gGmBBE)
if(printKeybinds==1)then
print('Slot: '..
fixSlots(OGMxal0)..' '..
GetSpellLink(xZFv)..','..
KeyBindColor(FpWG11U)..
','..KeyModifierColor(FpWG11U)..','..FpWG11U)end;bindFound=true;break end end end end
if bindFound==false and(printKeybinds==1)then if
(GetSpellLink(xZFv))~=nil then
print(GetSpellLink(xZFv)..',not bound')else
print('Spell Id: '..xZFv..',NOT FOUND')end end end;printKeybinds=0 end
local function XuqjvYPF()i=0
for DUic_1K,rVj9z4 in pairs(SpellCooldowns)do
oJ1ec[rVj9z4]=CreateFrame("frame","",parent)oJ1ec[rVj9z4]:SetSize(1,1)oJ1ec[rVj9z4]:SetPoint("TOPLEFT",i,
-14)
oJ1ec[rVj9z4].t=oJ1ec[rVj9z4]:CreateTexture()
oJ1ec[rVj9z4].t:SetColorTexture(0,0,0,_gGmBBE)
oJ1ec[rVj9z4].t:SetAllPoints(oJ1ec[rVj9z4])oJ1ec[rVj9z4]:Show()i=i+1 end
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("SPELL_PUSHED_TO_ACTIONBAR")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("SPELLS_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("PLAYER_ENTERING_WORLD")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("UNIT_MODEL_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:SetScript("OnEvent",RefreshKeyBinds)local kRY46C=0
for kRY46C=1,2 do EEpoeR[kRY46C]=CreateFrame("FRAME","",parent)
EEpoeR[kRY46C]:SetSize(1,1)
EEpoeR[kRY46C]:SetPoint("TOPLEFT",(kRY46C+3),-6)
EEpoeR[kRY46C].t=EEpoeR[kRY46C]:CreateTexture()
EEpoeR[kRY46C].t:SetColorTexture(0,0,0,_gGmBBE)
EEpoeR[kRY46C].t:SetAllPoints(EEpoeR[kRY46C])EEpoeR[kRY46C]:Show()end
EEpoeR[table.maxn(EEpoeR)]:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
EEpoeR[table.maxn(EEpoeR)]:SetScript("OnEvent",pG4C8fDK)
for kRY46C=1,2 do Oynw[kRY46C]=CreateFrame("FRAME","",parent)
Oynw[kRY46C]:SetSize(1,1)
Oynw[kRY46C]:SetPoint("TOPLEFT",(kRY46C+5),-6)
Oynw[kRY46C].t=Oynw[kRY46C]:CreateTexture()
Oynw[kRY46C].t:SetColorTexture(0,0,0,_gGmBBE)
Oynw[kRY46C].t:SetAllPoints(Oynw[kRY46C])Oynw[kRY46C]:Show()end
Oynw[table.maxn(Oynw)]:SetScript("OnUpdate",LLFUU)
for kRY46C=1,2 do QBO[kRY46C]=CreateFrame("FRAME","",parent)
QBO[kRY46C]:SetSize(1,1)
QBO[kRY46C]:SetPoint("TOPLEFT",(kRY46C+7),-6)QBO[kRY46C].t=QBO[kRY46C]:CreateTexture()
QBO[kRY46C].t:SetColorTexture(0,0,0,_gGmBBE)
QBO[kRY46C].t:SetAllPoints(QBO[kRY46C])QBO[kRY46C]:Show()end
QBO[table.maxn(QBO)]:SetScript("OnUpdate",kdmQtj6)
for kRY46C=1,2 do s4ggux[kRY46C]=CreateFrame("FRAME","",parent)
s4ggux[kRY46C]:SetSize(1,1)
s4ggux[kRY46C]:SetPoint("TOPLEFT",(kRY46C+9),-6)
s4ggux[kRY46C].t=s4ggux[kRY46C]:CreateTexture()
s4ggux[kRY46C].t:SetColorTexture(0,0,0,_gGmBBE)
s4ggux[kRY46C].t:SetAllPoints(s4ggux[kRY46C])s4ggux[kRY46C]:Show()end
s4ggux[table.maxn(s4ggux)]:SetScript("OnUpdate",Hc35_)
for kRY46C=1,2 do hrVI4meU[kRY46C]=CreateFrame("FRAME","",parent)
hrVI4meU[kRY46C]:SetSize(1,1)
hrVI4meU[kRY46C]:SetPoint("TOPLEFT",(kRY46C+11),-6)
hrVI4meU[kRY46C].t=hrVI4meU[kRY46C]:CreateTexture()
hrVI4meU[kRY46C].t:SetColorTexture(0,0,0,_gGmBBE)
hrVI4meU[kRY46C].t:SetAllPoints(hrVI4meU[kRY46C])hrVI4meU[kRY46C]:Show()end
hrVI4meU[table.maxn(hrVI4meU)]:SetScript("OnUpdate",ubP)kRY46C=0
for mWkmCx,qQpo in pairs(PlayerBuffs)do
inx0[qQpo]=CreateFrame("frame","",parent)inx0[qQpo]:SetSize(1,1)
inx0[qQpo]:SetPoint("TOPLEFT",kRY46C,-7)inx0[qQpo].t=inx0[qQpo]:CreateTexture()
inx0[qQpo].t:SetColorTexture(1,1,1,_gGmBBE)inx0[qQpo].t:SetAllPoints(inx0[qQpo])
inx0[qQpo]:Show()kRY46C=kRY46C+1 end
inx0[table.maxn(inx0)]:SetScript("OnUpdate",W)kRY46C=0
for qXKzBXo0,cJ in pairs(InventoryItems)do
LS4h[cJ]=CreateFrame("frame","",parent)LS4h[cJ]:SetSize(1,1)
LS4h[cJ]:SetPoint("TOPLEFT",kRY46C,-8)LS4h[cJ].t=LS4h[cJ]:CreateTexture()
LS4h[cJ].t:SetColorTexture(1,1,1,_gGmBBE)LS4h[cJ].t:SetAllPoints(LS4h[cJ])
LS4h[cJ]:Show()kRY46C=kRY46C+1 end;if(table.getn(InventoryItems)~=0)then
LS4h[table.maxn(LS4h)]:SetScript("OnUpdate",SnbfLb6)end;kRY46C=0
for HI4G3oH,ncWw in pairs(PlayerDebuffs)do
A5k5yt[ncWw]=CreateFrame("frame","",parent)A5k5yt[ncWw]:SetSize(1,1)A5k5yt[ncWw]:SetPoint("TOPLEFT",kRY46C,
-10)
A5k5yt[ncWw].t=A5k5yt[ncWw]:CreateTexture()
A5k5yt[ncWw].t:SetColorTexture(1,1,1,_gGmBBE)
A5k5yt[ncWw].t:SetAllPoints(A5k5yt[ncWw])A5k5yt[ncWw]:Show()
A5k5yt[ncWw]:SetScript("OnUpdate",lAG)kRY46C=kRY46C+1 end
A5k5yt[table.maxn(A5k5yt)]:SetScript("OnUpdate",lAG)kRY46C=0
for kdS,OS60 in pairs(SpellCooldowns)do
rIX4[OS60]=CreateFrame("frame","",parent)rIX4[OS60]:SetSize(1,1)
rIX4[OS60]:SetPoint("TOPLEFT",kRY46C,-11)rIX4[OS60].t=rIX4[OS60]:CreateTexture()
rIX4[OS60].t:SetColorTexture(1,1,1,_gGmBBE)rIX4[OS60].t:SetAllPoints(rIX4[OS60])
rIX4[OS60]:Show()kRY46C=kRY46C+1 end;if(table.getn(SpellCooldowns)~=0)then
rIX4[table.maxn(rIX4)]:SetScript("OnUpdate",AvEtR8Y)end
for kRY46C=1,4 do
AI14eFhp[kRY46C]=CreateFrame("frame","",parent)AI14eFhp[kRY46C]:SetSize(1,1)AI14eFhp[kRY46C]:SetPoint("TOPLEFT",(kRY46C),
-12)
AI14eFhp[kRY46C].t=AI14eFhp[kRY46C]:CreateTexture()
AI14eFhp[kRY46C].t:SetColorTexture(1,1,1,_gGmBBE)
AI14eFhp[kRY46C].t:SetAllPoints(AI14eFhp[kRY46C])AI14eFhp[kRY46C]:Show()end
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_ENTERING_WORLD")
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_REGEN_DISABLED")
AI14eFhp[table.maxn(AI14eFhp)]:SetScript("OnEvent",TKu)VQ=CreateFrame("frame","",parent)VQ:SetSize(1,1)VQ:SetPoint("TOPLEFT",0,
-22)VQ.t=VQ:CreateTexture()
VQ.t:SetColorTexture(1,1,1,_gGmBBE)VQ.t:SetAllPoints(VQ)VQ:Show()
VQ:SetScript("OnUpdate",rHLz2GD)local MvOaiq=IsInRaid()and"raid"or"party"kRY46C=0
for dl=1,30 do
iW2O[dl]=CreateFrame("frame","",parent)iW2O[dl]:SetSize(1,1)
iW2O[dl]:SetPoint("TOPLEFT",kRY46C,-13)iW2O[dl].t=iW2O[dl]:CreateTexture()
iW2O[dl].t:SetColorTexture(0,0,0,_gGmBBE)iW2O[dl].t:SetAllPoints(iW2O[dl])
iW2O[dl]:Show()kRY46C=kRY46C+1 end;DfbW=CreateFrame("frame","",parent)DfbW:SetSize(1,1)DfbW:SetPoint("TOPLEFT",0,
-19)DfbW.t=DfbW:CreateTexture()
DfbW.t:SetColorTexture(0,0,0,_gGmBBE)DfbW.t:SetAllPoints(DfbW)DfbW:Show()kRY46C=0
for b2UK,FC0yhp in
pairs(PlayerDebuffs)do sh[FC0yhp]=CreateFrame("frame","",parent)
sh[FC0yhp]:SetSize(1,1)sh[FC0yhp]:SetPoint("TOPLEFT",kRY46C,-20)
sh[FC0yhp].t=sh[FC0yhp]:CreateTexture()
sh[FC0yhp].t:SetColorTexture(0,0,0,_gGmBBE)sh[FC0yhp].t:SetAllPoints(sh[FC0yhp])
sh[FC0yhp]:Show()kRY46C=kRY46C+1 end
for kRY46C=1,2 do rrFLbCtj[kRY46C]=CreateFrame("FRAME","",parent)
rrFLbCtj[kRY46C]:SetSize(1,1)
rrFLbCtj[kRY46C]:SetPoint("TOPLEFT",kRY46C,-19)
rrFLbCtj[kRY46C].t=rrFLbCtj[kRY46C]:CreateTexture()
rrFLbCtj[kRY46C].t:SetColorTexture(0,0,0,_gGmBBE)
rrFLbCtj[kRY46C].t:SetAllPoints(rrFLbCtj[kRY46C])rrFLbCtj[kRY46C]:Show()end end;local function Trh()cvRh=0 end;local function K()W9yaJm=0 end
local function uK(lL30T,zt,...)local Ofgm3g=...
if zt=="ADDON_LOADED"then if(Ofgm3g==
"[Frozen]")then NwBqNl3C()XuqjvYPF()end end;if zt=="NAME_PLATE_UNIT_ADDED"then BlW0RhJA(select(1,...))
rHLz2GD()end
if zt=="PLAYER_ENTERING_WORLD"then cvRh=0;W9yaJm=0
Ef=GetSpecialization()
KfM=Ef and select(1,GetSpecializationInfo(Ef))or 0;if GetCVar("nameplateShowEnemies")=="0"then
SetCVar("nameplateShowEnemies","1")end;rb21L2=1 end;if zt=="PLAYER_REGEN_DISABLED"then rHLz2GD()end;if
zt=="PLAYER_REGEN_ENABLED"then rHLz2GD()end
if zt=="COMBAT_LOG_EVENT_UNFILTERED"then
local z6WE21dc,rJg9H,sNyznm3W,UU,YBciOAz2,wJvNH,dOvZoN,IP01vP,DIoX3,sjXYan,KxB8fW=...
if UU==UnitGUID('player')then
if rJg9H=="SPELL_SUMMON"then
local M,M,M,M,M,M,M,JmyAd,M=IP01vP:find('(%S+)-(%d+)-(%d+)-(%d+)-(%d+)-(%d+)-(%S+)')JmyAd=tonumber(JmyAd)if(JmyAd==55659)then cvRh=cvRh+1
C_Timer.After(12,Trh)end;if(JmyAd==98035)then W9yaJm=W9yaJm+1
C_Timer.After(12,K)end;return end end end end;parent:SetScript("OnEvent",uK)
parent:SetScript("OnUpdate",update)