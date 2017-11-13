local wqU76o=0;local LB1Z=0;aoeOn=0.0;local N9L=0.8;local hDc_M=0.7;local qW0lRiD1=5;local iD1IUx=60
local JLCOx_ak=iD1IUx- (qW0lRiD1*2)local hPQ=20;local R1FIoQI=CreateFrame("frame","Overlay",UIParent)
R1FIoQI:SetPoint("TOP",UIParent,"TOP",300,0)R1FIoQI:SetMovable(true)
R1FIoQI:SetUserPlaced(true)R1FIoQI:EnableMouse(true)
R1FIoQI:RegisterForDrag("LeftButton")
R1FIoQI:SetScript("OnDragStart",R1FIoQI.StartMoving)
R1FIoQI:SetScript("OnDragStop",R1FIoQI.StopMovingOrSizing)R1FIoQI:SetSize(280,30)
R1FIoQI:SetFrameStrata("TOOLTIP")R1FIoQI.t=R1FIoQI:CreateTexture()
R1FIoQI.t:SetColorTexture(1,1,1,0.2)R1FIoQI.t:SetAllPoints(R1FIoQI)
button1=CreateFrame("Button",nil,R1FIoQI)button2=CreateFrame("Button",nil,R1FIoQI)
button3=CreateFrame("Button",nil,R1FIoQI)button4=CreateFrame("Button",nil,R1FIoQI)
button5=CreateFrame("Button",nil,R1FIoQI)
button1:SetPoint("TOPLEFT",R1FIoQI,"TOPLEFT",qW0lRiD1,-qW0lRiD1)button1:SetWidth(JLCOx_ak)
button1:SetHeight(hPQ)button1:SetText("On")font1=CreateFont("one")
font1:SetFont("Fonts\\FRIZQT__.TTF",12)font1:SetTextColor(1,1,1)
button1:SetNormalFontObject(font1)button1:SetHighlightFontObject(font1)
button1:SetFrameStrata("TOOLTIP")local NsoTwDs=button1:CreateTexture()
local HGli=button1:CreateTexture()local iy=button1:CreateTexture()
NsoTwDs:SetColorTexture(N9L,0,0,alphaColor)NsoTwDs:SetAllPoints()
button1:SetNormalTexture(NsoTwDs)HGli:SetColorTexture(0,0,0,0.5)
HGli:SetAllPoints()button1:SetHighlightTexture(HGli)
iy:SetColorTexture(0,0,0,0.5)iy:SetAllPoints()button1:SetPushedTexture(iy)
button1:RegisterForClicks("AnyUp")
function startStop()if wqU76o==1 then
NsoTwDs:SetColorTexture(N9L,0,0,alphaColor)wqU76o=0 else
NsoTwDs:SetColorTexture(0,hDc_M,0,alphaColor)wqU76o=1 end
startStopFrame.t:SetColorTexture(wqU76o,LB1Z,aoeOn,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button1:SetScript("OnClick",startStop)
button2:SetPoint("TOPLEFT",R1FIoQI,"TOPLEFT",
qW0lRiD1*2+JLCOx_ak,-qW0lRiD1)button2:SetWidth(JLCOx_ak)
button2:SetHeight(hPQ)button2:SetText("CDs")font2=CreateFont("two")
font2:SetFont("Fonts\\FRIZQT__.TTF",12)font2:SetTextColor(1,1,1)
button2:SetNormalFontObject(font2)button2:SetHighlightFontObject(font2)
button2:SetFrameStrata("TOOLTIP")local m6SCS0=button2:CreateTexture()
local NUhYw6R4=button2:CreateTexture()local Hv=button2:CreateTexture()
m6SCS0:SetColorTexture(N9L,0,0,alphaColor)m6SCS0:SetAllPoints()
button2:SetNormalTexture(m6SCS0)NUhYw6R4:SetColorTexture(0,0,0,0.5)
NUhYw6R4:SetAllPoints()button2:SetHighlightTexture(NUhYw6R4)
Hv:SetColorTexture(0,0,0,0.5)Hv:SetAllPoints()button2:SetPushedTexture(Hv)
button2:RegisterForClicks("AnyUp")
function cooldownOnOff()if LB1Z==1 then
m6SCS0:SetColorTexture(N9L,0,0,alphaColor)LB1Z=0 else m6SCS0:SetColorTexture(0,hDc_M,0,alphaColor)
LB1Z=1 end
startStopFrame.t:SetColorTexture(wqU76o,LB1Z,aoeOn,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button2:SetScript("OnClick",cooldownOnOff)
button5:SetPoint("TOPLEFT",R1FIoQI,"TOPLEFT",
qW0lRiD1*3+JLCOx_ak*2,-qW0lRiD1)button5:SetWidth(JLCOx_ak)
button5:SetHeight(hPQ)button5:SetText("1")font5=CreateFont("five")
font5:SetFont("Fonts\\FRIZQT__.TTF",12)font5:SetTextColor(1,1,1)
button5:SetNormalFontObject(font5)button5:SetHighlightFontObject(font5)
button5:SetFrameStrata("TOOLTIP")local Ch=button5:CreateTexture()
local urkh=button5:CreateTexture()local zhzpBSx=button5:CreateTexture()
Ch:SetColorTexture(N9L,0,0,alphaColor)Ch:SetAllPoints()button5:SetNormalTexture(Ch)
urkh:SetColorTexture(0,0,0,0.5)urkh:SetAllPoints()
button5:SetHighlightTexture(urkh)zhzpBSx:SetColorTexture(0,0,0,0.5)
zhzpBSx:SetAllPoints()button5:SetPushedTexture(zhzpBSx)
button5:RegisterForClicks("AnyUp")
function singleTargetOn()
if aoeOn==1 then button4:Click('LeftButton')end
if aoeOn==0.5 then button3:Click('LeftButton')end;if aoeOn==0 then Ch:SetColorTexture(N9L,0,0,alphaColor)else
Ch:SetColorTexture(0,hDc_M,0,alphaColor)aoeOn=0 end
startStopFrame.t:SetColorTexture(wqU76o,LB1Z,aoeOn,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button5:SetScript("OnClick",singleTargetOn)
button3:SetPoint("TOPLEFT",R1FIoQI,"TOPLEFT",
qW0lRiD1*4+JLCOx_ak*3,-qW0lRiD1)button3:SetWidth(JLCOx_ak)
button3:SetHeight(hPQ)button3:SetText("2+")font3=CreateFont("three")
font3:SetFont("Fonts\\FRIZQT__.TTF",12)font3:SetTextColor(1,1,1)
button3:SetNormalFontObject(font3)button3:SetHighlightFontObject(font3)
button3:SetFrameStrata("TOOLTIP")local rHSjalVy=button3:CreateTexture()
local TjhsnP=button3:CreateTexture()local t5jzEd9=button3:CreateTexture()
rHSjalVy:SetColorTexture(N9L,0,0,alphaColor)rHSjalVy:SetAllPoints()
button3:SetNormalTexture(rHSjalVy)TjhsnP:SetColorTexture(0,0,0,0.5)
TjhsnP:SetAllPoints()button3:SetHighlightTexture(TjhsnP)
t5jzEd9:SetColorTexture(0,0,0,0.5)t5jzEd9:SetAllPoints()
button3:SetPushedTexture(t5jzEd9)button3:RegisterForClicks("AnyUp")
function aoeOnOff()if aoeOn==1 then
button4:Click('LeftButton')end
if aoeOn==0 then button5:Click('LeftButton')end;if aoeOn==0.5 then
rHSjalVy:SetColorTexture(N9L,0,0,alphaColor)else rHSjalVy:SetColorTexture(0,hDc_M,0,alphaColor)
aoeOn=0.5 end
startStopFrame.t:SetColorTexture(wqU76o,LB1Z,aoeOn,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button3:SetScript("OnClick",aoeOnOff)
button4:SetPoint("TOPLEFT",R1FIoQI,"TOPLEFT",
qW0lRiD1*5+JLCOx_ak*4,-qW0lRiD1)button4:SetWidth(JLCOx_ak)
button4:SetHeight(hPQ)button4:SetText("4+")font4=CreateFont("four")
font4:SetFont("Fonts\\FRIZQT__.TTF",12)font4:SetTextColor(1,1,1)
button4:SetNormalFontObject(font4)button4:SetHighlightFontObject(font4)
button4:SetFrameStrata("TOOLTIP")local JZAU2=button4:CreateTexture()
local zPXTTg=button4:CreateTexture()local seMLr=button4:CreateTexture()
JZAU2:SetColorTexture(N9L,0,0,alphaColor)JZAU2:SetAllPoints()
button4:SetNormalTexture(JZAU2)zPXTTg:SetColorTexture(0,0,0,0.5)
zPXTTg:SetAllPoints()button4:SetHighlightTexture(zPXTTg)
seMLr:SetColorTexture(0,0,0,0.5)seMLr:SetAllPoints()
button4:SetPushedTexture(seMLr)button4:RegisterForClicks("AnyUp")
function aoe()if aoeOn==0.5 then
button3:Click('LeftButton')end
if aoeOn==0 then button5:Click('LeftButton')end;if aoeOn==1 then JZAU2:SetColorTexture(N9L,0,0,alphaColor)else
JZAU2:SetColorTexture(0,hDc_M,0,alphaColor)aoeOn=1 end
startStopFrame.t:SetColorTexture(wqU76o,LB1Z,aoeOn,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button4:SetScript("OnClick",aoe)