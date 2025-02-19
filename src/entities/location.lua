----------------
-- Location class and related functions
-- @script entities.location
UMF_REQUIRE "/"

---@class Location: Entity
---@field transform Transformation (dynamic property -- readonly)
local location_meta
location_meta = global_metatable( "location", "entity", true )

--- Tests if the parameter is a location entity.
---
---@param e any
---@return boolean
function IsLocation( e )
	return IsEntity( e ) and e.type == "location"
end

--- Wraps the given handle with the location class.
---
---@param handle number
---@return Location?
function Location( handle )
	if handle > 0 then
		return instantiate_global_metatable( "location", { handle = handle, type = "location" } )
	end
end

--- Finds a location with the specified tag.
--- `global` determines whether to only look in the script's hierarchy or the entire scene.
---
---@param tag string
---@param global boolean
---@return Location?
function FindLocationByTag( tag, global )
	return Location( FindLocation( tag, global ) )
end

--- Finds all locations with the specified tag.
--- `global` determines whether to only look in the script's hierarchy or the entire scene.
---
---@param tag string
---@param global boolean
---@return Location[]
function FindLocationsByTag( tag, global )
	local t = FindLocations( tag, global )
	for i = 1, #t do
		t[i] = Location( t[i] )
	end
	return t
end

---@type Location

---@return string
function location_meta:__tostring()
	return string.format( "Location[%d]", self.handle )
end

--- Gets the transform of the location.
---
---@return Transformation
function location_meta:GetTransform()
	assert( self:IsValid() )
	return MakeTransformation( GetLocationTransform( self.handle ) )
end

----------------
-- Properties implementation

function location_meta._C:transform( setter )
	assert(not setter, "cannot set transform")
	return self:GetTransform()
end