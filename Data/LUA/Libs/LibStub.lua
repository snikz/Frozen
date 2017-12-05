local ZA,_IQQ="LibStub",2;local XpkjA=_G[ZA]
if not XpkjA or XpkjA.minor<_IQQ then XpkjA=
XpkjA or{libs={},minors={}}_G[ZA]=XpkjA;XpkjA.minor=_IQQ
function XpkjA:NewLibrary(pVRj,fuZ3z86)
assert(
type(pVRj)=="string","Bad argument #2 to `NewLibrary' (string expected)")
fuZ3z86=assert(tonumber(strmatch(fuZ3z86,"%d+")),"Minor version must either be a number or contain a number.")local er=self.minors[pVRj]
if er and er>=fuZ3z86 then return nil end
self.minors[pVRj],self.libs[pVRj]=fuZ3z86,self.libs[pVRj]or{}return self.libs[pVRj],er end
function XpkjA:GetLibrary(DFb100j,XL_)if not self.libs[DFb100j]and not XL_ then
error(("Cannot find a library instance of %q."):format(tostring(DFb100j)),2)end;return
self.libs[DFb100j],self.minors[DFb100j]end;function XpkjA:IterateLibraries()return pairs(self.libs)end
setmetatable(XpkjA,{__call=XpkjA.GetLibrary})end