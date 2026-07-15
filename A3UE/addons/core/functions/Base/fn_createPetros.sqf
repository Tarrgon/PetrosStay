#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_location"];

private _groupPetros = if (isNull petros or {side group petros != teamPlayer}) then {createGroup teamPlayer} else {group petros};

// Don't re-use group if petros was killed by enemy while being moved
if (!isNil "_location" && count units _groupPetros > 1) then { _groupPetros = createGroup teamPlayer };

if (isNil "_location") then {
	if (count units _groupPetros > 1) then {
		_location = getPosATL petros;
	} else {
		Info("[PetrosStay] Attempting to load Petros' position...");
		private _petrosPosition = "petrosStay_petrosPosition" call A3A_fnc_returnSavedStat;
		if (isNil "_petrosPosition") then {
			Info("[PetrosStay] Petros' position not found. Respawning at normal respawn location.");
			_location = getMarkerPos respawnTeamPlayer;
		} else {
			InfoArray("[PetrosStay] Loading Petros' position at:", _petrosPosition);
			_location = _petrosPosition;
		};
	};
};

private _petrosIdentity = A3A_faction_reb getOrDefault [
	"petrosIdentity",
	createHashMapFromArray [
		["face", "GreekHead_A3_01"],
		["speaker", "Male01GRE"],
		["pitch", 1.1],
		["firstName", "Petros"],
		["lastName", ":)"]
	]
];

private _oldPetros = petros;
petros = [_groupPetros, FactionGet(reb,"unitPetros"), _location, [], 0, "NONE", _petrosIdentity] call A3A_fnc_createUnit;
publicVariable "petros";
deleteVehicle _oldPetros;		// Petros should now be leader unless there's a player in the group

call A3A_fnc_initPetros;
