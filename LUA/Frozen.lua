local K3ipRr=0;local F2tY=0;local rb21L2={}local o_v255=nil
local wUVm={["Human"]=0.01,["Dwarf"]=0.02,["NightElf"]=0.03,["Gnome"]=0.04,["Draenei"]=0.05,["Pandaren"]=0.06,["Orc"]=0.07,["Scourge"]=0.08,["Tauren"]=0.09,["Troll"]=0.10,["BloodElf"]=0.11,["Goblin"]=0.12,["Worgen"]=0.13}
local VQ={[0]=0.00,[250]=0.01,[251]=0.02,[252]=0.03,[577]=0.04,[581]=0.05,[102]=0.06,[103]=0.07,[104]=0.08,[105]=0.09,[253]=0.10,[254]=0.11,[255]=0.12,[62]=0.13,[63]=0.14,[64]=0.15,[268]=0.16,[269]=0.17,[270]=0.18,[65]=0.19,[66]=0.20,[70]=0.21,[256]=0.22,[257]=0.23,[258]=0.24,[259]=0.25,[260]=0.26,[261]=0.27,[262]=0.28,[263]=0.29,[264]=0.30,[265]=0.31,[71]=0.32,[72]=0.33,[73]=0.34,[266]=0.35,[267]=0.36}
local oTYNsnP={[0]="Death Strike",[250]="Death Strike",[251]="Frost Strike",[252]="Festering Strike",[577]="Chaos Strike",[581]="Shear",[102]="Solar Wrath",[103]="Shred",[104]="Mangle",[105]="Solar Wrath",[253]="Counter Shot",[254]="Counter Shot",[255]="Mongoose Bite",[62]="Arcane Blast",[63]="Fireball",[64]="Frostbolt",[268]="Blackout Strike",[269]="Rising Sun Kick",[270]="Rising Sun Kick",[65]="Crusader Strike",[66]="Shield of the Righteous",[70]="Crusader Strike",[256]="Penance",[257]="Smite",[258]="Mind Blast",[259]="Mutilate",[260]="Saber Slash",[261]="Backstab",[262]="Lightning Bolt",[263]="Rockbiter",[264]="Lightning Bolt",[265]="Agony",[71]="Mortal Strike",[72]="Bloodthirst",[73]="Devastate",[266]="Doom",[267]="Incinerate"}local I;local LmR5gwW={}local DfbW={}local sh={}local rrFLbCtj={}local YcPea0vg={}local usLpLoaH={}local e7dv={}local inx0={}
local A5k5yt={}local B7SHDx7h=0;local EEpoeR=GetSpecialization()local _k=0;local Ef={}local KfM={}local Vd={}
local Oynw={}local QBO={}local s4ggux={}local hrVI4meU={}local xEq6TAF={}local UIjls={}local jdLnB0vD=nil;local PSlD=nil;local nN={}local J=nil
local A=nil;local g3Qeqnr={}local qHpY64=nil;local z=nil;local qccJ5b=nil;local ARuba=nil;local Wo53nZ=nil;local XRfQ={}local gFPRdEC={}
local lw9gLt3={}local TI5={}local JmE={}local s4={}local FFG={}local a31jEAS={}local LS4h=0;local eux092_P=0;local ZA9=0;local hWgmxm=0;local UBg54E=0
local gQGq=nil;local OyHc5FEv=1;local Dn1Xi={}local _gGmBBE={}local rIX4={}local AI14eFhp,iW2O,Gdp=UnitClass("player")
local nbqmx=0;local IWQcC=0;local cvRh={}local W9yaJm=LibStub("LibRangeCheck-2.0")
PlayerIsInCombat=false;local oJ1ec=GetCurrentResolution()
local LMMNWLk=select(oJ1ec,GetScreenResolutions())local x6Ni,Q2waXkyp=strsplit("x",LMMNWLk,2)
local EG72=GetScreenWidth()/x6Ni;parent=CreateFrame("frame","Recount",UIParent)
parent:SetSize(40,25)parent:SetPoint("TOPLEFT",0,0)
parent:SetScale(EG72)parent:RegisterEvent("ADDON_LOADED")
parent:RegisterEvent("NAME_PLATE_UNIT_ADDED")parent:RegisterEvent("PLAYER_ENTERING_WORLD")
parent:RegisterEvent("PLAYER_REGEN_DISABLED")parent:RegisterEvent("PLAYER_REGEN_ENABLED")
parent:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")parent.t=parent:CreateTexture()
parent.t:SetColorTexture(0,0,0,1)parent.t:SetAllPoints(parent)
parent:SetFrameStrata("TOOLTIP")local function mlTMZ(XuqjvYPF,Trh)return
(("%%.%df"):format(Trh)):format(XuqjvYPF)end
local function q(K)if
UnitIsDead(K)or UnitIsGhost(K)then return 0 end
local uK=UnitHealth(K)local s0FU=UnitHealthMax(K)local wQl=ceil((uK/s0FU)*100)local g=
"0.0"..wQl;if(wQl>=10)then g="0."..wQl end
val=tonumber(g)if wQl==100 then val=1 end;return val end
local function xb6()
_k=EEpoeR and
select(1,GetSpecializationInfo(GetSpecialization()))or 0;F2tY=0;local m4u=oTYNsnP[_k]
for StZ,C1NqzxY in pairs(rb21L2)do
if C1NqzxY~=nil then
if
(









_k==581 or _k==70 or _k==261 or _k==269 or _k==263 or _k==71 or _k==72 or _k==73 or _k==103 or _k==104 or _k==66 or _k==259 or _k==250 or _k==251 or _k==252 or _k==255 or _k==268 or _k==270)then local T1gVrYq,P5G=W9yaJm:GetRange(StZ)if P5G==nil then P5G=100 end;local JC=8
if(_k==
261 or _k==250 or _k==259)then JC=10 end
if UnitCanAttack("player",StZ)and P5G<=JC and
UnitIsDead(StZ)==false then F2tY=F2tY+1 end else if UnitCanAttack("player",StZ)and
LibStub("SpellRange-1.0").IsSpellInRange(m4u,StZ)==1 and
UnitIsDead(StZ)==false then
F2tY=F2tY+1 end end end end;F2tY=F2tY/100
o_v255.t:SetColorTexture(1,F2tY,K3ipRr,OyHc5FEv)end
local function yK(PDA)local K=false
for qne5Stra,FKLmmhnQ in pairs(rb21L2)do rb21L2[qne5Stra]=nil end
for F82=1,30 do
if UnitGUID("nameplate"..F82)~=nil and not
UnitIsPlayer("nameplate"..F82)then
for wJ6tY_,TNg in pairs(rb21L2)do if TNg==UnitGUID("nameplate"..
F82)then K=true end end;if K==false then
rb21L2["nameplate"..F82]=UnitGUID("nameplate"..F82)K=false end end;K=false end end
local function rHLz2GD(wO9T,QMcSUqdi,...)if QMcSUqdi=="PLAYER_REGEN_ENABLED"then PlayerIsInCombat=false
unitCombatFrame.t:SetColorTexture(1,1,1,OyHc5FEv)end;if
QMcSUqdi=="PLAYER_REGEN_DISABLED"then PlayerIsInCombat=true
unitCombatFrame.t:SetColorTexture(1,0,0,OyHc5FEv)end end
local function BlW0RhJA(sKy2P9i)under=math.floor(sKy2P9i)
upper=math.floor(sKy2P9i)+1;underV=- (under-sKy2P9i)upperV=upper-sKy2P9i;if
(upperV>underV)then return under else return upper end end
local function Uy()EEpoeR=GetSpecialization()
_k=EEpoeR and
select(1,GetSpecializationInfo(EEpoeR))or 0;local S={}AllSeven=false
for AD=1,GetMaxTalentTier()do talenetSelected=false
for AkxLdb66=1,3 do
local aUR=select(4,GetTalentInfo(AD,AkxLdb66,1))
if(aUR==true)then S[AD]=AkxLdb66/100;talenetSelected=true end
if talenetSelected==false and AkxLdb66 ==3 then S[AD]=0 end end;if AD==7 then AllSeven=true end end
if not AllSeven then for c4=GetMaxTalentTier(),7 do S[c4]=0 end end
_gGmBBE[1].t:SetColorTexture(S[1],S[2],S[3],OyHc5FEv)
_gGmBBE[2].t:SetColorTexture(S[4],S[5],S[6],OyHc5FEv)
_gGmBBE[3].t:SetColorTexture(S[7],wUVm[select(2,UnitRace("player"))],0,OyHc5FEv)
_gGmBBE[4].t:SetColorTexture(VQ[_k],0,0,OyHc5FEv)end
local function n()if not UnitExists("target")then return end
for ZNXs3Bwd,Ginn in pairs(PlayerBuffs)do
local h_pK=GetSpellInfo(Ginn)
local L,ZNXs3Bwd,ZNXs3Bwd,ZNXs3Bwd,ZNXs3Bwd,ZNXs3Bwd,vBKFXR3,ZNXs3Bwd,ZNXs3Bwd,ZNXs3Bwd,FP3j=UnitBuff("target",h_pK,nil,"PLAYER")
if(L==h_pK)then
local fe=vBKFXR3-GetTime()-select(4,GetNetStats())/1000;fe=mlTMZ(fe,1)local ggnA,KaD2ExEO=strsplit(".",fe)
local TpiFT=tonumber(ggnA)/100;local JCH=tonumber(KaD2ExEO)/100
if(TpiFT>1)then TpiFT=1 end;if vBKFXR3 ==0 then TpiFT=1 end
s4[Ginn].t:SetColorTexture(1,TpiFT,JCH,OyHc5FEv)s4[Ginn].t:SetAllPoints(false)else
s4[Ginn].t:SetColorTexture(0,1,1,OyHc5FEv)s4[Ginn].t:SetAllPoints(false)end end end
local function TKu()local sJ05I=0;if Gdp==2 then
sJ05I=UnitPower("player",SPELL_POWER_HOLY_POWER)end;if Gdp==9 then
sJ05I=UnitPower("player",SPELL_POWER_SOUL_SHARDS)end;if Gdp==8 then
sJ05I=UnitPower("player",SPELL_POWER_ARCANE_CHARGES)end;if Gdp==4 then
sJ05I=UnitPower("player",SPELL_POWER_COMBO_POINTS)end;if Gdp==11 then
sJ05I=UnitPower("player",SPELL_POWER_COMBO_POINTS)end
if Gdp==6 then
local HrLCim=UnitPower("player",SPELL_POWER_RUNES)local w=6;local sUu7z=1;for sUu7z=1,HrLCim do
local M5oB=select(3,GetRuneCooldown(sUu7z))if not M5oB then w=w-1 end end
sJ05I=w end
if Gdp==10 then sJ05I=UnitPower("player",SPELL_POWER_CHI)end;if sJ05I~=UBg54E then
unitPowerFrame.t:SetColorTexture(0,sJ05I/100,0,OyHc5FEv)unitPowerFrame.t:SetAllPoints(false)
UBg54E=sJ05I end end;local M6kL=nil
local function M7o_(xIyIKo,f2x)local Nwl=UnitExists("pet")
if
(Nwl==false or UnitIsDead("pet"))then if(Nwl~=M6kL)then
Wo53nZ.t:SetColorTexture(1,1,1,OyHc5FEv)M6kL=Nwl end else if Nwl~=M6kL and
not UnitIsDead("player")then
Wo53nZ.t:SetColorTexture(1,0,0,OyHc5FEv)M6kL=Nwl end end end;function IsHealer()
if
_k==270 or _k==65 or _k==257 or _k==256 or _k==264 or _k==105 then return true else return false end end
function IsMelee()
if









_k==250 or _k==
251 or _k==252 or _k==577 or _k==581 or _k==103 or _k==104 or _k==255 or _k==268 or _k==269 or _k==66 or _k==70 or
_k==259 or
_k==260 or _k==261 or _k==263 or _k==71 or _k==72 or _k==73 then return true else return false end end
local function dk2X7J7(Xpt_SQ,Y)
for SMa,Bo in pairs(SpellCooldowns)do local zF6ZPjQ,nNQG3,SMa=GetSpellCooldown(Bo)
local yW=(zF6ZPjQ+nNQG3-
GetTime()-select(4,GetNetStats())/1000)if yW<0 then yW=0 end;local efGM8UMy=GetSpellInfo(Bo)
local KhH,H4tXd=IsUsableSpell(efGM8UMy)
if yW~=0 then yW=mlTMZ(yW,1)local Nq6If,II=strsplit(".",yW)
local Y_tefq=tonumber(Nq6If)/100;local i=tonumber(II)/100
rrFLbCtj[Bo].t:SetColorTexture(0,Y_tefq,i,OyHc5FEv)rrFLbCtj[Bo].t:SetAllPoints(false)else if(H4tXd and
IsHealer())then
rrFLbCtj[Bo].t:SetColorTexture(0,1,1,OyHc5FEv)else
rrFLbCtj[Bo].t:SetColorTexture(1,1,1,OyHc5FEv)end
rrFLbCtj[Bo].t:SetAllPoints(false)end end end
local function jv(a3u,nzhB)
for sTxVGmb,GSIcq in pairs(InventoryItems)do local Go,DGf,sTxVGmb=GetItemCooldown(GSIcq)local kgRX7X=Go+DGf-
GetTime()local JB=0;if kgRX7X<0 then kgRX7X=0 end;local GGJhclKa=0;if
IsEquippedItem(GSIcq)then GGJhclKa=1 else GGJhclKa=0 end
local KWahIz=GetItemCount(GSIcq)/100;if KWahIz>=100 then JB=1 end;if kgRX7X==0 or JB==0 then
FFG[GSIcq].t:SetColorTexture(0,GGJhclKa,JB,OyHc5FEv)else
FFG[GSIcq].t:SetColorTexture(1,GGJhclKa,JB,OyHc5FEv)end end end
local function MW(X2kyW,pVlvW)
for QcKn_,jiM in pairs(SpellCooldowns)do charges,QcKn_,QcKn_,QcKn_=GetSpellCharges(jiM)if
(jiM==
205406 or jiM==115072 or jiM==101546)then charges=GetSpellCount(jiM)end;if(
gFPRdEC[jiM]~=charges)then
YcPea0vg[jiM].t:SetColorTexture(0,charges/100,0,OyHc5FEv)YcPea0vg[jiM].t:SetAllPoints(false)
gFPRdEC[jiM]=charges end end end
local function E2OQ(YUdA,lx3cpJ)
for Yx9,Mn in pairs(PlayerBuffs)do local ut0=GetSpellInfo(Mn)if(ut0 ==nil)then print(
'Unable to find aura (Buff) with Id: '..Mn)
return end
local ZFhlP6eg,Yx9,Yx9,ExUgDG,Yx9,jc4o42jz,jc,Yx9,Yx9,Yx9,Ojz_=UnitBuff("player",ut0)
if(Mn==120694)and UnitBuff("player",ut0)then local x=0
for oJ1ec=1,40 do
local ZFhlP6eg,Yx9,Yx9,Yx9,Yx9,Yx9,Yx9,Yx9,Yx9,Yx9,Ojz_,Yx9,Yx9,Yx9,Yx9,Yx9=UnitBuff("player",oJ1ec)if Ojz_==120694 then x=x+1 end end;ExUgDG=x end
if(ZFhlP6eg==ut0)then local Xtecl=GetTime()
remainingTime=mlTMZ(jc-Xtecl,1)
if tonumber(remainingTime)<tonumber("0")then remainingTime="0.0"end;local KVcYU,_=strsplit(".",remainingTime)
local C=tonumber(KVcYU)/100;local CJeG=tonumber(_)/100;if ExUgDG==0 then
usLpLoaH[Mn].t:SetColorTexture(1,1,1,OyHc5FEv)else
usLpLoaH[Mn].t:SetColorTexture(ExUgDG/100,C,CJeG,OyHc5FEv)end else
usLpLoaH[Mn].t:SetColorTexture(1,1,1,OyHc5FEv)end end end
local function SnbfLb6(F43eMG,mCzjh4)
for lU,epQue9 in pairs(PlayerDebuffs)do local cHUJrj=GetSpellInfo(epQue9)
if cHUJrj==nil then if(JmE[epQue9]~=
"DebuffOff")then
s4ggux[epQue9].t:SetColorTexture(1,1,1,OyHc5FEv)s4ggux[epQue9].t:SetAllPoints(false)
JmE[epQue9]="DebuffOff"end
return end
local EI0x,lU,lU,E,lU,lacOdjf9,R2h4lP4l,lU,lU,lU,Fh,lU,lU,lU,lU,lU=UnitDebuff("target",cHUJrj,nil,"PLAYER|HARMFUL")
if epQue9 ==233490 and(EI0x==cHUJrj)then local a2e9fa=0
for oJ1ec=1,40 do
name2,lU,lU,count2,lU,lacOdjf9,expirationTime2,lU,lU,lU,spellId2,lU,lU,lU,lU,lU=UnitDebuff("target",oJ1ec,"PLAYER|HARMFUL")
if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then a2e9fa=a2e9fa+1 end end;E=a2e9fa end
if(EI0x==cHUJrj)then local Rc9_ZID=GetTime()
remainingTime=mlTMZ(R2h4lP4l-Rc9_ZID,1)
if
(JmE[epQue9]~="DebuffOn"..E..remainingTime)then local H1HF2wD6,hBph=strsplit(".",remainingTime)
local bxNo9h=tonumber(H1HF2wD6)/100;local Khst=tonumber(hBph)/100;if Fh==34914 then end;s4ggux[epQue9].t:SetColorTexture(
E/100,bxNo9h,Khst,OyHc5FEv)JmE[epQue9]=
"DebuffOn"..E..remainingTime end else
if(JmE[epQue9]~="DebuffOff")then
s4ggux[epQue9].t:SetColorTexture(1,1,1,OyHc5FEv)JmE[epQue9]="DebuffOff"end end end end;local ay={}
local function W(pUT,ISg1)
for Gh5UJya,k in pairs(SpellCooldowns)do local Z8Ue=0
local TXbmx,Gh5UJya,Gh5UJya,Gh5UJya,Gh5UJya,Gh5UJya=GetSpellInfo(k)if(TXbmx==nil)then Z8Ue=0 else
Z8Ue=LibStub("SpellRange-1.0").IsSpellInRange(k,"target")end
if ay[k]~=Z8Ue then if(Z8Ue==1)then
hrVI4meU[k].t:SetColorTexture(1,0,0,OyHc5FEv)else
hrVI4meU[k].t:SetColorTexture(1,1,1,OyHc5FEv)end
hrVI4meU[k].t:SetAllPoints(false)ay[k]=Z8Ue end end end
local function WzM()
if GetUnitSpeed("Player")==0 then Movetime=GetTime()
PlayerMovingFrame.t:SetColorTexture(1,1,1,OyHc5FEv)else
PlayerMovingFrame.t:SetColorTexture(1,0,0,OyHc5FEv)end end
local function WzM()mountedplayer=0;moveTime=1;if IsMounted()then mountedplayer=.5 end;if
GetUnitSpeed("Player")==0 then moveTime=0 end
PlayerMovingFrame.t:SetColorTexture(moveTime,mountedplayer,1,OyHc5FEv)end
local function PSx()if IsCurrentSpell(6603)then
AutoAtackingFrame.t:SetColorTexture(1,0,0,OyHc5FEv)else
AutoAtackingFrame.t:SetColorTexture(1,1,1,OyHc5FEv)end end
local function IwnA()
if UnitGUID("target")==UnitGUID("player")then
targetIsPlayerFrame.t:SetColorTexture(1,0,0,OyHc5FEv)else
targetIsPlayerFrame.t:SetColorTexture(1,1,1,OyHc5FEv)end end
local function cW()if IsOutdoors()then sh.t:SetColorTexture(1,0,0,OyHc5FEv)else
sh.t:SetColorTexture(1,1,1,OyHc5FEv)end end;local PHpCof2=0
local function bUPpn4T2(r,Pqgz415t)local McNxKV=UnitLevel("player")local WcwGYJh=0;local gJt=0;local hCs8M=0
local GkjCn_mq="0.0"..McNxKV;if(McNxKV>=10)then GkjCn_mq="0."..McNxKV end
gJt=tonumber(GkjCn_mq)
if(McNxKV>100)then gJt=0;McNxKV=McNxKV-100;local ELb="0.0"..McNxKV;if
(McNxKV>=10)then ELb="0."..McNxKV end;hCs8M=tonumber(ELb)end;local T9sySp=UnitHealth("player")
local DL0mMXM=UnitHealthMax("player")local o4Kvi75g=ceil((T9sySp/DL0mMXM)*100)
if
UnitIsDead("player")or UnitIsGhost("player")then o4Kvi75g=0 end
if(o4Kvi75g~=PHpCof2)then local FV5="0.0"..o4Kvi75g;if(o4Kvi75g>=10)then FV5="0."..
o4Kvi75g end;WcwGYJh=tonumber(FV5)
if
(o4Kvi75g==100)then if(McNxKV==100)then
jdLnB0vD.t:SetColorTexture(1,1,0,OyHc5FEv)else
jdLnB0vD.t:SetColorTexture(1,gJt,hCs8M,OyHc5FEv)end else
jdLnB0vD.t:SetColorTexture(WcwGYJh,gJt,hCs8M,OyHc5FEv)end;PHpCof2=o4Kvi75g end end;local sode=0
local function G9zkKODk(sX,DH6mUlGB)local A4ZRczp=UnitHealth("pet")local rUT=UnitHealthMax("pet")if
rUT==nil then rUT=1 end;if rUT==0 then rUT=1 end
local g=ceil((A4ZRczp/rUT)*100)
if(sode~=g)then local JPi=0;local Kkl6fa="0.0"..g;if(g>=10)then Kkl6fa="0."..g end
JPi=tonumber(Kkl6fa)if(g==100)then
petHealthFrame.t:SetColorTexture(1,0,0,OyHc5FEv)else
petHealthFrame.t:SetColorTexture(JPi,0,0,OyHc5FEv)end;sode=g end end;local MGt=0
local function ld9GuG4t(t,H)local glZrOuSo=UnitGUID("target")local Zdzaj=0;local UxRGyO9e=100;local fvj_L=0
if
(glZrOuSo~=nil)then Zdzaj=UnitHealth("target")
UxRGyO9e=UnitHealthMax("target")fvj_L=ceil((Zdzaj/UxRGyO9e)*100)end
if(fvj_L~=MGt)then local _CPU89l=0;local U="0.0"..fvj_L
if(fvj_L>=10)then U="0."..fvj_L end;_CPU89l=tonumber(U)if(fvj_L==100)then
targetHealthFrame.t:SetColorTexture(1,0,0,OyHc5FEv)else
targetHealthFrame.t:SetColorTexture(_CPU89l,0,0,OyHc5FEv)end
MGt=fvj_L end end
local function KpCCA(Kwxn,yp5DGSwX)local Sb1Mw7R=UnitPower("player")local fuF=UnitPowerMax("player")
if(Sb1Mw7R~=
B7SHDx7h)then B7SHDx7h=Sb1Mw7R
if
(


(Gdp==7 and _k==264)or(Gdp==2)or(Gdp==5)or(Gdp==8)or(Gdp==9)or(Gdp==10 and _k==270)or(
Gdp==11 and _k==102)or(Gdp==11 and _k==105))then Sb1Mw7R=ceil((Sb1Mw7R/fuF)*100)end;local pA2=0;local M5lAedm=0;local _uYRl2kj="0.0"..Sb1Mw7R;if(Sb1Mw7R>=10)then
_uYRl2kj="0."..Sb1Mw7R end;pA2=tonumber(_uYRl2kj)
if(Sb1Mw7R>100)then pA2=0;Sb1Mw7R=
Sb1Mw7R-100;local tbN="0.0"..Sb1Mw7R;if(Sb1Mw7R>=10)then
tbN="0."..Sb1Mw7R end;M5lAedm=tonumber(tbN)end;if(Sb1Mw7R==100)then
powerFrame.t:SetColorTexture(1,0,0,OyHc5FEv)else
powerFrame.t:SetColorTexture(pA2,M5lAedm,0,OyHc5FEv)end end end;local H6=0
local function hgsKvTz()local x=math.floor(GetHaste())local m=0
if lasthaste==x then return end;lastehaste=x;local VVQ=0;if x==math.abs(x)then VVQ=1 else VVQ=0 end;if
(x>=100)then m=math.floor(x/100)x=x- (m*100)end;local Jb=math.abs(
tonumber(strsub(tostring(x),1,2))/100)
qHpY64.t:SetColorTexture(VVQ,m,Jb,OyHc5FEv)end;local zEt=true
local function Wjojpvg(qcpea,tjDBv)isFriend=UnitIsFriend("player","target")
if
(isFriend~=zEt)then if(isFriend==true)then J.t:SetColorTexture(0,1,0,OyHc5FEv)else
J.t:SetColorTexture(0,0,1,OyHc5FEv)end;zEt=isFriend end end;local l2PqbWw=""
local function EJTH9()local vmn7v=UnitGUID("target")
local Au1mzs=LibStub("LibBossIDs-1.0")local u39i=UnitIsDead("target")local Fdg7p=UnitLevel("player")
if
(vmn7v~=l2PqbWw)then
if vmn7v==nil then A.t:SetColorTexture(0,0,0,OyHc5FEv)else
if vmn7v~=nil then
local GD3AP,jph00k,jph00k,jph00k,jph00k,wE_4o=strsplit(" - ",UnitGUID("target"))
if Au1mzs.BossIDs[tonumber(wE_4o)]then
A.t:SetColorTexture(0,0,1,OyHc5FEv)elseif GD3AP=="Player"then A.t:SetColorTexture(1,0,0,OyHc5FEv)elseif not
Au1mzs.BossIDs[tonumber(wE_4o)]then
if wE_4o~=nil then
if


tonumber(wE_4o)==114631 or
tonumber(wE_4o)==114822 or tonumber(wE_4o)==90463 or tonumber(wE_4o)==90418 or tonumber(wE_4o)==90431 then A.t:SetColorTexture(0,0,0,OyHc5FEv)else
A.t:SetColorTexture(1,0,0,OyHc5FEv)end end elseif(vmn7v~=nil and u39i==true)then
A.t:SetColorTexture(0,0,0,OyHc5FEv)end end end;l2PqbWw=vmn7v end end;local qTB82=0;local KL=""
local function EATFLbgY(F,bUO1NvT)spell,_,_,_,_,_,_,castID,_=UnitCastingInfo("player")
name,_,text,_,_,_,_,_=UnitChannelInfo("player")
if castID~=nil then if castID~=qTB82 then z.t:SetColorTexture(1,0,0,OyHc5FEv)
qTB82=castID end else if castID~=qTB82 then
z.t:SetColorTexture(1,1,1,OyHc5FEv)qTB82=castID end end
if name~=nil then
if text~=KL then z.t:SetColorTexture(0,1,0,OyHc5FEv)KL=text end else
if text~=KL then z.t:SetColorTexture(1,1,1,OyHc5FEv)KL=text end end end;local function FF(K,RQG)return
math.abs(RQG-GetTime()*1000)/math.abs(RQG-K)end
local function rh(tVwI_N,Jkp2lGXG)
spell,_,_,_,startTime,endTime,_,_,notInterrupt=UnitCastingInfo("target")if(spell==nil)then
spell,_,_,_,startTime,endTime,_,notInterrupt=UnitChannelInfo("target")end
if spell~=nil then
if notInterrupt==false then
qccJ5b.t:SetColorTexture(1,FF(startTime,endTime),1,OyHc5FEv)else
qccJ5b.t:SetColorTexture(0,FF(startTime,endTime),1,OyHc5FEv)end else
if spell==nil then qccJ5b.t:SetColorTexture(0,0,0,OyHc5FEv)end end end;local function YcCR()wilds=tonumber("0.0"..nbqmx)
dreadstalkers=tonumber("0.0"..IWQcC)
PSlD.t:SetColorTexture(wilds,0,dreadstalkers,OyHc5FEv)end
local G3p2Yn=nil
local function _jkkD9(ifcyuS,V03W)local R=UnitIsVisible("target")
if R==nil then if(R~=G3p2Yn)then
ARuba.t:SetColorTexture(1,1,1,OyHc5FEv)G3p2Yn=R end else if R~=G3p2Yn then
ARuba.t:SetColorTexture(1,0,0,OyHc5FEv)G3p2Yn=R end end end
local function D(X6_,tN5u,...)if(tN5u=="UNIT_SPELLCAST_SUCCEEDED")then
UpdateCastingFrame("player",A5k5yt,...)end end;local function DMn()UpdateCastingFrame("target",KfM)end;local function GBzFRjVV()
UpdateCastingFrame("arena1",Vd)end;local function pG4C8fDK()
UpdateCastingFrame("arena2",Oynw)end;local function LLFUU()
UpdateCastingFrame("arena3",QBO)end
local function kdmQtj6(Yqc0GWr,UC7)
for WbvvcjER,rOLxXC in pairs(PlayerBuffs)do
local w762p7sZ=GetSpellInfo(rOLxXC)
if w762p7sZ==nil then if(TI5[rOLxXC]~="BuffOff")then
inx0[rOLxXC].t:SetColorTexture(1,1,1,OyHc5FEv)inx0[rOLxXC].t:SetAllPoints(false)
TI5[rOLxXC]="BuffOff"end;return end
local _7jt,WbvvcjER,WbvvcjER,ORXyFQ,WbvvcjER,WbvvcjER,OL1oV,WbvvcjER,WbvvcjER,WbvvcjER,WbvvcjER=UnitBuff("pet",w762p7sZ)
if(_7jt==w762p7sZ)then local Q=GetTime()
remainingTime=mlTMZ(OL1oV-Q,1)
if
(TI5[rOLxXC]~="BuffOn"..ORXyFQ..remainingTime)then local HQvT5,dN=strsplit(".",remainingTime)
local B35igHj=tonumber(HQvT5)/100;local o8pPC2=tonumber(dN)/100
inx0[rOLxXC].t:SetColorTexture(ORXyFQ/100,B35igHj,o8pPC2,OyHc5FEv)inx0[rOLxXC].t:SetAllPoints(false)end else if(TI5[rOLxXC]~="BuffOff")then
inx0[rOLxXC].t:SetColorTexture(1,1,1,OyHc5FEv)inx0[rOLxXC].t:SetAllPoints(false)
TI5[rOLxXC]="BuffOff"end end end end
local function Hc35_(f7nUIW,bDgD)
for Kg8PhSq,Tcv_ in pairs(PlayerDebuffs)do local lygY="UnitDebuff"local HG=GetSpellInfo(Tcv_)
if HG==nil then if(
Ef[Tcv_]~="DebuffOff")then
e7dv[Tcv_].t:SetColorTexture(1,1,1,OyHc5FEv)e7dv[Tcv_].t:SetAllPoints(false)
Ef[Tcv_]="DebuffOff"end;return end
local u,Kg8PhSq,Kg8PhSq,m9i,Kg8PhSq,Kg8PhSq,EqPMP,Kg8PhSq,Kg8PhSq,Kg8PhSq,JR,Kg8PhSq,Kg8PhSq,Kg8PhSq,Kg8PhSq,Kg8PhSq=UnitDebuff("player",HG,nil,"PLAYER|HARMFUL")
if(u==HG)then local G1Cl6=GetTime()
local h=math.floor(EqPMP-G1Cl6+0.5)
if(Ef[Tcv_]~="DebuffOn"..m9i..h)then
Ef[Tcv_]="DebuffOn"..m9i..h;h=string.format("%00.2f",tostring(h))local fYUikw=
tonumber(strsub(tostring(h),1,2))/100;local W9qTCm=
tonumber(strsub(tostring(h),-2,-1))/100
e7dv[Tcv_].t:SetColorTexture(
m9i/100,fYUikw,W9qTCm,OyHc5FEv)e7dv[Tcv_].t:SetAllPoints(false)end else if(Ef[Tcv_]~="DebuffOff")then
e7dv[Tcv_].t:SetColorTexture(1,1,1,OyHc5FEv)e7dv[Tcv_].t:SetAllPoints(false)
Ef[Tcv_]="DebuffOff"end end end end
local function ubP(YlaSjEKp,u_ogp8)
for K,ob in pairs(SpellCooldowns)do
if IsSpellOverlayed(ob)then
Dn1Xi[ob].t:SetColorTexture(1,0,0,OyHc5FEv)Dn1Xi[ob].t:SetAllPoints(false)else
Dn1Xi[ob].t:SetColorTexture(1,1,1,OyHc5FEv)Dn1Xi[ob].t:SetAllPoints(false)end end end
local function eN0UMW(a3)
for MvWxr,HgY6 in pairs(DispelThese)do local Wc=GetSpellInfo(HgY6)if Wc==nil then return 0 end
local eQ5,MvWxr,MvWxr,kvR,MvWxr,So,Wi,MvWxr,MvWxr,MvWxr,HgY6,MvWxr,MvWxr,MvWxr,MvWxr,MvWxr=UnitDebuff(a3,Wc,
nil,"HARMFUL")if(eQ5 ==Wc)then return 1 end end;return 0 end
local function lAG()if IsHealer()==false then return end
local X1WM,OVBAVy=IsActiveBattlefieldArena()local Jos=IsInRaid()and"raid"or"party"
local NF0=GetNumGroupMembers()local OeF="0.0"..NF0;if(NF0 >=10)then OeF="0."..NF0 end
if
(IsInRaid())then
inGame.t:SetColorTexture(tonumber(OeF),1,1,OyHc5FEv)else if X1WM==1 then
inGame.t:SetColorTexture(tonumber(OeF),1,0.5,OyHc5FEv)else
inGame.t:SetColorTexture(tonumber(OeF),1,0,OyHc5FEv)end end
if(NF0 ==0)then health=UnitHealth("player")
maxHealth=UnitHealthMax("player")
percHealth=ceil((health/maxHealth)*100)needToDispel=eN0UMW("player")local sawaLtSr="0.0"..percHealth;if
(percHealth>=10)then sawaLtSr="0."..percHealth end
red=tonumber(sawaLtSr)
for KWeL=1,5 do if(percHealth==100)then
rIX4[KWeL].t:SetColorTexture(1,needToDispel,0,OyHc5FEv)else
rIX4[KWeL].t:SetColorTexture(red,needToDispel,0,OyHc5FEv)end end;return end
for K=1,NF0 do local rvhod9t=0;local bfx5oN=0
if(Jos=="party")then
if(K==1)then
health=UnitHealth("player")maxHealth=UnitHealthMax("player")
rvhod9t=ceil((health/maxHealth)*100)bfx5oN=eN0UMW("player")else
health=UnitHealth(Jos.. (K-1))maxHealth=UnitHealthMax(Jos.. (K-1))rvhod9t=ceil(
(health/maxHealth)*100)
bfx5oN=eN0UMW(Jos.. (K-1))local RyTb,ImqF1v=W9yaJm:GetRange(Jos.. (K-1))if
(ImqF1v==nil)then ImqF1v=41 end;local KRu=GetSpellInfo(243961)
if



UnitIsDead(Jos.. (K-1))or UnitIsGhost(Jos.. (K-1))or
UnitIsConnected(Jos.. (K-1))==false or UnitInPhase(Jos..
(K-1))==false or ImqF1v>40 or UnitDebuff(Jos.. (K-1),KRu)then rvhod9t=100;bfx5oN=0 end end end
if(Jos=="raid")then health=UnitHealth(Jos..K)
maxHealth=UnitHealthMax(Jos..K)rvhod9t=ceil((health/maxHealth)*100)bfx5oN=eN0UMW(
Jos..K)local Vy5qF,rokDhenZ=W9yaJm:GetRange(Jos..K)if(
rokDhenZ==nil)then rokDhenZ=41 end
local td8OL=GetSpellInfo(243961)
if UnitIsDead(Jos..K)or UnitIsGhost(Jos..K)or
UnitIsConnected(Jos..K)==false or UnitInPhase(Jos..K)==
false or
rokDhenZ>40 or
UnitDebuff(Jos..K,td8OL)then
rvhod9t=100;bfx5oN=0 end end;local XDKTNXw="0.0"..rvhod9t
if(rvhod9t>=10)then XDKTNXw="0."..rvhod9t end;red=tonumber(XDKTNXw)if(rvhod9t==100)then
rIX4[K].t:SetColorTexture(1,bfx5oN,0,OyHc5FEv)else
rIX4[K].t:SetColorTexture(red,bfx5oN,0,OyHc5FEv)end
rIX4[K].t:SetAllPoints(false)end end;inGame=CreateFrame("frame","",parent)
inGame:SetSize(1,1)inGame:SetPoint("TOPLEFT",30,0)
inGame.t=inGame:CreateTexture()inGame.t:SetColorTexture(0,1,0,OyHc5FEv)
inGame.t:SetAllPoints(inGame)inGame:Show()
startStopFrame=CreateFrame("frame","",parent)startStopFrame:SetSize(1,1)
startStopFrame:SetPoint("TOPLEFT",29,0)startStopFrame.t=startStopFrame:CreateTexture()
startStopFrame.t:SetColorTexture(0,0,0,OyHc5FEv)
startStopFrame.t:SetAllPoints(startStopFrame)startStopFrame:Show()
rangeToTargetFrame=CreateFrame("frame","",parent)rangeToTargetFrame:SetSize(1,1)
rangeToTargetFrame:SetPoint("TOPLEFT",28,0)
rangeToTargetFrame.t=rangeToTargetFrame:CreateTexture()
rangeToTargetFrame.t:SetColorTexture(0,0,0,OyHc5FEv)
rangeToTargetFrame.t:SetAllPoints(rangeToTargetFrame)rangeToTargetFrame:Show()local function AvEtR8Y()lAG()end
local function rl3MMqfm()
local WCS,i=W9yaJm:GetRange("target")if i==nil then i=100 end;local WCS,v2VylMn=W9yaJm:GetRange("pet")if
v2VylMn==nil then v2VylMn=100 end;local Oi="0.0"..v2VylMn;if(v2VylMn>=10)then Oi="0."..
v2VylMn end;green=tonumber(Oi)
local KwcrRu="0.0"..i;if(i>=10)then KwcrRu="0."..i end;red=tonumber(KwcrRu)if
(v2VylMn>=100)then green=1 end;if(i>=100)then red=1 end;blue=0;if
(UnitExists("Focus"))then blue=1 end
rangeToTargetFrame.t:SetColorTexture(red,green,blue,OyHc5FEv)end;function UpdateHealthFrame(bgFJ,fqGD1rfW)local K0=q(bgFJ)
fqGD1rfW.t:SetColorTexture(K0,0,0,OyHc5FEv)end
function UpdateDebuffFrame(_1To2,lkzs)
for Hhwf3oO,Oh5 in
pairs(PlayerDebuffs)do local LgQF=GetSpellInfo(Oh5)if LgQF==nil then
LmR5gwW[Oh5].t:SetColorTexture(0,0,0,OyHc5FEv)return end
local emGbhJGH,Hhwf3oO,Hhwf3oO,e_Ev8OQ,Hhwf3oO,zBMvU6,ZmbDgbg,Hhwf3oO,Hhwf3oO,Hhwf3oO,hMxy,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO=UnitDebuff(_1To2,LgQF,nil,"PLAYER|HARMFUL")
if Oh5 ==233490 and(emGbhJGH==LgQF)then local hj3=0
for oJ1ec=1,40 do
Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,spellId2,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO,Hhwf3oO=UnitDebuff(_1To2,oJ1ec,"PLAYER|HARMFUL")if

spellId2 ==233490 or spellId2 ==233496 or spellId2 ==233497 or spellId2 ==233498 or spellId2 ==233499 then hj3=hj3+1 end end;e_Ev8OQ=hj3 end
if(emGbhJGH==LgQF)then local M7q3pa8=GetTime()
remainingTime=mlTMZ(ZmbDgbg-M7q3pa8,1)local guEhw,sll=strsplit(".",remainingTime)
local BzNBgGvD=tonumber(guEhw)/100;local KIQCH=tonumber(sll)/100
lkzs[Oh5].t:SetColorTexture(1,BzNBgGvD,KIQCH,OyHc5FEv)else
lkzs[Oh5].t:SetColorTexture(0,0,0,OyHc5FEv)end end end
function UpdateCastingFrame(L4bw,XhBEPD,...)if not UnitExists(L4bw)then return end
local Uq=select(10,UnitCastingInfo(L4bw))if Uq==nil then local S1qoVmFR,S1qoVmFR,S1qoVmFR,S1qoVmFR,f2=...Uq=f2 end
if
Uq==nil then for O3rHR=1,2 do
XhBEPD[O3rHR].t:SetColorTexture(0,0,0,OyHc5FEv)end;return end;local RmyiI_D=""local w_2iiJwx=""local RRESd=""
for YU80=1,2 do
if(YU80 ==1)then strRedTemp=strsub(Uq,1,1)if
(strRedTemp=="")then RmyiI_D=1 else RmyiI_D="0."..strRedTemp end
strGreenTemp=strsub(Uq,2,2)
if(strGreenTemp=="")then RRESd=1 else RRESd="0."..strGreenTemp end;strBlueTemp=strsub(Uq,3,3)if(strBlueTemp=="")then w_2iiJwx=1 else
w_2iiJwx="0."..strBlueTemp end end
if(YU80 ==2)then strRedTemp=strsub(Uq,4,4)if(strRedTemp=="")then RmyiI_D=1 else RmyiI_D=
"0."..strRedTemp end
strGreenTemp=strsub(Uq,5,5)
if(strGreenTemp=="")then RRESd=1 else RRESd="0."..strGreenTemp end;strBlueTemp=strsub(Uq,6,6)if(strBlueTemp=="")then w_2iiJwx=1 else
w_2iiJwx="0."..strBlueTemp end end;local ARnO_0E=tonumber(RmyiI_D)local Qh=tonumber(RRESd)
local lqxbMC=tonumber(w_2iiJwx)
XhBEPD[YU80].t:SetColorTexture(ARnO_0E,Qh,lqxbMC,OyHc5FEv)end end
function FocusPulse()UpdateHealthFrame("focus",I)
UpdateDebuffFrame("focus",LmR5gwW)UpdateCastingFrame("focus",DfbW)end;local nQj=0;function update(qOk5Jm,tpSe2fs)nQj=nQj+tpSe2fs
if nQj>=0.2 then rl3MMqfm()AvEtR8Y()if
(UnitExists("Focus"))then FocusPulse()end;nQj=0 end end
local function Eq8jDq()
local AuVgc7=0;jdLnB0vD=CreateFrame("frame","",parent)
jdLnB0vD:SetSize(1,1)jdLnB0vD:SetPoint("TOPLEFT",0,0)
jdLnB0vD.t=jdLnB0vD:CreateTexture()jdLnB0vD.t:SetColorTexture(1,1,1,OyHc5FEv)
jdLnB0vD.t:SetAllPoints(jdLnB0vD)jdLnB0vD:Show()
jdLnB0vD:RegisterEvent("PLAYER_ENTERING_WORLD")jdLnB0vD:RegisterEvent("PLAYER_REGEN_ENABLED")
jdLnB0vD:RegisterEvent("PLAYER_REGEN_DISABLED")
jdLnB0vD:RegisterUnitEvent("UNIT_HEALTH","player")jdLnB0vD:RegisterEvent("PLAYER_TARGET_CHANGED")
jdLnB0vD:SetScript("OnEvent",bUPpn4T2)powerFrame=CreateFrame("frame","",parent)
powerFrame:SetSize(1,1)powerFrame:SetPoint("TOPLEFT",1,0)
powerFrame.t=powerFrame:CreateTexture()powerFrame.t:SetColorTexture(1,1,1,OyHc5FEv)
powerFrame.t:SetAllPoints(powerFrame)powerFrame:Show()
powerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
powerFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
powerFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
powerFrame:RegisterUnitEvent("UNIT_POWER","player")powerFrame:SetScript("OnEvent",KpCCA)
targetHealthFrame=CreateFrame("frame","",parent)targetHealthFrame:SetSize(1,1)
targetHealthFrame:SetPoint("TOPLEFT",2,0)
targetHealthFrame.t=targetHealthFrame:CreateTexture()
targetHealthFrame.t:SetColorTexture(1,1,1,OyHc5FEv)
targetHealthFrame.t:SetAllPoints(targetHealthFrame)targetHealthFrame:Show()
targetHealthFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
targetHealthFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
targetHealthFrame:RegisterEvent("UNIT_HEALTH","target")
targetHealthFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
targetHealthFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
targetHealthFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")
targetHealthFrame:SetScript("OnEvent",ld9GuG4t)unitCombatFrame=CreateFrame("frame","",parent)
unitCombatFrame:SetSize(1,1)unitCombatFrame:SetPoint("TOPLEFT",3,0)
unitCombatFrame.t=unitCombatFrame:CreateTexture()
unitCombatFrame.t:SetColorTexture(1,1,1,OyHc5FEv)
unitCombatFrame.t:SetAllPoints(unitCombatFrame)unitCombatFrame:Show()
unitCombatFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
unitCombatFrame:RegisterEvent("PLAYER_REGEN_DISABLED")unitCombatFrame:SetScript("OnEvent",rHLz2GD)
unitPowerFrame=CreateFrame("frame","",parent)unitPowerFrame:SetSize(1,1)
unitPowerFrame:SetPoint("TOPLEFT",4,0)unitPowerFrame.t=unitPowerFrame:CreateTexture()
unitPowerFrame.t:SetColorTexture(0,0,0,OyHc5FEv)
unitPowerFrame.t:SetAllPoints(unitPowerFrame)unitPowerFrame:Show()
unitPowerFrame:SetScript("OnUpdate",TKu)J=CreateFrame("frame","",parent)J:SetSize(1,1)
J:SetPoint("TOPLEFT",5,0)J.t=J:CreateTexture()
J.t:SetColorTexture(0,1,0,OyHc5FEv)J.t:SetAllPoints(J)J:Show()
J:RegisterEvent("PLAYER_REGEN_ENABLED")J:RegisterEvent("PLAYER_REGEN_DISABLED")
J:RegisterEvent("UNIT_HEALTH","target")J:RegisterEvent("PLAYER_TARGET_CHANGED")
J:RegisterEvent("PLAYER_ENTER_COMBAT")J:RegisterEvent("PLAYER_LEAVE_COMBAT")
J:SetScript("OnEvent",Wjojpvg)A=CreateFrame("frame","",parent)A:SetSize(1,1)
A:SetPoint("TOPLEFT",6,0)A.t=A:CreateTexture()
A.t:SetColorTexture(0,1,0,OyHc5FEv)A.t:SetAllPoints(A)A:Show()
A:RegisterEvent("PLAYER_TARGET_CHANGED")A:RegisterEvent("PLAYER_ENTER_COMBAT")
A:RegisterEvent("PLAYER_LEAVE_COMBAT")A:SetScript("OnEvent",EJTH9)
z=CreateFrame("frame","",parent)z:SetSize(1,1)z:SetPoint("TOPLEFT",7,0)
z.t=z:CreateTexture()z.t:SetColorTexture(1,1,1,OyHc5FEv)
z.t:SetAllPoints(z)z:Show()z:SetScript("OnUpdate",EATFLbgY)
qccJ5b=CreateFrame("frame","",parent)qccJ5b:SetSize(1,1)
qccJ5b:SetPoint("TOPLEFT",8,0)qccJ5b.t=qccJ5b:CreateTexture()
qccJ5b.t:SetColorTexture(1,1,1,OyHc5FEv)qccJ5b.t:SetAllPoints(qccJ5b)qccJ5b:Show()
qccJ5b:SetScript("OnUpdate",rh)qHpY64=CreateFrame("frame","",parent)
qHpY64:SetSize(1,1)qHpY64:SetPoint("TOPLEFT",9,0)
qHpY64.t=qHpY64:CreateTexture()qHpY64.t:SetColorTexture(1,1,1,OyHc5FEv)
qHpY64.t:SetAllPoints(qHpY64)qHpY64:Show()
qHpY64:RegisterEvent("PLAYER_ENTERING_WORLD")
qHpY64:RegisterUnitEvent("UNIT_SPELL_HASTE","player")qHpY64:SetScript("OnUpdate",hgsKvTz)
ARuba=CreateFrame("frame","",parent)ARuba:SetSize(1,1)ARuba:SetPoint("TOPLEFT",10,0)
ARuba.t=ARuba:CreateTexture()ARuba.t:SetColorTexture(0,1,0,OyHc5FEv)
ARuba.t:SetAllPoints(ARuba)ARuba:Show()ARuba:SetScript("OnUpdate",_jkkD9)
if
(
Gdp==6 or Gdp==3 or Gdp==9 or Gdp==8 or Gdp==7)then Wo53nZ=CreateFrame("frame","",parent)
Wo53nZ:SetSize(1,1)Wo53nZ:SetPoint("TOPLEFT",11,0)
Wo53nZ.t=Wo53nZ:CreateTexture()Wo53nZ.t:SetColorTexture(0,1,0,OyHc5FEv)
Wo53nZ.t:SetAllPoints(Wo53nZ)Wo53nZ:Show()Wo53nZ:SetScript("OnUpdate",M7o_)
petHealthFrame=CreateFrame("frame","",parent)petHealthFrame:SetSize(1,1)
petHealthFrame:SetPoint("TOPLEFT",12,0)petHealthFrame.t=petHealthFrame:CreateTexture()
petHealthFrame.t:SetColorTexture(1,1,1,OyHc5FEv)
petHealthFrame.t:SetAllPoints(petHealthFrame)petHealthFrame:Show()
petHealthFrame:RegisterEvent("UNIT_HEALTH","pet")petHealthFrame:SetScript("OnEvent",G9zkKODk)
PSlD=CreateFrame("frame","",parent)PSlD:SetSize(1,1)PSlD:SetPoint("TOPLEFT",13,0)
PSlD.t=PSlD:CreateTexture()PSlD.t:SetColorTexture(0,1,0,OyHc5FEv)
PSlD.t:SetAllPoints(PSlD)PSlD:Show()PSlD:SetScript("OnUpdate",YcCR)local AuVgc7=0
for vxnB,ZQOXXXd in
pairs(PlayerBuffs)do inx0[ZQOXXXd]=CreateFrame("frame","",parent)
inx0[ZQOXXXd]:SetSize(1,1)inx0[ZQOXXXd]:SetPoint("TOPLEFT",AuVgc7,-9)
inx0[ZQOXXXd].t=inx0[ZQOXXXd]:CreateTexture()
inx0[ZQOXXXd].t:SetColorTexture(1,1,1,OyHc5FEv)
inx0[ZQOXXXd].t:SetAllPoints(inx0[ZQOXXXd])inx0[ZQOXXXd]:Show()AuVgc7=AuVgc7+1 end
inx0[table.maxn(inx0)]:SetScript("OnUpdate",kdmQtj6)end;AuVgc7=0
for cyBmTv,_TKd0F in pairs(SpellCooldowns)do
rrFLbCtj[_TKd0F]=CreateFrame("frame","",parent)rrFLbCtj[_TKd0F]:SetSize(1,1)rrFLbCtj[_TKd0F]:SetPoint("TOPLEFT",AuVgc7,
-1)
rrFLbCtj[_TKd0F].t=rrFLbCtj[_TKd0F]:CreateTexture()
rrFLbCtj[_TKd0F].t:SetColorTexture(1,1,1,OyHc5FEv)
rrFLbCtj[_TKd0F].t:SetAllPoints(rrFLbCtj[_TKd0F])rrFLbCtj[_TKd0F]:Show()AuVgc7=AuVgc7+1 end
rrFLbCtj[table.maxn(rrFLbCtj)]:SetScript("OnUpdate",dk2X7J7)AuVgc7=0
for Z,Dw in pairs(SpellCooldowns)do
hrVI4meU[Dw]=CreateFrame("frame","",parent)hrVI4meU[Dw]:SetSize(1,1)hrVI4meU[Dw]:SetPoint("TOPLEFT",AuVgc7,
-2)
hrVI4meU[Dw].t=hrVI4meU[Dw]:CreateTexture()
hrVI4meU[Dw].t:SetColorTexture(1,1,1,OyHc5FEv)
hrVI4meU[Dw].t:SetAllPoints(hrVI4meU[Dw])hrVI4meU[Dw]:Show()AuVgc7=AuVgc7+1 end
hrVI4meU[table.maxn(hrVI4meU)]:SetScript("OnUpdate",W)AuVgc7=0
for bsFpM,h in pairs(PlayerDebuffs)do
s4ggux[h]=CreateFrame("frame","",parent)s4ggux[h]:SetSize(1,1)
s4ggux[h]:SetPoint("TOPLEFT",AuVgc7,-3)s4ggux[h].t=s4ggux[h]:CreateTexture()
s4ggux[h].t:SetColorTexture(1,1,1,OyHc5FEv)s4ggux[h].t:SetAllPoints(s4ggux[h])
s4ggux[h]:Show()AuVgc7=AuVgc7+1 end
s4ggux[table.maxn(s4ggux)]:SetScript("OnUpdate",SnbfLb6)AuVgc7=0
for doBTofya,rNP in pairs(SpellCooldowns)do
YcPea0vg[rNP]=CreateFrame("frame","",parent)YcPea0vg[rNP]:SetSize(1,1)YcPea0vg[rNP]:SetPoint("TOPLEFT",AuVgc7,
-4)
YcPea0vg[rNP].t=YcPea0vg[rNP]:CreateTexture()
YcPea0vg[rNP].t:SetColorTexture(1,1,1,OyHc5FEv)
YcPea0vg[rNP].t:SetAllPoints(YcPea0vg[rNP])YcPea0vg[rNP]:Show()AuVgc7=AuVgc7+1 end
YcPea0vg[table.maxn(YcPea0vg)]:RegisterEvent("ACTIONBAR_UPDATE_STATE")
YcPea0vg[table.maxn(YcPea0vg)]:SetScript("OnEvent",MW)AuVgc7=0
for TL,Tzgj_W in pairs(PlayerBuffs)do
s4[Tzgj_W]=CreateFrame("frame","",parent)s4[Tzgj_W]:SetSize(1,1)
s4[Tzgj_W]:SetPoint("TOPLEFT",AuVgc7,-5)s4[Tzgj_W].t=s4[Tzgj_W]:CreateTexture()
s4[Tzgj_W].t:SetColorTexture(0,1,1,OyHc5FEv)s4[Tzgj_W].t:SetAllPoints(s4[Tzgj_W])
s4[Tzgj_W]:Show()AuVgc7=AuVgc7+1 end
s4[table.maxn(s4)]:SetScript("OnUpdate",n)PlayerMovingFrame=CreateFrame("frame","",parent)
PlayerMovingFrame:SetSize(1,1)PlayerMovingFrame:SetPoint("TOPLEFT",0,-6)
PlayerMovingFrame.t=PlayerMovingFrame:CreateTexture()
PlayerMovingFrame.t:SetColorTexture(1,1,1,OyHc5FEv)
PlayerMovingFrame.t:SetAllPoints(PlayerMovingFrame)PlayerMovingFrame:Show()
PlayerMovingFrame:SetScript("OnUpdate",WzM)AutoAtackingFrame=CreateFrame("frame","",parent)
AutoAtackingFrame:SetSize(1,1)AutoAtackingFrame:SetPoint("TOPLEFT",1,-6)
AutoAtackingFrame.t=AutoAtackingFrame:CreateTexture()
AutoAtackingFrame.t:SetColorTexture(1,1,1,OyHc5FEv)
AutoAtackingFrame.t:SetAllPoints(AutoAtackingFrame)AutoAtackingFrame:Show()
AutoAtackingFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
AutoAtackingFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
AutoAtackingFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")AutoAtackingFrame:SetScript("OnEvent",PSx)
targetIsPlayerFrame=CreateFrame("frame","",parent)targetIsPlayerFrame:SetSize(1,1)targetIsPlayerFrame:SetPoint("TOPLEFT",2,
-6)
targetIsPlayerFrame.t=targetIsPlayerFrame:CreateTexture()
targetIsPlayerFrame.t:SetColorTexture(1,1,1,OyHc5FEv)
targetIsPlayerFrame.t:SetAllPoints(targetIsPlayerFrame)targetIsPlayerFrame:Show()
targetIsPlayerFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
targetIsPlayerFrame:SetScript("OnEvent",IwnA)sh=CreateFrame("frame","",parent)sh:SetSize(1,1)sh:SetPoint("TOPLEFT",3,
-6)sh.t=sh:CreateTexture()
sh.t:SetColorTexture(1,1,1,OyHc5FEv)sh.t:SetAllPoints(sh)sh:Show()
sh:SetScript("OnUpdate",cW)end
function GetKeyBinding(g0AS39)local t2
if g0AS39 <=24 or g0AS39 >72 then t2="ACTIONBUTTON".. (
((g0AS39-1)%12)+1)elseif g0AS39 <=36 then t2=
"MULTIACTIONBAR3BUTTON".. (g0AS39-24)elseif g0AS39 <=48 then t2=
"MULTIACTIONBAR4BUTTON".. (g0AS39-36)elseif g0AS39 <=60 then t2=
"MULTIACTIONBAR2BUTTON".. (g0AS39-48)else t2="MULTIACTIONBAR1BUTTON"..
(g0AS39-60)end;local PDewNmM=t2 and GetBindingKey(t2)
if
PDewNmM and strlen(PDewNmM)>4 then PDewNmM=strupper(PDewNmM)PDewNmM=gsub(PDewNmM,"%s+","")
PDewNmM=gsub(PDewNmM,"ALT%-","A|")PDewNmM=gsub(PDewNmM,"CTRL%-","C|")
PDewNmM=gsub(PDewNmM,"SHIFT%-","S|")PDewNmM=gsub(PDewNmM,"NUMPAD","N")
PDewNmM=gsub(PDewNmM,"PLUS","+")PDewNmM=gsub(PDewNmM,"MINUS","-")
PDewNmM=gsub(PDewNmM,"MULTIPLY","*")PDewNmM=gsub(PDewNmM,"DIVIDE","/")end
if PDewNmM~=nil then else
if Bartender4 then
t2="CLICK BT4Button"..g0AS39 ..":LeftButton"PDewNmM=t2 and GetBindingKey(t2)
if
PDewNmM and strlen(PDewNmM)>4 then PDewNmM=strupper(PDewNmM)PDewNmM=gsub(PDewNmM,"%s+","")
PDewNmM=gsub(PDewNmM,"ALT%-","A|")PDewNmM=gsub(PDewNmM,"CTRL%-","C|")
PDewNmM=gsub(PDewNmM,"SHIFT%-","S|")PDewNmM=gsub(PDewNmM,"NUMPAD","N")
PDewNmM=gsub(PDewNmM,"PLUS","+")PDewNmM=gsub(PDewNmM,"MINUS","-")
PDewNmM=gsub(PDewNmM,"MULTIPLY","*")PDewNmM=gsub(PDewNmM,"DIVIDE","/")end end end;return PDewNmM end
function KeyModifierColor(GFlD)local y3owm5E=strfind(GFlD,"|")
if(y3owm5E~=nil)then
local psHOEe2=strsub(GFlD,1,y3owm5E-1)if(psHOEe2 =="S")then return 0.01 end
if(psHOEe2 =="C")then return 0.02 end;if(psHOEe2 =="A")then return 0.03 end end;return 1 end
function KeyBindColor(R1zT)local J2Df=strfind(R1zT,"|")if(J2Df~=nil)then
R1zT=strsub(R1zT,J2Df+1)end
if R1zT=="\\"then return 0.01 elseif R1zT=="["then return 0.02 elseif R1zT=="]"then return 0.03 elseif
R1zT==";"then return 0.04 elseif R1zT=="'"then return 0.05 elseif R1zT==","then return 0.06 elseif R1zT=="."then return 0.07 elseif R1zT=="/"then return 0.08 elseif
R1zT=="`"then return 0.09 elseif R1zT=="-"then return 0.10 elseif R1zT=="="then return 0.11 elseif R1zT=="F1"then return 0.12 elseif R1zT=="F2"then return 0.13 elseif R1zT==
"F3"then return 0.14 elseif R1zT=="F4"then return 0.15 elseif R1zT=="F5"then return 0.16 elseif R1zT=="F6"then return 0.17 elseif R1zT=="F7"then
return 0.18 elseif R1zT=="F8"then return 0.19 elseif R1zT=="F9"then return 0.20 elseif R1zT=="F10"then return 0.21 elseif R1zT=="F11"then return 0.22 elseif
R1zT=="F12"then return 0.23 elseif R1zT=="1"then return 0.24 elseif R1zT=="2"then return 0.25 elseif R1zT=="3"then return 0.26 elseif R1zT=="4"then return 0.27 elseif
R1zT=="5"then return 0.28 elseif R1zT=="6"then return 0.29 elseif R1zT=="7"then return 0.30 elseif R1zT=="8"then return 0.31 elseif R1zT=="9"then return 0.32 elseif
R1zT=="0"then return 0.33 elseif R1zT=="Q"then return 0.34 elseif R1zT=="W"then return 0.35 elseif R1zT=="E"then return 0.36 elseif R1zT=="R"then return 0.37 elseif
R1zT=="T"then return 0.38 elseif R1zT=="Y"then return 0.39 elseif R1zT=="U"then return 0.40 elseif R1zT=="I"then return 0.41 elseif R1zT=="O"then return 0.42 elseif
R1zT=="P"then return 0.43 elseif R1zT=="A"then return 0.44 elseif R1zT=="S"then return 0.45 elseif R1zT=="D"then return 0.46 elseif R1zT=="F"then return 0.47 elseif
R1zT=="G"then return 0.48 elseif R1zT=="H"then return 0.49 elseif R1zT=="J"then return 0.50 elseif R1zT=="K"then return 0.51 elseif R1zT=="L"then return 0.52 elseif
R1zT=="Z"then return 0.53 elseif R1zT=="X"then return 0.54 elseif R1zT=="C"then return 0.55 elseif R1zT=="V"then return 0.56 elseif R1zT=="B"then return 0.57 elseif
R1zT=="N"then return 0.58 elseif R1zT=="M"then return 0.59 elseif R1zT=="N1"then return 0.60 elseif R1zT=="N2"then return 0.61 elseif R1zT=="N3"then return 0.62 elseif R1zT==
"N4"then return 0.63 elseif R1zT=="N5"then return 0.64 elseif R1zT=="N6"then return 0.65 elseif R1zT=="N7"then return 0.66 elseif R1zT=="N8"then
return 0.67 elseif R1zT=="N9"then return 0.68 elseif R1zT=="N0"then return 0.69 end;return 1 end;function fixSlots(YyS)if(YyS<10)then return'00'..YyS end
if(YyS>=10)then return'0'..YyS end;return''..YyS end
printKeybinds=0
function RefreshKeyBinds()if(printKeybinds==1)then ChatFrame1:Clear()if Bartender4 then
print('Bartender4 detected')end end
for o,MY16y in
pairs(SpellCooldowns)do local ZBUghmX=GetSpellInfo(MY16y)bindFound=false
for ncK=1,120 do
local Deq,GH3wE,xZFv=GetActionInfo(ncK)
if Deq=="spell"then local bc0w4j=GetKeyBinding(ncK)
if bc0w4j~=nil then
if(MY16y==GH3wE)then
cvRh[MY16y].t:SetColorTexture(KeyBindColor(bc0w4j),KeyModifierColor(bc0w4j),0,OyHc5FEv)
if(printKeybinds==1)then
print('Slot: '..
fixSlots(ncK)..' '..
GetSpellLink(MY16y)..','..

KeyBindColor(bc0w4j)..','..KeyModifierColor(bc0w4j)..','..bc0w4j)end;bindFound=true;break end end end
if Deq=="macro"then actionText=GetActionText(ncK)
name,rank,id=GetMacroSpell(actionText)local OGMxal0=GetKeyBinding(ncK)
if OGMxal0 ~=nil then
if(MY16y==id)then
cvRh[MY16y].t:SetColorTexture(KeyBindColor(OGMxal0),KeyModifierColor(OGMxal0),0,OyHc5FEv)
if(printKeybinds==1)then
print('Slot: '..
fixSlots(ncK)..' '..
GetSpellLink(MY16y)..','..
KeyBindColor(OGMxal0)..
','..KeyModifierColor(OGMxal0)..','..OGMxal0)end;bindFound=true;break end end end end
if bindFound==false and(printKeybinds==1)then if
(GetSpellLink(MY16y))~=nil then
print(GetSpellLink(MY16y)..',not bound')else
print('Spell Id: '..MY16y..',NOT FOUND')end end end;printKeybinds=0 end
local function LnQUN()i=0
for yI,EDE3 in pairs(SpellCooldowns)do
cvRh[EDE3]=CreateFrame("frame","",parent)cvRh[EDE3]:SetSize(1,1)
cvRh[EDE3]:SetPoint("TOPLEFT",i,-14)cvRh[EDE3].t=cvRh[EDE3]:CreateTexture()
cvRh[EDE3].t:SetColorTexture(0,0,0,OyHc5FEv)cvRh[EDE3].t:SetAllPoints(cvRh[EDE3])
cvRh[EDE3]:Show()i=i+1 end
cvRh[table.maxn(cvRh)]:RegisterEvent("SPELL_PUSHED_TO_ACTIONBAR")
cvRh[table.maxn(cvRh)]:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
cvRh[table.maxn(cvRh)]:RegisterEvent("SPELLS_CHANGED")
cvRh[table.maxn(cvRh)]:RegisterEvent("PLAYER_ENTERING_WORLD")
cvRh[table.maxn(cvRh)]:RegisterEvent("UNIT_MODEL_CHANGED")
cvRh[table.maxn(cvRh)]:SetScript("OnEvent",RefreshKeyBinds)local QlewVjkq=0
for QlewVjkq=1,2 do
A5k5yt[QlewVjkq]=CreateFrame("FRAME","",parent)A5k5yt[QlewVjkq]:SetSize(1,1)A5k5yt[QlewVjkq]:SetPoint("TOPLEFT",(
QlewVjkq+3),-6)
A5k5yt[QlewVjkq].t=A5k5yt[QlewVjkq]:CreateTexture()
A5k5yt[QlewVjkq].t:SetColorTexture(0,0,0,OyHc5FEv)
A5k5yt[QlewVjkq].t:SetAllPoints(A5k5yt[QlewVjkq])A5k5yt[QlewVjkq]:Show()end
A5k5yt[table.maxn(A5k5yt)]:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
A5k5yt[table.maxn(A5k5yt)]:SetScript("OnEvent",D)
for QlewVjkq=1,2 do KfM[QlewVjkq]=CreateFrame("FRAME","",parent)
KfM[QlewVjkq]:SetSize(1,1)
KfM[QlewVjkq]:SetPoint("TOPLEFT",(QlewVjkq+5),-6)
KfM[QlewVjkq].t=KfM[QlewVjkq]:CreateTexture()
KfM[QlewVjkq].t:SetColorTexture(0,0,0,OyHc5FEv)
KfM[QlewVjkq].t:SetAllPoints(KfM[QlewVjkq])KfM[QlewVjkq]:Show()end
KfM[table.maxn(KfM)]:SetScript("OnUpdate",DMn)
for QlewVjkq=1,2 do Vd[QlewVjkq]=CreateFrame("FRAME","",parent)
Vd[QlewVjkq]:SetSize(1,1)
Vd[QlewVjkq]:SetPoint("TOPLEFT",(QlewVjkq+7),-6)
Vd[QlewVjkq].t=Vd[QlewVjkq]:CreateTexture()
Vd[QlewVjkq].t:SetColorTexture(0,0,0,OyHc5FEv)
Vd[QlewVjkq].t:SetAllPoints(Vd[QlewVjkq])Vd[QlewVjkq]:Show()end
Vd[table.maxn(Vd)]:SetScript("OnUpdate",GBzFRjVV)
for QlewVjkq=1,2 do Oynw[QlewVjkq]=CreateFrame("FRAME","",parent)
Oynw[QlewVjkq]:SetSize(1,1)
Oynw[QlewVjkq]:SetPoint("TOPLEFT",(QlewVjkq+9),-6)
Oynw[QlewVjkq].t=Oynw[QlewVjkq]:CreateTexture()
Oynw[QlewVjkq].t:SetColorTexture(0,0,0,OyHc5FEv)
Oynw[QlewVjkq].t:SetAllPoints(Oynw[QlewVjkq])Oynw[QlewVjkq]:Show()end
Oynw[table.maxn(Oynw)]:SetScript("OnUpdate",pG4C8fDK)
for QlewVjkq=1,2 do QBO[QlewVjkq]=CreateFrame("FRAME","",parent)
QBO[QlewVjkq]:SetSize(1,1)
QBO[QlewVjkq]:SetPoint("TOPLEFT",(QlewVjkq+11),-6)
QBO[QlewVjkq].t=QBO[QlewVjkq]:CreateTexture()
QBO[QlewVjkq].t:SetColorTexture(0,0,0,OyHc5FEv)
QBO[QlewVjkq].t:SetAllPoints(QBO[QlewVjkq])QBO[QlewVjkq]:Show()end
QBO[table.maxn(QBO)]:SetScript("OnUpdate",LLFUU)QlewVjkq=0
for FpWG11U,kRY46C in pairs(PlayerBuffs)do
usLpLoaH[kRY46C]=CreateFrame("frame","",parent)usLpLoaH[kRY46C]:SetSize(1,1)usLpLoaH[kRY46C]:SetPoint("TOPLEFT",QlewVjkq,
-7)
usLpLoaH[kRY46C].t=usLpLoaH[kRY46C]:CreateTexture()
usLpLoaH[kRY46C].t:SetColorTexture(1,1,1,OyHc5FEv)
usLpLoaH[kRY46C].t:SetAllPoints(usLpLoaH[kRY46C])usLpLoaH[kRY46C]:Show()QlewVjkq=QlewVjkq+1 end
usLpLoaH[table.maxn(usLpLoaH)]:SetScript("OnUpdate",E2OQ)QlewVjkq=0
for MvOaiq,DUic_1K in pairs(InventoryItems)do
FFG[DUic_1K]=CreateFrame("frame","",parent)FFG[DUic_1K]:SetSize(1,1)FFG[DUic_1K]:SetPoint("TOPLEFT",QlewVjkq,
-8)
FFG[DUic_1K].t=FFG[DUic_1K]:CreateTexture()
FFG[DUic_1K].t:SetColorTexture(1,1,1,OyHc5FEv)
FFG[DUic_1K].t:SetAllPoints(FFG[DUic_1K])FFG[DUic_1K]:Show()QlewVjkq=QlewVjkq+1 end;if(table.getn(InventoryItems)~=0)then
FFG[table.maxn(FFG)]:SetScript("OnUpdate",jv)end;QlewVjkq=0
for rVj9z4,mWkmCx in pairs(PlayerDebuffs)do
e7dv[mWkmCx]=CreateFrame("frame","",parent)e7dv[mWkmCx]:SetSize(1,1)e7dv[mWkmCx]:SetPoint("TOPLEFT",QlewVjkq,
-10)
e7dv[mWkmCx].t=e7dv[mWkmCx]:CreateTexture()
e7dv[mWkmCx].t:SetColorTexture(1,1,1,OyHc5FEv)
e7dv[mWkmCx].t:SetAllPoints(e7dv[mWkmCx])e7dv[mWkmCx]:Show()
e7dv[mWkmCx]:SetScript("OnUpdate",Hc35_)QlewVjkq=QlewVjkq+1 end
e7dv[table.maxn(e7dv)]:SetScript("OnUpdate",Hc35_)QlewVjkq=0
for qQpo,qXKzBXo0 in pairs(SpellCooldowns)do
Dn1Xi[qXKzBXo0]=CreateFrame("frame","",parent)Dn1Xi[qXKzBXo0]:SetSize(1,1)Dn1Xi[qXKzBXo0]:SetPoint("TOPLEFT",QlewVjkq,
-11)
Dn1Xi[qXKzBXo0].t=Dn1Xi[qXKzBXo0]:CreateTexture()
Dn1Xi[qXKzBXo0].t:SetColorTexture(1,1,1,OyHc5FEv)
Dn1Xi[qXKzBXo0].t:SetAllPoints(Dn1Xi[qXKzBXo0])Dn1Xi[qXKzBXo0]:Show()QlewVjkq=QlewVjkq+1 end;if(table.getn(SpellCooldowns)~=0)then
Dn1Xi[table.maxn(Dn1Xi)]:SetScript("OnUpdate",ubP)end
for QlewVjkq=1,4 do
_gGmBBE[QlewVjkq]=CreateFrame("frame","",parent)_gGmBBE[QlewVjkq]:SetSize(1,1)_gGmBBE[QlewVjkq]:SetPoint("TOPLEFT",(QlewVjkq),
-12)
_gGmBBE[QlewVjkq].t=_gGmBBE[QlewVjkq]:CreateTexture()
_gGmBBE[QlewVjkq].t:SetColorTexture(1,1,1,OyHc5FEv)
_gGmBBE[QlewVjkq].t:SetAllPoints(_gGmBBE[QlewVjkq])_gGmBBE[QlewVjkq]:Show()end
_gGmBBE[table.maxn(_gGmBBE)]:RegisterEvent("PLAYER_ENTERING_WORLD")
_gGmBBE[table.maxn(_gGmBBE)]:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
_gGmBBE[table.maxn(_gGmBBE)]:RegisterEvent("PLAYER_REGEN_DISABLED")
_gGmBBE[table.maxn(_gGmBBE)]:SetScript("OnEvent",Uy)o_v255=CreateFrame("frame","",parent)
o_v255:SetSize(1,1)o_v255:SetPoint("TOPLEFT",0,-22)
o_v255.t=o_v255:CreateTexture()o_v255.t:SetColorTexture(1,1,1,OyHc5FEv)
o_v255.t:SetAllPoints(o_v255)o_v255:Show()o_v255:SetScript("OnUpdate",xb6)local Q=
IsInRaid()and"raid"or"party"QlewVjkq=0
for cJ=1,30 do
rIX4[cJ]=CreateFrame("frame","",parent)rIX4[cJ]:SetSize(1,1)
rIX4[cJ]:SetPoint("TOPLEFT",QlewVjkq,-13)rIX4[cJ].t=rIX4[cJ]:CreateTexture()
rIX4[cJ].t:SetColorTexture(0,0,0,OyHc5FEv)rIX4[cJ].t:SetAllPoints(rIX4[cJ])
rIX4[cJ]:Show()QlewVjkq=QlewVjkq+1 end;I=CreateFrame("frame","",parent)I:SetSize(1,1)I:SetPoint("TOPLEFT",0,-
19)I.t=I:CreateTexture()
I.t:SetColorTexture(0,0,0,OyHc5FEv)I.t:SetAllPoints(I)I:Show()QlewVjkq=0
for HI4G3oH,ncWw in pairs(PlayerDebuffs)do
LmR5gwW[ncWw]=CreateFrame("frame","",parent)LmR5gwW[ncWw]:SetSize(1,1)LmR5gwW[ncWw]:SetPoint("TOPLEFT",QlewVjkq,
-20)
LmR5gwW[ncWw].t=LmR5gwW[ncWw]:CreateTexture()
LmR5gwW[ncWw].t:SetColorTexture(0,0,0,OyHc5FEv)
LmR5gwW[ncWw].t:SetAllPoints(LmR5gwW[ncWw])LmR5gwW[ncWw]:Show()QlewVjkq=QlewVjkq+1 end
for QlewVjkq=1,2 do DfbW[QlewVjkq]=CreateFrame("FRAME","",parent)
DfbW[QlewVjkq]:SetSize(1,1)
DfbW[QlewVjkq]:SetPoint("TOPLEFT",QlewVjkq,-19)
DfbW[QlewVjkq].t=DfbW[QlewVjkq]:CreateTexture()
DfbW[QlewVjkq].t:SetColorTexture(0,0,0,OyHc5FEv)
DfbW[QlewVjkq].t:SetAllPoints(DfbW[QlewVjkq])DfbW[QlewVjkq]:Show()end end;local function Gm1()nbqmx=0 end;local function Jp()IWQcC=0 end
local function NwBqNl3C(kdS,OS60,...)local dl=...
if OS60 =="ADDON_LOADED"then if(dl==
"[Frozen]")then Eq8jDq()LnQUN()end end
if OS60 =="NAME_PLATE_UNIT_ADDED"then yK(select(1,...))xb6()end
if OS60 =="PLAYER_ENTERING_WORLD"then nbqmx=0;IWQcC=0
EEpoeR=GetSpecialization()_k=
EEpoeR and select(1,GetSpecializationInfo(EEpoeR))or 0
if
GetCVar("nameplateShowEnemies")=="0"then SetCVar("nameplateShowEnemies","1")end;K3ipRr=1 end;if OS60 =="PLAYER_REGEN_DISABLED"then xb6()end;if
OS60 =="PLAYER_REGEN_ENABLED"then xb6()end
if OS60 =="COMBAT_LOG_EVENT_UNFILTERED"then
local b2UK,FC0yhp,lL30T,zt,Ofgm3g,z6WE21dc,rJg9H,sNyznm3W,UU,YBciOAz2,wJvNH=...
if zt==UnitGUID('player')then
if FC0yhp=="SPELL_SUMMON"then
local dOvZoN,dOvZoN,dOvZoN,dOvZoN,dOvZoN,dOvZoN,dOvZoN,IP01vP,dOvZoN=sNyznm3W:find('(%S+)-(%d+)-(%d+)-(%d+)-(%d+)-(%d+)-(%S+)')IP01vP=tonumber(IP01vP)if(IP01vP==55659)then nbqmx=nbqmx+1
C_Timer.After(12,Gm1)end;if(IP01vP==98035)then IWQcC=IWQcC+1
C_Timer.After(12,Jp)end;return end end end end;parent:SetScript("OnEvent",NwBqNl3C)
parent:SetScript("OnUpdate",update)