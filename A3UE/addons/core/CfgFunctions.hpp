
#ifdef DEBUG_ENABLED_FULL
allowFunctionsRecompile = 1;
allowFunctionsLog = 1;
#endif

class CfgFunctions {
	class A3A {
		class Save {
			class saveLoop { file = QPATHTOFOLDER(functions\Save\fn_saveLoop.sqf); };
		};

		class Base {
			class createPetros { file = QPATHTOFOLDER(functions\Base\fn_createPetros.sqf); };
		};
	};
};

