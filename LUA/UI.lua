local tczrIB=0;local a=0;local wqU76o=0.0;local LB1Z=0.8;local N9L=0.7;local hDc_M=5;local qW0lRiD1=60
local iD1IUx=qW0lRiD1- (hDc_M*2)local JLCOx_ak=20;local hPQ=CreateFrame("frame","Overlay",UIParent)
hPQ:SetPoint("TOP",UIParent,"TOP",300,0)hPQ:SetMovable(true)hPQ:SetUserPlaced(true)
hPQ:EnableMouse(true)hPQ:RegisterForDrag("LeftButton")
hPQ:SetScript("OnDragStart",hPQ.StartMoving)
hPQ:SetScript("OnDragStop",hPQ.StopMovingOrSizing)hPQ:SetSize(280,30)hPQ:SetFrameStrata("TOOLTIP")
hPQ.t=hPQ:CreateTexture()hPQ.t:SetColorTexture(1,1,1,0.2)
hPQ.t:SetAllPoints(hPQ)button1=CreateFrame("Button",nil,hPQ)
button2=CreateFrame("Button",nil,hPQ)button3=CreateFrame("Button",nil,hPQ)
button4=CreateFrame("Button",nil,hPQ)
button1:SetPoint("TOPLEFT",hPQ,"TOPLEFT",hDc_M,-hDc_M)button1:SetWidth(iD1IUx)
button1:SetHeight(JLCOx_ak)button1:SetText("On")font1=CreateFont("one")
font1:SetFont("Fonts\\FRIZQT__.TTF",12)font1:SetTextColor(1,1,1)
button1:SetNormalFontObject(font1)button1:SetHighlightFontObject(font1)
button1:SetFrameStrata("TOOLTIP")local R1FIoQI=button1:CreateTexture()
local NsoTwDs=button1:CreateTexture()local HGli=button1:CreateTexture()
R1FIoQI:SetColorTexture(LB1Z,0,0,alphaColor)R1FIoQI:SetAllPoints()
button1:SetNormalTexture(R1FIoQI)NsoTwDs:SetColorTexture(0,0,0,0.5)
NsoTwDs:SetAllPoints()button1:SetHighlightTexture(NsoTwDs)
HGli:SetColorTexture(0,0,0,0.5)HGli:SetAllPoints()
button1:SetPushedTexture(HGli)button1:RegisterForClicks("AnyUp")
function startStop()if tczrIB==1 then
R1FIoQI:SetColorTexture(LB1Z,0,0,alphaColor)tczrIB=0 else R1FIoQI:SetColorTexture(0,N9L,0,alphaColor)
tczrIB=1 end
startStopFrame.t:SetColorTexture(tczrIB,a,wqU76o,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button1:SetScript("OnClick",startStop)
button2:SetPoint("TOPLEFT",hPQ,"TOPLEFT",
hDc_M*2+iD1IUx,-hDc_M)button2:SetWidth(iD1IUx)
button2:SetHeight(JLCOx_ak)button2:SetText("Burst")font2=CreateFont("two")
font2:SetFont("Fonts\\FRIZQT__.TTF",12)font2:SetTextColor(1,1,1)
button2:SetNormalFontObject(font2)button2:SetHighlightFontObject(font2)
button2:SetFrameStrata("TOOLTIP")local iy=button2:CreateTexture()
local m6SCS0=button2:CreateTexture()local NUhYw6R4=button2:CreateTexture()
iy:SetColorTexture(LB1Z,0,0,alphaColor)iy:SetAllPoints()button2:SetNormalTexture(iy)
m6SCS0:SetColorTexture(0,0,0,0.5)m6SCS0:SetAllPoints()
button2:SetHighlightTexture(m6SCS0)NUhYw6R4:SetColorTexture(0,0,0,0.5)
NUhYw6R4:SetAllPoints()button2:SetPushedTexture(NUhYw6R4)
button2:RegisterForClicks("AnyUp")
function cooldownOnOff()if a==1 then iy:SetColorTexture(LB1Z,0,0,alphaColor)a=0 else
iy:SetColorTexture(0,N9L,0,alphaColor)a=1 end
startStopFrame.t:SetColorTexture(tczrIB,a,wqU76o,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button2:SetScript("OnClick",cooldownOnOff)
button3:SetPoint("TOPLEFT",hPQ,"TOPLEFT",
hDc_M*3+iD1IUx*2,-hDc_M)button3:SetWidth(iD1IUx)
button3:SetHeight(JLCOx_ak)button3:SetText("Cleave")font3=CreateFont("three")
font3:SetFont("Fonts\\FRIZQT__.TTF",12)font3:SetTextColor(1,1,1)
button3:SetNormalFontObject(font3)button3:SetHighlightFontObject(font3)
button3:SetFrameStrata("TOOLTIP")local Hv=button3:CreateTexture()
local Ch=button3:CreateTexture()local urkh=button3:CreateTexture()
Hv:SetColorTexture(LB1Z,0,0,alphaColor)Hv:SetAllPoints()button3:SetNormalTexture(Hv)
Ch:SetColorTexture(0,0,0,0.5)Ch:SetAllPoints()button3:SetHighlightTexture(Ch)
urkh:SetColorTexture(0,0,0,0.5)urkh:SetAllPoints()
button3:SetPushedTexture(urkh)button3:RegisterForClicks("AnyUp")
function aoeOnOff()if wqU76o==1 then
button4:Click('LeftButton')end
if wqU76o==0.5 then
Hv:SetColorTexture(LB1Z,0,0,alphaColor)wqU76o=0 else Hv:SetColorTexture(0,N9L,0,alphaColor)wqU76o=0.5 end
startStopFrame.t:SetColorTexture(tczrIB,a,wqU76o,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button3:SetScript("OnClick",aoeOnOff)
button4:SetPoint("TOPLEFT",hPQ,"TOPLEFT",
hDc_M*4+iD1IUx*3,-hDc_M)button4:SetWidth(iD1IUx)
button4:SetHeight(JLCOx_ak)button4:SetText("Aoe")font4=CreateFont("four")
font4:SetFont("Fonts\\FRIZQT__.TTF",12)font4:SetTextColor(1,1,1)
button4:SetNormalFontObject(font4)button4:SetHighlightFontObject(font4)
button4:SetFrameStrata("TOOLTIP")local zhzpBSx=button4:CreateTexture()
local rHSjalVy=button4:CreateTexture()local TjhsnP=button4:CreateTexture()
zhzpBSx:SetColorTexture(LB1Z,0,0,alphaColor)zhzpBSx:SetAllPoints()
button4:SetNormalTexture(zhzpBSx)rHSjalVy:SetColorTexture(0,0,0,0.5)
rHSjalVy:SetAllPoints()button4:SetHighlightTexture(rHSjalVy)
TjhsnP:SetColorTexture(0,0,0,0.5)TjhsnP:SetAllPoints()
button4:SetPushedTexture(TjhsnP)button4:RegisterForClicks("AnyUp")
function aoe()if wqU76o==0.5 then
button3:Click('LeftButton')end;if wqU76o==1 then
zhzpBSx:SetColorTexture(LB1Z,0,0,alphaColor)wqU76o=0 else zhzpBSx:SetColorTexture(0,N9L,0,alphaColor)
wqU76o=1 end
startStopFrame.t:SetColorTexture(tczrIB,a,wqU76o,alphaColor)
startStopFrame.t:SetAllPoints(startStopFrame)end;button4:SetScript("OnClick",aoe)