----------------
-- Player class and related functions
-- @script entities.player
UMF_REQUIRE "/"

---@class Player
local player_meta
player_meta = global_metatable( "player" )

---@type Player
PLAYER = instantiate_global_metatable( "player" )

---@param data string
---@return Player self
function player_meta:__unserialize( data )
	return self
end

---@return string data
function player_meta:__serialize()
	return ""
end

---@return string
function player_meta:__tostring()
	return string.format( "Player" )
end

--- Gets the type of the entity.
---
---@return string type
function player_meta:GetType()
	return "player"
end

--- Repawns the player.
function player_meta:Respawn()
	return RespawnPlayer()
end

--- Release what the player is currently holding.
---
function player_meta:ReleaseGrab()
	ReleasePlayerGrab()
end

--- Sets the transform of the player.
---
---@param transform Transformation
---@param includePitch? boolean
function player_meta:SetTransform( transform, includePitch )
	return SetPlayerTransform( transform, includePitch )
end

--- Sets the transform of the camera.
---
---@param transform Transformation
function player_meta:SetCamera( transform )
	return SetCameraTransform( transform )
end

--- Sets the Field of View of the camera.
---
---@param degrees number
function player_meta:SetFov( degrees )
	return SetCameraFov( degrees )
end

--- Sets the Depth of Field of the camera.
---
---@param distance number
---@param amount number
function player_meta:SetDof( distance, amount )
	return SetCameraDof( distance, amount )
end

--- Sets the transform of the player spawn.
---
---@param transform Transformation
function player_meta:SetSpawnTransform( transform )
	return SetPlayerSpawnTransform( transform )
end

--- Sets the vehicle the player is currently riding.
---
---@param handle Vehicle | number
function player_meta:SetVehicle( handle )
	return SetPlayerVehicle( GetEntityHandle( handle ) )
end

--- Sets the velocity of the player.
---
---@param velocity Vector
function player_meta:SetVelocity( velocity )
	return SetPlayerVelocity( velocity )
end

--- Sets the screen the player is currently viewing.
---
---@param handle Screen | number
function player_meta:SetScreen( handle )
	return SetPlayerScreen( GetEntityHandle( handle ) )
end

--- Sets the health of the player.
---
---@param health number
function player_meta:SetHealth( health )
	return SetPlayerHealth( health )
end

--- Sets the velocity of the ground for the player,
--- Effectively turning it into a conveyor belt of sorts.
---
---@param vel Vector
function player_meta:SetGroundVelocity(vel)
	SetPlayerGroundVelocity(vel)
end

--- Gets the transform of the player.
---
---@param includePitch? boolean
---@return Transformation
function player_meta:GetTransform( includePitch )
	return MakeTransformation( GetPlayerTransform( includePitch ) )
end

--- Gets the transform of the player camera.
---
---@return Transformation
function player_meta:GetPlayerCamera()
	return MakeTransformation( GetPlayerCameraTransform() )
end

--- Gets the transform of the camera.
---
---@return Transformation
function player_meta:GetCamera()
	return MakeTransformation( GetCameraTransform() )
end

--- Gets the velocity of the player.
---
---@return Vector
function player_meta:GetVelocity()
	return MakeVector( GetPlayerVelocity() )
end

--- Gets the vehicle the player is currently riding.
---
---@return Vehicle
function player_meta:GetVehicle()
	return Vehicle( GetPlayerVehicle() )
end

--- Gets the shape the player is currently grabbing.
---
---@return Shape
function player_meta:GetGrabShape()
	return Shape( GetPlayerGrabShape() )
end

--- Gets the body the player is currently grabbing.
---
---@return Body
function player_meta:GetGrabBody()
	return Body( GetPlayerGrabBody() )
end

--- Gets the pick-able shape the player is currently targetting.
---
---@return Shape
function player_meta:GetPickShape()
	return Shape( GetPlayerPickShape() )
end

--- Gets the pick-able body the player is currently targetting.
---
---@return Body
function player_meta:GetPickBody()
	return Body( GetPlayerPickBody() )
end

--- Gets the interactible shape the player is currently targetting.
---
---@return Shape
function player_meta:GetInteractShape()
	return Shape( GetPlayerInteractShape() )
end

--- Gets the interactible body the player is currently targetting.
---
---@return Body
function player_meta:GetInteractBody()
	return Body( GetPlayerInteractBody() )
end

--- Gets the screen the player is currently interacting with.
---
---@return Screen
function player_meta:GetScreen()
	return Screen( GetPlayerScreen() )
end

--- Gets the player health.
---
---@return number
function player_meta:GetHealth()
	return GetPlayerHealth()
end
