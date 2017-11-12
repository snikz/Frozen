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
if PDA~=nil then if UnitCanAttack("player",JC)and
LibStub("SpellRange-1.0").IsSpellInRange(P5G,JC)==1 and
UnitIsDead(JC)==false then
o_v255=o_v255+1 end end end;o_v255=o_v255/100
VQ.t:SetColorTexture(1,o_v255,rb21L2,_gGmBBE)end
local function BlW0RhJA(Kqne5Stra)local FKLmmhnQ=false;for F82,wJ6tY_ in pairs(wUVm)do wUVm[F82]=nil end
for TNg=1,30 do
if UnitGUID("nameplate"..
TNg)~=nil and not
UnitIsPlayer("nameplate"..TNg)then for wO9T,QMcSUqdi in pairs(wUVm)do
if QMcSUqdi==UnitGUID(
"nameplate"..TNg)then FKLmmhnQ=true end end
if FKLmmhnQ==false then wUVm["nameplate"..TNg]=UnitGUID(
"nameplate"..TNg)FKLmmhnQ=false end end;FKLmmhnQ=false end end
local function Uy(sKy2P9i,S,...)if S=="PLAYER_REGEN_ENABLED"then PlayerIsInCombat=false
unitCombatFrame.t:SetColorTexture(1,1,1,_gGmBBE)end;if
S=="PLAYER_REGEN_DISABLED"then PlayerIsInCombat=true
unitCombatFrame.t:SetColorTexture(1,0,0,_gGmBBE)end end
local function n(AD)under=math.floor(AD)upper=math.floor(AD)+1;underV=-
(under-AD)upperV=upper-AD
if(upperV>underV)then return under else return upper end end
local function TKu()Ef=GetSpecialization()KfM=Ef and
select(1,GetSpecializationInfo(Ef))or 0
local AkxLdb66={}AllSeven=false
for aUR=1,GetMaxTalentTier()do talenetSelected=false
for c4=1,3 do
local ZNXs3Bwd=select(4,GetTalentInfo(aUR,c4,1))
if(ZNXs3Bwd==true)then AkxLdb66[aUR]=c4/100;talenetSelected=true end
if talenetSelected==false and c4 ==3 then AkxLdb66[aUR]=0 end end;if aUR==7 then AllSeven=true end end;if not AllSeven then
for Ginn=GetMaxTalentTier(),7 do AkxLdb66[Ginn]=0 end end
AI14eFhp[1].t:SetColorTexture(AkxLdb66[1],AkxLdb66[2],AkxLdb66[3],_gGmBBE)
AI14eFhp[2].t:SetColorTexture(AkxLdb66[4],AkxLdb66[5],AkxLdb66[6],_gGmBBE)
AI14eFhp[3].t:SetColorTexture(AkxLdb66[7],oTYNsnP[select(2,UnitRace("player"))],0,_gGmBBE)
AI14eFhp[4].t:SetColorTexture(I[KfM],0,0,_gGmBBE)end
local function M6kL()if not UnitExists("target")then return end
for h_pK,L in pairs(PlayerBuffs)do
local vBKFXR3=GetSpellInfo(L)
local FP3j,h_pK,h_pK,h_pK,h_pK,h_pK,fe,h_pK,h_pK,h_pK,ggnA=UnitBuff("target",vBKFXR3,nil,"PLAYER")
if(FP3j==vBKFXR3 and fe~=0)then local KaD2ExEO=fe-GetTime()-
select(4,GetNetStats())/1000
KaD2ExEO=xb6(KaD2ExEO,1)local TpiFT,JCH=strsplit(".",KaD2ExEO)
local sJ05I=tonumber(TpiFT)/100;local HrLCim=tonumber(JCH)/100;if(sJ05I>1)then sJ05I=1 end
a31jEAS[L].t:SetColorTexture(1,sJ05I,HrLCim,_gGmBBE)a31jEAS[L].t:SetAllPoints(false)else
a31jEAS[L].t:SetColorTexture(0,1,1,_gGmBBE)a31jEAS[L].t:SetAllPoints(false)end end end
local function M7o_()local w=0
if IWQcC==2 then w=UnitPower("player",SPELL_POWER_HOLY_POWER)end
if IWQcC==9 then w=UnitPower("player",SPELL_POWER_SOUL_SHARDS)end;if IWQcC==8 then
w=UnitPower("player",SPELL_POWER_ARCANE_CHARGES)end;if IWQcC==4 then
w=UnitPower("player",SPELL_POWER_COMBO_POINTS)end;if IWQcC==11 then
w=UnitPower("player",SPELL_POWER_COMBO_POINTS)end
if IWQcC==6 then
local sUu7z=UnitPower("player",SPELL_POWER_RUNES)local M5oB=6;local xIyIKo=1
for xIyIKo=1,sUu7z do
local f2x=select(3,GetRuneCooldown(xIyIKo))if not f2x then M5oB=M5oB-1 end end;w=M5oB end
if IWQcC==10 then w=UnitPower("player",SPELL_POWER_CHI)end;if w~=OyHc5FEv then
unitPowerFrame.t:SetColorTexture(0,w/100,0,_gGmBBE)unitPowerFrame.t:SetAllPoints(false)
OyHc5FEv=w end end;local dk2X7J7=nil
local function jv(Nwl,Xpt_SQ)local Y=UnitExists("pet")
if
(Y==false or UnitIsDead("pet"))then if(Y~=dk2X7J7)then
gFPRdEC.t:SetColorTexture(1,1,1,_gGmBBE)dk2X7J7=Y end else if Y~=dk2X7J7 and
not UnitIsDead("player")then
gFPRdEC.t:SetColorTexture(1,0,0,_gGmBBE)dk2X7J7=Y end end end
local function MW()if KfM==270 or KfM==65 or KfM==257 or KfM==256 or KfM==
264 or KfM==105 then return
true else return false end end
local function E2OQ(SMa,Bo)
for zF6ZPjQ,nNQG3 in pairs(SpellCooldowns)do local yW,efGM8UMy,zF6ZPjQ=GetSpellCooldown(nNQG3)
local KhH=(
yW+efGM8UMy-GetTime()-select(4,GetNetStats())/1000)if KhH<0 then KhH=0 end;local H4tXd=GetSpellInfo(nNQG3)
local Nq6If,II=IsUsableSpell(H4tXd)
if KhH~=0 then KhH=xb6(KhH,1)local Y_tefq,i=strsplit(".",KhH)
local a3u=tonumber(Y_tefq)/100;local nzhB=tonumber(i)/100
usLpLoaH[nNQG3].t:SetColorTexture(0,a3u,nzhB,_gGmBBE)
usLpLoaH[nNQG3].t:SetAllPoints(false)else if(II and MW())then
usLpLoaH[nNQG3].t:SetColorTexture(0,1,1,_gGmBBE)else
usLpLoaH[nNQG3].t:SetColorTexture(1,1,1,_gGmBBE)end
usLpLoaH[nNQG3].t:SetAllPoints(false)end end end
local function SnbfLb6(sTxVGmb,GSIcq)
for Go,DGf in pairs(InventoryItems)do local kgRX7X,JB,Go=GetItemCooldown(DGf)
local GGJhclKa=kgRX7X+JB-GetTime()local KWahIz=0;if GGJhclKa<0 then GGJhclKa=0 end;local X2kyW=0;if IsEquippedItem(DGf)then X2kyW=1 else
X2kyW=0 end;local pVlvW=GetItemCount(DGf)/100;if
pVlvW>=100 then KWahIz=1 end;if GGJhclKa==0 or KWahIz==0 then
LS4h[DGf].t:SetColorTexture(0,X2kyW,KWahIz,_gGmBBE)else
LS4h[DGf].t:SetColorTexture(1,X2kyW,KWahIz,_gGmBBE)end end end
local function ay(QcKn_,jiM)
for YUdA,lx3cpJ in pairs(SpellCooldowns)do charges,YUdA,YUdA,YUdA=GetSpellCharges(lx3cpJ)
if
(
lx3cpJ==205406 or lx3cpJ==115072 or lx3cpJ==101546)then charges=GetSpellCount(lx3cpJ)end;if(TI5[lx3cpJ]~=charges)then
e7dv[lx3cpJ].t:SetColorTexture(0,charges/100,0,_gGmBBE)e7dv[lx3cpJ].t:SetAllPoints(false)
TI5[lx3cpJ]=charges end end end
local function W(Yx9,Mn)
for ut0,ZFhlP6eg in pairs(PlayerBuffs)do local ExUgDG=GetSpellInfo(ZFhlP6eg)if(ExUgDG==nil)then
print(
'Unable to find aura (Buff) with Id: '..ZFhlP6eg)return end
local jc4o42jz,ut0,ut0,jc,ut0,Ojz_,x,ut0,ut0,ut0,Xtecl=UnitBuff("player",ExUgDG)
if(ZFhlP6eg==120694)and UnitBuff("player",ExUgDG)then
local KVcYU=0
for x6Ni=1,40 do local jc4o42jz,ut0,ut0,ut0,ut0,ut0,ut0,ut0,ut0,ut0,Xtecl,ut0,ut0,ut0,ut0,ut0=UnitBuff("player",x6Ni)if
Xtecl==120694 then KVcYU=KVcYU+1 end end;jc=KVcYU end
if(jc4o42jz==ExUgDG)then local _=GetTime()remainingTime=xb6(x-_,1)
local C,CJeG=strsplit(".",remainingTime)local F43eMG=tonumber(C)/100;local mCzjh4=tonumber(CJeG)/100
inx0[ZFhlP6eg].t:SetColorTexture(
jc/100,F43eMG,mCzjh4,_gGmBBE)inx0[ZFhlP6eg].t:SetAllPoints(false)else
inx0[ZFhlP6eg].t:SetColorTexture(1,1,1,_gGmBBE)inx0[ZFhlP6eg].t:SetAllPoints(false)end end end
local function WzM(lU,epQue9)
for cHUJrj,EI0x in pairs(PlayerDebuffs)do local E=GetSpellInfo(EI0x)
if E==nil then if
(FFG[EI0x]~="DebuffOff")then
xEq6TAF[EI0x].t:SetColorTexture(1,1,1,_gGmBBE)xEq6TAF[EI0x].t:SetAllPoints(false)
FFG[EI0x]="DebuffOff"end;return end
local lacOdjf9,cHUJrj,cHUJrj,R2h4lP4l,cHUJrj,Fh,a2e9fa,cHUJrj,cHUJrj,cHUJrj,Rc9_ZID,cHUJrj,cHUJrj,cHUJrj,cHUJrj,cHUJrj=UnitDebuff("target",E,nil,"PLAYER|HARMFUL")
if EI0x==233490 and(lacOdjf9 ==E)then local H1HF2wD6=0
for x6Ni=1,40 do
name2,cHUJrj,cHUJrj,count2,cHUJrj,Fh,expirationTime2,cHUJrj,cHUJrj,cHUJrj,spellId2,cHUJrj,cHUJrj,cHUJrj,cHUJrj,cHUJrj=UnitDebuff("target",x6Ni,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then H1HF2wD6=H1HF2wD6+1 end end;R2h4lP4l=H1HF2wD6 end
if(lacOdjf9 ==E)then local hBph=GetTime()
remainingTime=xb6(a2e9fa-hBph,1)
if
(FFG[EI0x]~="DebuffOn"..R2h4lP4l..remainingTime)then local bxNo9h,Khst=strsplit(".",remainingTime)
local pUT=tonumber(bxNo9h)/100;local ISg1=tonumber(Khst)/100;if Rc9_ZID==34914 then end
xEq6TAF[EI0x].t:SetColorTexture(
R2h4lP4l/100,pUT,ISg1,_gGmBBE)FFG[EI0x]="DebuffOn"..R2h4lP4l..remainingTime end else if(FFG[EI0x]~="DebuffOff")then
xEq6TAF[EI0x].t:SetColorTexture(1,1,1,_gGmBBE)FFG[EI0x]="DebuffOff"end end end end;local PSx={}
local function IwnA(Gh5UJya,k)
for Z8Ue,TXbmx in pairs(SpellCooldowns)do local r=0
local Pqgz415t,Z8Ue,Z8Ue,Z8Ue,Z8Ue,Z8Ue=GetSpellInfo(TXbmx)if(Pqgz415t==nil)then r=0 else
r=LibStub("SpellRange-1.0").IsSpellInRange(TXbmx,"target")end
if PSx[TXbmx]~=r then if(r==1)then
UIjls[TXbmx].t:SetColorTexture(1,0,0,_gGmBBE)else
UIjls[TXbmx].t:SetColorTexture(1,1,1,_gGmBBE)end
UIjls[TXbmx].t:SetAllPoints(false)PSx[TXbmx]=r end end end
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
local function MGt(McNxKV,WcwGYJh)local gJt=UnitLevel("player")local hCs8M=0;local GkjCn_mq=0;local T9sySp=0
local DL0mMXM="0.0"..gJt;if(gJt>=10)then DL0mMXM="0."..gJt end
GkjCn_mq=tonumber(DL0mMXM)
if(gJt>100)then GkjCn_mq=0;gJt=gJt-100;local sX="0.0"..gJt;if(gJt>=10)then
sX="0."..gJt end;T9sySp=tonumber(sX)end;local o4Kvi75g=UnitHealth("player")local ELb=UnitHealthMax("player")local FV5=ceil((
o4Kvi75g/ELb)*100)
if
UnitIsDead("player")or UnitIsGhost("player")then FV5=0 end
if(FV5 ~=G9zkKODk)then local DH6mUlGB="0.0"..FV5
if(FV5 >=10)then DH6mUlGB="0."..FV5 end;hCs8M=tonumber(DH6mUlGB)
if(FV5 ==100)then
if(gJt==100)then
nN.t:SetColorTexture(1,1,0,_gGmBBE)else nN.t:SetColorTexture(1,GkjCn_mq,T9sySp,_gGmBBE)end else
nN.t:SetColorTexture(hCs8M,GkjCn_mq,T9sySp,_gGmBBE)end;G9zkKODk=FV5 end end;local ld9GuG4t=0
local function KpCCA(A4ZRczp,rUT)local g=UnitHealth("pet")local JPi=UnitHealthMax("pet")if
JPi==nil then JPi=1 end;if JPi==0 then JPi=1 end
local Kkl6fa=ceil((g/JPi)*100)
if(ld9GuG4t~=Kkl6fa)then local t=0;local H="0.0"..Kkl6fa;if(Kkl6fa>=10)then
H="0."..Kkl6fa end;t=tonumber(H)if(Kkl6fa==100)then
petHealthFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
petHealthFrame.t:SetColorTexture(t,0,0,_gGmBBE)end
ld9GuG4t=Kkl6fa end end;local H6=0
local function hgsKvTz(glZrOuSo,Zdzaj)local UxRGyO9e=UnitGUID("target")local fvj_L=0;local _CPU89l=100;local U=0
if
(UxRGyO9e~=nil)then fvj_L=UnitHealth("target")
_CPU89l=UnitHealthMax("target")U=ceil((fvj_L/_CPU89l)*100)end
if(U~=H6)then local Kwxn=0;local yp5DGSwX="0.0"..U;if(U>=10)then yp5DGSwX="0."..U end
Kwxn=tonumber(yp5DGSwX)if(U==100)then
targetHealthFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
targetHealthFrame.t:SetColorTexture(Kwxn,0,0,_gGmBBE)end;H6=U end end
local function zEt(Sb1Mw7R,fuF)local pA2=UnitPower("player")local M5lAedm=UnitPowerMax("player")
if
(pA2 ~=_k)then _k=pA2
if
(

(IWQcC==7 and KfM==264)or(IWQcC==2)or
(IWQcC==5)or(IWQcC==8)or
(IWQcC==9)or(IWQcC==10 and KfM==270)or(IWQcC==11 and KfM==102)or(IWQcC==11 and KfM==105))then pA2=ceil((pA2/M5lAedm)*100)end;local _uYRl2kj=0;local tbN=0;local x="0.0"..pA2;if(pA2 >=10)then x="0."..pA2 end
_uYRl2kj=tonumber(x)
if(pA2 >100)then _uYRl2kj=0;pA2=pA2-100;local m="0.0"..pA2;if(pA2 >=10)then
m="0."..pA2 end;tbN=tonumber(m)end;if(pA2 ==100)then
powerFrame.t:SetColorTexture(1,0,0,_gGmBBE)else
powerFrame.t:SetColorTexture(_uYRl2kj,tbN,0,_gGmBBE)end end end;local Wjojpvg=0
local function l2PqbWw()local VVQ=math.floor(GetHaste())local Jb=0
if lasthaste==VVQ then return end;lastehaste=VVQ;local qcpea=0
if VVQ==math.abs(VVQ)then qcpea=1 else qcpea=0 end
if(VVQ>=100)then Jb=math.floor(VVQ/100)VVQ=VVQ- (Jb*100)end
local tjDBv=math.abs(tonumber(strsub(tostring(VVQ),1,2))/100)
qccJ5b.t:SetColorTexture(qcpea,Jb,tjDBv,_gGmBBE)end;local EJTH9=true
local function qTB82(vmn7v,Au1mzs)isFriend=UnitIsFriend("player","target")
if
(isFriend~=EJTH9)then
if(isFriend==true)then
g3Qeqnr.t:SetColorTexture(0,1,0,_gGmBBE)else g3Qeqnr.t:SetColorTexture(0,0,1,_gGmBBE)end;EJTH9=isFriend end end;local KL=""
local function EATFLbgY()local u39i=UnitGUID("target")
local Fdg7p=LibStub("LibBossIDs-1.0")local GD3AP=UnitIsDead("target")local jph00k=UnitLevel("player")
if
(u39i~=KL)then
if u39i==nil then qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)else
if
u39i~=nil then local wE_4o,F,F,F,F,bUO1NvT=strsplit(" - ",UnitGUID("target"))
if
Fdg7p.BossIDs[tonumber(bUO1NvT)]then qHpY64.t:SetColorTexture(0,0,1,_gGmBBE)elseif
wE_4o=="Player"then qHpY64.t:SetColorTexture(1,0,0,_gGmBBE)elseif not
Fdg7p.BossIDs[tonumber(bUO1NvT)]then
if bUO1NvT~=nil then
if


tonumber(bUO1NvT)==114631 or
tonumber(bUO1NvT)==114822 or tonumber(bUO1NvT)==90463 or tonumber(bUO1NvT)==90418 or tonumber(bUO1NvT)==90431 then qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)else
qHpY64.t:SetColorTexture(1,0,0,_gGmBBE)end end elseif(u39i~=nil and GD3AP==true)then
qHpY64.t:SetColorTexture(0,0,0,_gGmBBE)end end end;KL=u39i end end;local FF=0;local rh=""
local function YcCR(KRQG,tVwI_N)spell,_,_,_,_,_,_,castID,_=UnitCastingInfo("player")
name,_,text,_,_,_,_,_=UnitChannelInfo("player")
if castID~=nil then if castID~=FF then
ARuba.t:SetColorTexture(1,0,0,_gGmBBE)FF=castID end else if castID~=FF then
ARuba.t:SetColorTexture(1,1,1,_gGmBBE)FF=castID end end
if name~=nil then if text~=rh then
ARuba.t:SetColorTexture(0,1,0,_gGmBBE)rh=text end else if text~=rh then
ARuba.t:SetColorTexture(1,1,1,_gGmBBE)rh=text end end end
local function G3p2Yn(Jkp2lGXG,ifcyuS)return math.abs(ifcyuS-GetTime()*1000)/
math.abs(ifcyuS-Jkp2lGXG)end
local function _jkkD9(V03W,R)
spell,_,_,_,startTime,endTime,_,_,notInterrupt=UnitCastingInfo("target")if(spell==nil)then
spell,_,_,_,startTime,endTime,_,notInterrupt=UnitChannelInfo("target")end
if spell~=nil then
if notInterrupt==false then
Wo53nZ.t:SetColorTexture(1,G3p2Yn(startTime,endTime),1,_gGmBBE)else
Wo53nZ.t:SetColorTexture(0,G3p2Yn(startTime,endTime),1,_gGmBBE)end else
if spell==nil then Wo53nZ.t:SetColorTexture(0,0,0,_gGmBBE)end end end
local function D()wilds=tonumber("0.0"..cvRh)
dreadstalkers=tonumber("0.0"..W9yaJm)J.t:SetColorTexture(wilds,0,dreadstalkers,_gGmBBE)end;local DMn=nil
local function GBzFRjVV(X6_,tN5u)local Yqc0GWr=UnitIsVisible("target")
if Yqc0GWr==nil then
if
(Yqc0GWr~=DMn)then XRfQ.t:SetColorTexture(1,1,1,_gGmBBE)DMn=Yqc0GWr end else if Yqc0GWr~=DMn then XRfQ.t:SetColorTexture(1,0,0,_gGmBBE)
DMn=Yqc0GWr end end end
local function pG4C8fDK(UC7,WbvvcjER,...)if(WbvvcjER=="UNIT_SPELLCAST_SUCCEEDED")then
UpdateCastingFrame("player",EEpoeR,...)end end
local function LLFUU()UpdateCastingFrame("target",Oynw)end
local function kdmQtj6()UpdateCastingFrame("arena1",QBO)end
local function Hc35_()UpdateCastingFrame("arena2",s4ggux)end
local function ubP()UpdateCastingFrame("arena3",hrVI4meU)end
local function eN0UMW(rOLxXC,w762p7sZ)
for _7jt,ORXyFQ in pairs(PlayerBuffs)do local OL1oV=GetSpellInfo(ORXyFQ)
if OL1oV==nil then
if
(s4[ORXyFQ]~="BuffOff")then
B7SHDx7h[ORXyFQ].t:SetColorTexture(1,1,1,_gGmBBE)
B7SHDx7h[ORXyFQ].t:SetAllPoints(false)s4[ORXyFQ]="BuffOff"end;return end;local Q,_7jt,_7jt,HQvT5,_7jt,_7jt,dN,_7jt,_7jt,_7jt,_7jt=UnitBuff("pet",OL1oV)
if(Q==OL1oV)then
local B35igHj=GetTime()remainingTime=xb6(dN-B35igHj,1)
if(s4[ORXyFQ]~=
"BuffOn"..HQvT5 ..remainingTime)then
local o8pPC2,f7nUIW=strsplit(".",remainingTime)local bDgD=tonumber(o8pPC2)/100
local Kg8PhSq=tonumber(f7nUIW)/100
B7SHDx7h[ORXyFQ].t:SetColorTexture(HQvT5/100,bDgD,Kg8PhSq,_gGmBBE)
B7SHDx7h[ORXyFQ].t:SetAllPoints(false)end else
if(s4[ORXyFQ]~="BuffOff")then
B7SHDx7h[ORXyFQ].t:SetColorTexture(1,1,1,_gGmBBE)
B7SHDx7h[ORXyFQ].t:SetAllPoints(false)s4[ORXyFQ]="BuffOff"end end end end
local function lAG(Tcv_,lygY)
for HG,u in pairs(PlayerDebuffs)do local m9i="UnitDebuff"local EqPMP=GetSpellInfo(u)
if EqPMP==nil then if(
Vd[u]~="DebuffOff")then
A5k5yt[u].t:SetColorTexture(1,1,1,_gGmBBE)A5k5yt[u].t:SetAllPoints(false)
Vd[u]="DebuffOff"end;return end
local JR,HG,HG,G1Cl6,HG,HG,h,HG,HG,HG,fYUikw,HG,HG,HG,HG,HG=UnitDebuff("player",EqPMP,nil,"PLAYER|HARMFUL")
if(JR==EqPMP)then local W9qTCm=GetTime()
local YlaSjEKp=math.floor(h-W9qTCm+0.5)
if(Vd[u]~="DebuffOn"..G1Cl6 ..YlaSjEKp)then Vd[u]=
"DebuffOn"..G1Cl6 ..YlaSjEKp
YlaSjEKp=string.format("%00.2f",tostring(YlaSjEKp))
local u_ogp8=tonumber(strsub(tostring(YlaSjEKp),1,2))/100
local Kob=tonumber(strsub(tostring(YlaSjEKp),-2,-1))/100
A5k5yt[u].t:SetColorTexture(G1Cl6/100,u_ogp8,Kob,_gGmBBE)A5k5yt[u].t:SetAllPoints(false)end else if(Vd[u]~="DebuffOff")then
A5k5yt[u].t:SetColorTexture(1,1,1,_gGmBBE)A5k5yt[u].t:SetAllPoints(false)
Vd[u]="DebuffOff"end end end end
local function AvEtR8Y(a3,MvWxr)
for HgY6,Wc in pairs(SpellCooldowns)do
if IsSpellOverlayed(Wc)then
rIX4[Wc].t:SetColorTexture(1,0,0,_gGmBBE)rIX4[Wc].t:SetAllPoints(false)else
rIX4[Wc].t:SetColorTexture(1,1,1,_gGmBBE)rIX4[Wc].t:SetAllPoints(false)end end end
local function rl3MMqfm(eQ5)
for kvR,So in pairs(dispel)do local Wi=GetSpellInfo(So)if Wi==nil then return 0 end
local X1WM,kvR,kvR,OVBAVy,kvR,Jos,NF0,kvR,kvR,kvR,So,kvR,kvR,kvR,kvR,kvR=UnitDebuff(eQ5,Wi,nil,"HARMFUL")if(X1WM==Wi)then return 1 end end;return 0 end;local nQj=""
local function Eq8jDq()if MW()==false then return end
local OeF,sawaLtSr=IsActiveBattlefieldArena()local KWeL=IsInRaid()and"raid"or"party"
local Krvhod9t=GetNumGroupMembers()if(nQj~=KWeL)then SetupKeybinds()if Krvhod9t==0 then KWeL="solo"end
nQj=KWeL end;local bfx5oN="0.0"..Krvhod9t;if
(Krvhod9t>=10)then bfx5oN="0."..Krvhod9t end
if(IsInRaid())then
inGame.t:SetColorTexture(tonumber(bfx5oN),1,1,_gGmBBE)else if OeF==1 then
inGame.t:SetColorTexture(tonumber(bfx5oN),1,0.5,_gGmBBE)else
inGame.t:SetColorTexture(tonumber(bfx5oN),1,0,_gGmBBE)end end
if(Krvhod9t==0)then health=UnitHealth("player")
maxHealth=UnitHealthMax("player")
percHealth=ceil((health/maxHealth)*100)needToDispel=rl3MMqfm("player")local XDKTNXw="0.0"..percHealth;if(percHealth>=
10)then XDKTNXw="0."..percHealth end
red=tonumber(XDKTNXw)
for RyTb=1,5 do if(percHealth==100)then
iW2O[RyTb].t:SetColorTexture(1,needToDispel,0,_gGmBBE)else
iW2O[RyTb].t:SetColorTexture(red,needToDispel,0,_gGmBBE)end end;return end
for ImqF1v=1,Krvhod9t do local KRu=0;local Vy5qF=0
if(KWeL=="party")then
if(ImqF1v==1)then
health=UnitHealth("player")maxHealth=UnitHealthMax("player")
KRu=ceil((health/maxHealth)*100)Vy5qF=rl3MMqfm("player")else
health=UnitHealth(KWeL.. (ImqF1v-1))maxHealth=UnitHealthMax(KWeL.. (ImqF1v-1))KRu=ceil((
health/maxHealth)*100)Vy5qF=rl3MMqfm(KWeL.. (
ImqF1v-1))local td8OL,WCS=LMMNWLk:GetRange(KWeL..
(ImqF1v-1))
if(WCS==nil)then WCS=41 end
if


UnitIsDead(KWeL.. (ImqF1v-1))or
UnitIsGhost(KWeL.. (ImqF1v-1))or
UnitIsConnected(KWeL.. (ImqF1v-1))==false or UnitInPhase(KWeL.. (ImqF1v-1))==false or WCS>40 then KRu=100;Vy5qF=0 end end end
if(KWeL=="raid")then health=UnitHealth(KWeL..ImqF1v)maxHealth=UnitHealthMax(
KWeL..ImqF1v)
KRu=ceil((health/maxHealth)*100)Vy5qF=rl3MMqfm(KWeL..ImqF1v)
local i,v2VylMn=LMMNWLk:GetRange(KWeL..ImqF1v)if(v2VylMn==nil)then v2VylMn=41 end
if

UnitIsDead(KWeL..ImqF1v)or UnitIsGhost(
KWeL..ImqF1v)or
UnitIsConnected(KWeL..ImqF1v)==false or UnitInPhase(KWeL..
ImqF1v)==false or v2VylMn>40 then KRu=100;Vy5qF=0 end end;local rokDhenZ="0.0"..KRu;if(KRu>=10)then rokDhenZ="0."..KRu end
red=tonumber(rokDhenZ)if(KRu==100)then
iW2O[ImqF1v].t:SetColorTexture(1,Vy5qF,0,_gGmBBE)else
iW2O[ImqF1v].t:SetColorTexture(red,Vy5qF,0,_gGmBBE)end
iW2O[ImqF1v].t:SetAllPoints(false)end end;inGame=CreateFrame("frame","",parent)
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
local Oi,KwcrRu=LMMNWLk:GetRange("target")if KwcrRu==nil then KwcrRu=100 end
local Oi,bgFJ=LMMNWLk:GetRange("pet")if bgFJ==nil then bgFJ=100 end;local fqGD1rfW="0.0"..bgFJ;if(bgFJ>=10)then
fqGD1rfW="0."..bgFJ end;green=tonumber(fqGD1rfW)local K0="0.0"..KwcrRu;if(
KwcrRu>=10)then K0="0."..KwcrRu end;red=tonumber(K0)if(bgFJ>=
100)then green=1 end;if(KwcrRu>=100)then red=1 end;blue=0;if
(UnitExists("Focus"))then blue=1 end
rangeToTargetFrame.t:SetColorTexture(red,green,blue,_gGmBBE)end;function UpdateHealthFrame(_1To2,lkzs)local Hhwf3oO=yK(_1To2)
lkzs.t:SetColorTexture(Hhwf3oO,0,0,_gGmBBE)end
function UpdateDebuffFrame(Oh5,LgQF)
for emGbhJGH,e_Ev8OQ in
pairs(PlayerDebuffs)do local zBMvU6=GetSpellInfo(e_Ev8OQ)if zBMvU6 ==nil then
sh[e_Ev8OQ].t:SetColorTexture(0,0,0,_gGmBBE)return end
local ZmbDgbg,emGbhJGH,emGbhJGH,hMxy,emGbhJGH,hj3,M7q3pa8,emGbhJGH,emGbhJGH,emGbhJGH,guEhw,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH=UnitDebuff(Oh5,zBMvU6,nil,"PLAYER|HARMFUL")
if e_Ev8OQ==233490 and(ZmbDgbg==zBMvU6)then local sll=0
for x6Ni=1,40 do
emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,spellId2,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH,emGbhJGH=UnitDebuff(Oh5,x6Ni,"PLAYER|HARMFUL")if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then sll=sll+1 end end;hMxy=sll end
if(ZmbDgbg==zBMvU6)then local BzNBgGvD=GetTime()
remainingTime=xb6(M7q3pa8-BzNBgGvD,1)local KIQCH,L4bw=strsplit(".",remainingTime)
local XhBEPD=tonumber(KIQCH)/100;local Uq=tonumber(L4bw)/100
LgQF[e_Ev8OQ].t:SetColorTexture(1,XhBEPD,Uq,_gGmBBE)else
LgQF[e_Ev8OQ].t:SetColorTexture(0,0,0,_gGmBBE)end end end
function UpdateCastingFrame(RmyiI_D,w_2iiJwx,...)if not UnitExists(RmyiI_D)then return end
local RRESd=select(10,UnitCastingInfo(RmyiI_D))
if RRESd==nil then local YU80,YU80,YU80,YU80,ARnO_0E=...RRESd=ARnO_0E end
if RRESd==nil then for Qh=1,2 do
w_2iiJwx[Qh].t:SetColorTexture(0,0,0,_gGmBBE)end;return end;local S1qoVmFR=""local f2=""local O3rHR=""
for lqxbMC=1,2 do
if(lqxbMC==1)then strRedTemp=strsub(RRESd,1,1)
if(
strRedTemp=="")then S1qoVmFR=1 else S1qoVmFR="0."..strRedTemp end;strGreenTemp=strsub(RRESd,2,2)if(strGreenTemp=="")then O3rHR=1 else O3rHR="0."..
strGreenTemp end
strBlueTemp=strsub(RRESd,3,3)
if(strBlueTemp=="")then f2=1 else f2="0."..strBlueTemp end end
if(lqxbMC==2)then strRedTemp=strsub(RRESd,4,4)if(strRedTemp=="")then
S1qoVmFR=1 else S1qoVmFR="0."..strRedTemp end
strGreenTemp=strsub(RRESd,5,5)
if(strGreenTemp=="")then O3rHR=1 else O3rHR="0."..strGreenTemp end;strBlueTemp=strsub(RRESd,6,6)if(strBlueTemp=="")then f2=1 else
f2="0."..strBlueTemp end end;local qOk5Jm=tonumber(S1qoVmFR)local tpSe2fs=tonumber(O3rHR)
local AuVgc7=tonumber(f2)
w_2iiJwx[lqxbMC].t:SetColorTexture(qOk5Jm,tpSe2fs,AuVgc7,_gGmBBE)end end
function FocusPulse()UpdateHealthFrame("focus",DfbW)
UpdateDebuffFrame("focus",sh)UpdateCastingFrame("focus",rrFLbCtj)end;local Jp=0;function update(vxnB,ZQOXXXd)Jp=Jp+ZQOXXXd
if Jp>=0.2 then Gm1()LnQUN()if
(UnitExists("Focus"))then FocusPulse()end;Jp=0 end end
local function NwBqNl3C()local cyBmTv=0
nN=CreateFrame("frame","",parent)nN:SetSize(1,1)nN:SetPoint("TOPLEFT",0,0)
nN.t=nN:CreateTexture()nN.t:SetColorTexture(1,1,1,_gGmBBE)
nN.t:SetAllPoints(nN)nN:Show()nN:RegisterEvent("PLAYER_ENTERING_WORLD")
nN:RegisterEvent("PLAYER_REGEN_ENABLED")nN:RegisterEvent("PLAYER_REGEN_DISABLED")
nN:RegisterUnitEvent("UNIT_HEALTH","player")nN:RegisterEvent("PLAYER_TARGET_CHANGED")
nN:SetScript("OnEvent",MGt)powerFrame=CreateFrame("frame","",parent)
powerFrame:SetSize(1,1)powerFrame:SetPoint("TOPLEFT",1,0)
powerFrame.t=powerFrame:CreateTexture()powerFrame.t:SetColorTexture(1,1,1,_gGmBBE)
powerFrame.t:SetAllPoints(powerFrame)powerFrame:Show()
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
J.t:SetAllPoints(J)J:Show()J:SetScript("OnUpdate",D)local cyBmTv=0
for _TKd0F,Z in pairs(PlayerBuffs)do
B7SHDx7h[Z]=CreateFrame("frame","",parent)B7SHDx7h[Z]:SetSize(1,1)
B7SHDx7h[Z]:SetPoint("TOPLEFT",cyBmTv,-9)B7SHDx7h[Z].t=B7SHDx7h[Z]:CreateTexture()
B7SHDx7h[Z].t:SetColorTexture(1,1,1,_gGmBBE)
B7SHDx7h[Z].t:SetAllPoints(B7SHDx7h[Z])B7SHDx7h[Z]:Show()cyBmTv=cyBmTv+1 end
B7SHDx7h[table.maxn(B7SHDx7h)]:SetScript("OnUpdate",eN0UMW)end;cyBmTv=0
for Dw,bsFpM in pairs(SpellCooldowns)do
usLpLoaH[bsFpM]=CreateFrame("frame","",parent)usLpLoaH[bsFpM]:SetSize(1,1)usLpLoaH[bsFpM]:SetPoint("TOPLEFT",cyBmTv,
-1)
usLpLoaH[bsFpM].t=usLpLoaH[bsFpM]:CreateTexture()
usLpLoaH[bsFpM].t:SetColorTexture(1,1,1,_gGmBBE)
usLpLoaH[bsFpM].t:SetAllPoints(usLpLoaH[bsFpM])usLpLoaH[bsFpM]:Show()cyBmTv=cyBmTv+1 end
usLpLoaH[table.maxn(usLpLoaH)]:SetScript("OnUpdate",E2OQ)cyBmTv=0
for h,doBTofya in pairs(SpellCooldowns)do
UIjls[doBTofya]=CreateFrame("frame","",parent)UIjls[doBTofya]:SetSize(1,1)UIjls[doBTofya]:SetPoint("TOPLEFT",cyBmTv,
-2)
UIjls[doBTofya].t=UIjls[doBTofya]:CreateTexture()
UIjls[doBTofya].t:SetColorTexture(1,1,1,_gGmBBE)
UIjls[doBTofya].t:SetAllPoints(UIjls[doBTofya])UIjls[doBTofya]:Show()cyBmTv=cyBmTv+1 end
UIjls[table.maxn(UIjls)]:SetScript("OnUpdate",IwnA)cyBmTv=0
for rNP,TL in pairs(PlayerDebuffs)do
xEq6TAF[TL]=CreateFrame("frame","",parent)xEq6TAF[TL]:SetSize(1,1)
xEq6TAF[TL]:SetPoint("TOPLEFT",cyBmTv,-3)xEq6TAF[TL].t=xEq6TAF[TL]:CreateTexture()
xEq6TAF[TL].t:SetColorTexture(1,1,1,_gGmBBE)
xEq6TAF[TL].t:SetAllPoints(xEq6TAF[TL])xEq6TAF[TL]:Show()cyBmTv=cyBmTv+1 end
xEq6TAF[table.maxn(xEq6TAF)]:SetScript("OnUpdate",WzM)cyBmTv=0
for Tzgj_W,g0AS39 in pairs(SpellCooldowns)do
e7dv[g0AS39]=CreateFrame("frame","",parent)e7dv[g0AS39]:SetSize(1,1)e7dv[g0AS39]:SetPoint("TOPLEFT",cyBmTv,
-4)
e7dv[g0AS39].t=e7dv[g0AS39]:CreateTexture()
e7dv[g0AS39].t:SetColorTexture(1,1,1,_gGmBBE)
e7dv[g0AS39].t:SetAllPoints(e7dv[g0AS39])e7dv[g0AS39]:Show()cyBmTv=cyBmTv+1 end
e7dv[table.maxn(e7dv)]:RegisterEvent("ACTIONBAR_UPDATE_STATE")
e7dv[table.maxn(e7dv)]:SetScript("OnEvent",ay)cyBmTv=0
for t2,PDewNmM in pairs(PlayerBuffs)do
a31jEAS[PDewNmM]=CreateFrame("frame","",parent)a31jEAS[PDewNmM]:SetSize(1,1)a31jEAS[PDewNmM]:SetPoint("TOPLEFT",cyBmTv,
-5)
a31jEAS[PDewNmM].t=a31jEAS[PDewNmM]:CreateTexture()
a31jEAS[PDewNmM].t:SetColorTexture(0,1,1,_gGmBBE)
a31jEAS[PDewNmM].t:SetAllPoints(a31jEAS[PDewNmM])a31jEAS[PDewNmM]:Show()cyBmTv=cyBmTv+1 end
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
function GetKeyBinding(GFlD)local y3owm5E
if GFlD<=24 or GFlD>72 then y3owm5E="ACTIONBUTTON"..
(((GFlD-1)%12)+1)elseif GFlD<=36 then
y3owm5E="MULTIACTIONBAR3BUTTON".. (GFlD-24)elseif GFlD<=48 then y3owm5E="MULTIACTIONBAR4BUTTON".. (GFlD-36)elseif
GFlD<=60 then y3owm5E="MULTIACTIONBAR2BUTTON".. (GFlD-48)else y3owm5E=
"MULTIACTIONBAR1BUTTON".. (GFlD-60)end;local psHOEe2=y3owm5E and GetBindingKey(y3owm5E)
if psHOEe2 and
strlen(psHOEe2)>4 then psHOEe2=strupper(psHOEe2)
psHOEe2=gsub(psHOEe2,"%s+","")psHOEe2=gsub(psHOEe2,"ALT%-","A|")
psHOEe2=gsub(psHOEe2,"CTRL%-","C|")psHOEe2=gsub(psHOEe2,"SHIFT%-","S|")
psHOEe2=gsub(psHOEe2,"NUMPAD","N")psHOEe2=gsub(psHOEe2,"PLUS","+")
psHOEe2=gsub(psHOEe2,"MINUS","-")psHOEe2=gsub(psHOEe2,"MULTIPLY","*")
psHOEe2=gsub(psHOEe2,"DIVIDE","/")end
if psHOEe2 ~=nil then else
if Bartender4 then
y3owm5E="CLICK BT4Button"..GFlD..":LeftButton"psHOEe2=y3owm5E and GetBindingKey(y3owm5E)
if psHOEe2 and
strlen(psHOEe2)>4 then psHOEe2=strupper(psHOEe2)
psHOEe2=gsub(psHOEe2,"%s+","")psHOEe2=gsub(psHOEe2,"ALT%-","A|")
psHOEe2=gsub(psHOEe2,"CTRL%-","C|")psHOEe2=gsub(psHOEe2,"SHIFT%-","S|")
psHOEe2=gsub(psHOEe2,"NUMPAD","N")psHOEe2=gsub(psHOEe2,"PLUS","+")
psHOEe2=gsub(psHOEe2,"MINUS","-")psHOEe2=gsub(psHOEe2,"MULTIPLY","*")
psHOEe2=gsub(psHOEe2,"DIVIDE","/")end end end;return psHOEe2 end
function KeyModifierColor(R1zT)local J2Df=strfind(R1zT,"|")
if(J2Df~=nil)then
local YyS=strsub(R1zT,1,J2Df-1)if(YyS=="S")then return 0.01 end;if(YyS=="C")then return 0.02 end;if
(YyS=="A")then return 0.03 end end;return 1 end
function KeyBindColor(o)local MY16y=strfind(o,"|")
if(MY16y~=nil)then o=strsub(o,MY16y+1)end
if o=="\\"then return 0.01 elseif o=="["then return 0.02 elseif o=="]"then return 0.03 elseif o==";"then return 0.04 elseif o=="'"then return 0.05 elseif o==","then
return 0.06 elseif o=="."then return 0.07 elseif o=="/"then return 0.08 elseif o=="`"then return 0.09 elseif o=="-"then return 0.10 elseif o=="="then return 0.11 elseif o=="F1"then
return 0.12 elseif o=="F2"then return 0.13 elseif o=="F3"then return 0.14 elseif o=="F4"then return 0.15 elseif o=="F5"then return 0.16 elseif o=="F6"then return 0.17 elseif o=="F7"then return
0.18 elseif o=="F8"then return 0.19 elseif o=="F9"then return 0.20 elseif o=="F10"then return 0.21 elseif o=="F11"then return 0.22 elseif o=="F12"then
return 0.23 elseif o=="1"then return 0.24 elseif o=="2"then return 0.25 elseif o=="3"then return 0.26 elseif o=="4"then return 0.27 elseif o=="5"then return 0.28 elseif o=="6"then return 0.29 elseif
o=="7"then return 0.30 elseif o=="8"then return 0.31 elseif o=="9"then return 0.32 elseif o=="0"then return 0.33 elseif o=="Q"then return 0.34 elseif o=="W"then return 0.35 elseif
o=="E"then return 0.36 elseif o=="R"then return 0.37 elseif o=="T"then return 0.38 elseif o=="Y"then return 0.39 elseif o=="U"then return 0.40 elseif o=="I"then return 0.41 elseif
o=="O"then return 0.42 elseif o=="P"then return 0.43 elseif o=="A"then return 0.44 elseif o=="S"then return 0.45 elseif o=="D"then return 0.46 elseif o=="F"then return 0.47 elseif
o=="G"then return 0.48 elseif o=="H"then return 0.49 elseif o=="J"then return 0.50 elseif o=="K"then return 0.51 elseif o=="L"then return 0.52 elseif o=="Z"then return 0.53 elseif
o=="X"then return 0.54 elseif o=="C"then return 0.55 elseif o=="V"then return 0.56 elseif o=="B"then return 0.57 elseif o=="N"then return 0.58 elseif o=="M"then return 0.59 elseif
o=="N1"then return 0.60 elseif o=="N2"then return 0.61 elseif o=="N3"then return 0.62 elseif o=="N4"then return 0.63 elseif o=="N5"then return 0.64 elseif o=="N6"then return
0.65 elseif o=="N7"then return 0.66 elseif o=="N8"then return 0.67 elseif o=="N9"then return 0.68 elseif o=="N0"then return 0.69 end;return 1 end
function fixSlots(ZBUghmX)if(ZBUghmX<10)then return'00'..ZBUghmX end;if
(ZBUghmX>=10)then return'0'..ZBUghmX end;return''..ZBUghmX end;printKeybinds=0
function RefreshKeyBinds()
if(printKeybinds==1)then
ChatFrame1:Clear()if Bartender4 then print('Bartender4 detected')end end
for ncK,Deq in pairs(SpellCooldowns)do local GH3wE=GetSpellInfo(Deq)bindFound=false
for xZFv=1,120 do
local bc0w4j,OGMxal0,QlewVjkq=GetActionInfo(xZFv)
if bc0w4j=="spell"then local Q=GetKeyBinding(xZFv)
if Q~=nil then
if(Deq==OGMxal0)then
oJ1ec[Deq].t:SetColorTexture(KeyBindColor(Q),KeyModifierColor(Q),0,_gGmBBE)if(printKeybinds==1)then
print('Slot: '..fixSlots(xZFv)..
' '..GetSpellLink(Deq)..','..

KeyBindColor(Q)..','..KeyModifierColor(Q)..','..Q)end
bindFound=true;break end end end
if bc0w4j=="macro"then actionText=GetActionText(xZFv)
name,rank,id=GetMacroSpell(actionText)local yI=GetKeyBinding(xZFv)
if yI~=nil then
if(Deq==id)then
oJ1ec[Deq].t:SetColorTexture(KeyBindColor(yI),KeyModifierColor(yI),0,_gGmBBE)if(printKeybinds==1)then
print('Slot: '..fixSlots(xZFv)..
' '..GetSpellLink(Deq)..','..

KeyBindColor(yI)..','..KeyModifierColor(yI)..','..yI)end
bindFound=true;break end end end end
if bindFound==false and(printKeybinds==1)then if
(GetSpellLink(Deq))~=nil then
print(GetSpellLink(Deq)..',not bound')else
print('Spell Id: '..Deq..',NOT FOUND')end end end;printKeybinds=0 end
local function XuqjvYPF()i=0
for kRY46C,MvOaiq in pairs(SpellCooldowns)do
oJ1ec[MvOaiq]=CreateFrame("frame","",parent)oJ1ec[MvOaiq]:SetSize(1,1)oJ1ec[MvOaiq]:SetPoint("TOPLEFT",i,
-14)
oJ1ec[MvOaiq].t=oJ1ec[MvOaiq]:CreateTexture()
oJ1ec[MvOaiq].t:SetColorTexture(0,0,0,_gGmBBE)
oJ1ec[MvOaiq].t:SetAllPoints(oJ1ec[MvOaiq])oJ1ec[MvOaiq]:Show()i=i+1 end
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("SPELL_PUSHED_TO_ACTIONBAR")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("SPELLS_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("PLAYER_ENTERING_WORLD")
oJ1ec[table.maxn(oJ1ec)]:RegisterEvent("UNIT_MODEL_CHANGED")
oJ1ec[table.maxn(oJ1ec)]:SetScript("OnEvent",RefreshKeyBinds)local EDE3=0
for EDE3=1,2 do EEpoeR[EDE3]=CreateFrame("FRAME","",parent)
EEpoeR[EDE3]:SetSize(1,1)
EEpoeR[EDE3]:SetPoint("TOPLEFT",(EDE3+3),-6)
EEpoeR[EDE3].t=EEpoeR[EDE3]:CreateTexture()
EEpoeR[EDE3].t:SetColorTexture(0,0,0,_gGmBBE)
EEpoeR[EDE3].t:SetAllPoints(EEpoeR[EDE3])EEpoeR[EDE3]:Show()end
EEpoeR[table.maxn(EEpoeR)]:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
EEpoeR[table.maxn(EEpoeR)]:SetScript("OnEvent",pG4C8fDK)
for EDE3=1,2 do Oynw[EDE3]=CreateFrame("FRAME","",parent)
Oynw[EDE3]:SetSize(1,1)
Oynw[EDE3]:SetPoint("TOPLEFT",(EDE3+5),-6)Oynw[EDE3].t=Oynw[EDE3]:CreateTexture()
Oynw[EDE3].t:SetColorTexture(0,0,0,_gGmBBE)Oynw[EDE3].t:SetAllPoints(Oynw[EDE3])
Oynw[EDE3]:Show()end
Oynw[table.maxn(Oynw)]:SetScript("OnUpdate",LLFUU)
for EDE3=1,2 do QBO[EDE3]=CreateFrame("FRAME","",parent)
QBO[EDE3]:SetSize(1,1)QBO[EDE3]:SetPoint("TOPLEFT",(EDE3+7),-6)
QBO[EDE3].t=QBO[EDE3]:CreateTexture()QBO[EDE3].t:SetColorTexture(0,0,0,_gGmBBE)
QBO[EDE3].t:SetAllPoints(QBO[EDE3])QBO[EDE3]:Show()end
QBO[table.maxn(QBO)]:SetScript("OnUpdate",kdmQtj6)
for EDE3=1,2 do s4ggux[EDE3]=CreateFrame("FRAME","",parent)
s4ggux[EDE3]:SetSize(1,1)
s4ggux[EDE3]:SetPoint("TOPLEFT",(EDE3+9),-6)
s4ggux[EDE3].t=s4ggux[EDE3]:CreateTexture()
s4ggux[EDE3].t:SetColorTexture(0,0,0,_gGmBBE)
s4ggux[EDE3].t:SetAllPoints(s4ggux[EDE3])s4ggux[EDE3]:Show()end
s4ggux[table.maxn(s4ggux)]:SetScript("OnUpdate",Hc35_)
for EDE3=1,2 do hrVI4meU[EDE3]=CreateFrame("FRAME","",parent)
hrVI4meU[EDE3]:SetSize(1,1)
hrVI4meU[EDE3]:SetPoint("TOPLEFT",(EDE3+11),-6)
hrVI4meU[EDE3].t=hrVI4meU[EDE3]:CreateTexture()
hrVI4meU[EDE3].t:SetColorTexture(0,0,0,_gGmBBE)
hrVI4meU[EDE3].t:SetAllPoints(hrVI4meU[EDE3])hrVI4meU[EDE3]:Show()end
hrVI4meU[table.maxn(hrVI4meU)]:SetScript("OnUpdate",ubP)EDE3=0
for DUic_1K,rVj9z4 in pairs(PlayerBuffs)do
inx0[rVj9z4]=CreateFrame("frame","",parent)inx0[rVj9z4]:SetSize(1,1)inx0[rVj9z4]:SetPoint("TOPLEFT",EDE3,-
7)
inx0[rVj9z4].t=inx0[rVj9z4]:CreateTexture()
inx0[rVj9z4].t:SetColorTexture(1,1,1,_gGmBBE)
inx0[rVj9z4].t:SetAllPoints(inx0[rVj9z4])inx0[rVj9z4]:Show()EDE3=EDE3+1 end
inx0[table.maxn(inx0)]:SetScript("OnUpdate",W)EDE3=0
for mWkmCx,qQpo in pairs(InventoryItems)do
LS4h[qQpo]=CreateFrame("frame","",parent)LS4h[qQpo]:SetSize(1,1)
LS4h[qQpo]:SetPoint("TOPLEFT",EDE3,-8)LS4h[qQpo].t=LS4h[qQpo]:CreateTexture()
LS4h[qQpo].t:SetColorTexture(1,1,1,_gGmBBE)LS4h[qQpo].t:SetAllPoints(LS4h[qQpo])
LS4h[qQpo]:Show()EDE3=EDE3+1 end;if(table.getn(InventoryItems)~=0)then
LS4h[table.maxn(LS4h)]:SetScript("OnUpdate",SnbfLb6)end;EDE3=0
for qXKzBXo0,cJ in pairs(PlayerDebuffs)do
A5k5yt[cJ]=CreateFrame("frame","",parent)A5k5yt[cJ]:SetSize(1,1)
A5k5yt[cJ]:SetPoint("TOPLEFT",EDE3,-10)A5k5yt[cJ].t=A5k5yt[cJ]:CreateTexture()
A5k5yt[cJ].t:SetColorTexture(1,1,1,_gGmBBE)A5k5yt[cJ].t:SetAllPoints(A5k5yt[cJ])
A5k5yt[cJ]:Show()A5k5yt[cJ]:SetScript("OnUpdate",lAG)EDE3=EDE3+1 end
A5k5yt[table.maxn(A5k5yt)]:SetScript("OnUpdate",lAG)EDE3=0
for HI4G3oH,ncWw in pairs(SpellCooldowns)do
rIX4[ncWw]=CreateFrame("frame","",parent)rIX4[ncWw]:SetSize(1,1)
rIX4[ncWw]:SetPoint("TOPLEFT",EDE3,-11)rIX4[ncWw].t=rIX4[ncWw]:CreateTexture()
rIX4[ncWw].t:SetColorTexture(1,1,1,_gGmBBE)rIX4[ncWw].t:SetAllPoints(rIX4[ncWw])
rIX4[ncWw]:Show()EDE3=EDE3+1 end;if(table.getn(SpellCooldowns)~=0)then
rIX4[table.maxn(rIX4)]:SetScript("OnUpdate",AvEtR8Y)end
for EDE3=1,4 do
AI14eFhp[EDE3]=CreateFrame("frame","",parent)AI14eFhp[EDE3]:SetSize(1,1)AI14eFhp[EDE3]:SetPoint("TOPLEFT",(EDE3),
-12)
AI14eFhp[EDE3].t=AI14eFhp[EDE3]:CreateTexture()
AI14eFhp[EDE3].t:SetColorTexture(1,1,1,_gGmBBE)
AI14eFhp[EDE3].t:SetAllPoints(AI14eFhp[EDE3])AI14eFhp[EDE3]:Show()end
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_ENTERING_WORLD")
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
AI14eFhp[table.maxn(AI14eFhp)]:RegisterEvent("PLAYER_REGEN_DISABLED")
AI14eFhp[table.maxn(AI14eFhp)]:SetScript("OnEvent",TKu)VQ=CreateFrame("frame","",parent)VQ:SetSize(1,1)VQ:SetPoint("TOPLEFT",0,
-22)VQ.t=VQ:CreateTexture()
VQ.t:SetColorTexture(1,1,1,_gGmBBE)VQ.t:SetAllPoints(VQ)VQ:Show()
VQ:SetScript("OnUpdate",rHLz2GD)local FpWG11U=IsInRaid()and"raid"or"party"EDE3=0
for kdS=1,30 do
iW2O[kdS]=CreateFrame("frame","",parent)iW2O[kdS]:SetSize(1,1)
iW2O[kdS]:SetPoint("TOPLEFT",EDE3,-13)iW2O[kdS].t=iW2O[kdS]:CreateTexture()
iW2O[kdS].t:SetColorTexture(0,0,0,_gGmBBE)iW2O[kdS].t:SetAllPoints(iW2O[kdS])
iW2O[kdS]:Show()EDE3=EDE3+1 end;DfbW=CreateFrame("frame","",parent)DfbW:SetSize(1,1)DfbW:SetPoint("TOPLEFT",0,
-19)DfbW.t=DfbW:CreateTexture()
DfbW.t:SetColorTexture(0,0,0,_gGmBBE)DfbW.t:SetAllPoints(DfbW)DfbW:Show()EDE3=0
for OS60,dl in
pairs(PlayerDebuffs)do sh[dl]=CreateFrame("frame","",parent)
sh[dl]:SetSize(1,1)sh[dl]:SetPoint("TOPLEFT",EDE3,-20)
sh[dl].t=sh[dl]:CreateTexture()sh[dl].t:SetColorTexture(0,0,0,_gGmBBE)
sh[dl].t:SetAllPoints(sh[dl])sh[dl]:Show()EDE3=EDE3+1 end
for EDE3=1,2 do rrFLbCtj[EDE3]=CreateFrame("FRAME","",parent)
rrFLbCtj[EDE3]:SetSize(1,1)
rrFLbCtj[EDE3]:SetPoint("TOPLEFT",EDE3,-19)
rrFLbCtj[EDE3].t=rrFLbCtj[EDE3]:CreateTexture()
rrFLbCtj[EDE3].t:SetColorTexture(0,0,0,_gGmBBE)
rrFLbCtj[EDE3].t:SetAllPoints(rrFLbCtj[EDE3])rrFLbCtj[EDE3]:Show()end end;local function Trh()cvRh=0 end;local function K()W9yaJm=0 end
local function uK(b2UK,FC0yhp,...)local lL30T=...if FC0yhp=="ADDON_LOADED"then
if(
lL30T=="[Frozen]")then NwBqNl3C()XuqjvYPF()end end;if FC0yhp=="NAME_PLATE_UNIT_ADDED"then
BlW0RhJA(select(1,...))rHLz2GD()end
if
FC0yhp=="PLAYER_ENTERING_WORLD"then cvRh=0;W9yaJm=0;Ef=GetSpecialization()KfM=Ef and
select(1,GetSpecializationInfo(Ef))or 0
if
GetCVar("nameplateShowEnemies")=="0"then SetCVar("nameplateShowEnemies","1")end;rb21L2=1 end;if FC0yhp=="PLAYER_REGEN_DISABLED"then rHLz2GD()end;if FC0yhp==
"PLAYER_REGEN_ENABLED"then rHLz2GD()end
if
FC0yhp=="COMBAT_LOG_EVENT_UNFILTERED"then local zt,Ofgm3g,z6WE21dc,rJg9H,sNyznm3W,UU,YBciOAz2,wJvNH,dOvZoN,IP01vP,DIoX3=...
if rJg9H==UnitGUID('player')then
if
Ofgm3g=="SPELL_SUMMON"then
local sjXYan,sjXYan,sjXYan,sjXYan,sjXYan,sjXYan,sjXYan,KxB8fW,sjXYan=wJvNH:find('(%S+)-(%d+)-(%d+)-(%d+)-(%d+)-(%d+)-(%S+)')KxB8fW=tonumber(KxB8fW)if(KxB8fW==55659)then cvRh=cvRh+1
C_Timer.After(12,Trh)end;if(KxB8fW==98035)then W9yaJm=W9yaJm+1
C_Timer.After(12,K)end;return end end end end;parent:SetScript("OnEvent",uK)
parent:SetScript("OnUpdate",update)