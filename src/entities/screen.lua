----------------
-- Screen class and related functions
-- @script entities.screen
UMF_REQUIRE "/"

---@class Screen: Entity
---@field enabled boolean (dynamic property)
---@field shape Shape (dynamic property -- readonly)
local screen_meta
screen_meta = global_metatable( "screen", "entity", true )

--- Tests if the parameter is a screen entity.
---
---@param e any
---@return boolean
function IsScreen( e )
	return IsEntity( e ) and e.type == "screen"
end

--- Wraps the given handle with the screen class.
---
---@param handle number
---@return Screen?
function Screen( handle )
	if handle > 0 then
		return instantiate_global_metatable( "screen", { handle = handle, type = "screen" } )
	end
end

--- Finds a screen with the specified tag.
--- `global` determines whether to only look in the script's hierarchy or the entire scene.
---
---@param tag string
---@param global boolean
---@return Screen?
function FindScreenByTag( tag, global )
	return Screen( FindScreen( tag, global ) )
end

--- Finds all screens with the specified tag.
--- `global` determines whether to only look in the script's hierarchy or the entire scene.
---
---@param tag string
---@param global boolean
---@return Screen[]
function FindScreensByTag( tag, global )
	local t = FindScreens( tag, global )
	for i = 1, #t do
		t[i] = Screen( t[i] )
	end
	return t
end

---@type Screen

---@return string
function screen_meta:__tostring()
	return string.format( "Screen[%d]", self.handle )
end

--- Sets if the screen is enabled.
---
---@param enabled boolean
function screen_meta:SetEnabled( enabled )
	assert( self:IsValid() )
	return SetScreenEnabled( self.handle, enabled )
end

--- Gets the shape the screen is attached to.
---
---@return Shape
function screen_meta:GetShape()
	assert( self:IsValid() )
	return Shape( GetScreenShape( self.handle ) )
end

--- Gets if the screen is enabled.
---
---@return boolean
function screen_meta:IsEnabled()
	assert( self:IsValid() )
	return IsScreenEnabled( self.handle )
end

----------------
-- Properties implementation

function screen_meta._C:enabled( setter, val )
	if setter then
		self:SetEnabled( val )
	else
		return self:IsEnabled()
	end
end

function screen_meta._C:shape( setter )
	assert(not setter, "cannot set shape")
	return self:GetShape()
end
