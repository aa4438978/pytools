local M = {}
local moduleName = ...
_G[moduleName] = M
setmetatable(M, {__index = _G})
local _ENV = M


function new()
	local tab_obj = {}
	setmetatable(tab_obj, {__index = AckSceneExit})
	tab_obj:init()
	return tab_obj
end

function init(self)
	self.uid = 0
end


function encode(self)
	pack = packet.new()
	pack:writeU32(self.uid)
	return pack:encode(Msg.P_ACK_SCENE_EXIT)
end


function setUid(self, uid)
	self.uid = uid
end
