params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
    _vehicle removeMagazinesTurret ["rhs_mag_200rnd_127x99_mag_Tracer_Red",[0]]; //Removes default magzines
    _vehicle removeMagazines "RHS_96Rnd_40mm_MK19_M1001"; //Removes canister ammo from Mk19 variants
    for "_i" from 1 to 10 do {_vehicle addMagazineTurret ["rhs_mag_200rnd_127x99_SLAP_mag_Tracer_Red",[0]]}; //Adds n magazines
    _vehicle addMagazineTurret ["rhsusf_mag_L8A3_16",[0]]; //Adds countermeasure
    _vehicle loadMagazine [[0], "RHS_M2_CROWS_M151", "rhs_mag_200rnd_127x99_SLAP_mag_Tracer_Red"]; //Loads turret magazine
    [_vehicle, 6] call ace_cargo_fnc_setSpace; //Sets cargo space
    [_vehicle, 80] call ace_cargo_fnc_setSize; //Sets cargo size
    [_vehicle, 1, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts; //Adds spare wheel
    _vehicle setPlateNumber "1/7 Cav"; //Set plate number

	[
	_vehicle,
	[], 
	["SMP",1,"SMP_L",1,"SMP_R",1,"hide_SMP",0,"Hide_CIP",1,"Dispenser_Fold",0,"Hatch_Commander",1,"Hatch_Front",0,"Hatch_Left",0,"Hatch_Right",0,"Ramp",1,"Hide_Antenna_1",0,"Hide_Antenna_2",0,"Hide_Antenna_3",0,"Hide_DEK",0,"Hide_DUKE",0,"Hide_ExDiff",0,"Hide_FCans",0,"Hide_WCans",0,"Hide_GPS",0,"Hide_PioKit",0,"Hide_StgBar",0,"Hide_STORM",0,"Hide_SuspCov",0,"Hide_Towbar",0,"Extend_Mirrors",0,"Hatch_Driver",1]
	] call BIS_fnc_initVehicle; //Handles vehicle appearnence

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    private _inventory = [ //Defines vehicle inventory
        ["rhs_weap_fgm148", 2],
        ["rhs_weap_M136_hp", 2],
        ["ACE_quikclot", 32],
        ["ACE_tourniquet", 8],
        ["ACE_splint", 8],
        ["ACE_EarPlugs", 4],
        ["ToolKit", 1],
        ["ACE_Clacker", 1],
        ["SatchelCharge_Remote_Mag", 1],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32],
        ["rhsusf_200Rnd_556x45_mixed_soft_pouch", 8],
        ["rhsusf_100Rnd_762x51_m62_tracer", 8],
        ["rhs_mag_M433_HEDP", 12],
        ["rhs_mag_m713_Red", 4],
        ["ACE_HuntIR_M203", 2],
        ["ACE_40mm_Flare_ir", 4]
    ];

    {
        _x params ["_ammo", "_amount"];
        _vehicle addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory

    }
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 1000, 600] call vehicle_fnc_respawnVehicleWhenAbandoned;