
#ifdef DEBUG_ENABLED_FULL
allowFunctionsRecompile = 1;
allowFunctionsLog = 1;
#endif

class CfgFunctions {
	class A3A {
		class Save {
			class saveLoop { file = QPATHTOFOLDER(functions\Save\fn_saveLoop.sqf); };
			class loadServer { file = QPATHTOFOLDER(functions\Save\fn_loadServer.sqf); };
		};
	};
};

