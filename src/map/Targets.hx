package map;

/**
 * Target types
 * @author Sith
 */

@:enum abstract Targets(String) to String {

	/**Tube mask*/
	var TUBE_MASK = 'TubeMask';
	
	/** Map title*/
	var MAP_TITLE = 'MapTitle';
	
	// =================== Labels ====================
	
	/** Russia*/
	var RUSSIA = 'Russia';
	
	/** Kazahstan*/
	var KAZAHSTAN = 'Kazahstan';
	
	/** West region*/
	var WEST_REGION = 'WestRegion';
	
	/** East region*/
	var EAST_REGION = 'EastRegion';
	
	/** Center region*/
	var CENTER_REGION = 'CenterRegion';
	
	/** Sea terminal*/
	var SEA_TERMINAL = 'SeaTerminal';
	
	/** Kalmyki republic*/
	var KALMYKI_REPUBLIC = 'KalmykiRepublic';
	
	/** Astrahanskaya Obl*/
	var ASTRAHANSKAYA_OBL = 'AstrahanskayaObl';
	
	/** Stavropolski Krai*/
	var STAVROPOLSKI_KRAI = 'StavropolskiKrai';
	
	/** Atirauskaya Obl*/
	var ATIRAUSKAYA_OBL = 'AtirauskayaObl';
	
	/** Krasnodarski Krai*/
	var KRASNODARSKI_KRAI = 'KrasnodarskiKrai';
	
	/** Distance A*/
	var DISTANCE_A = 'DistanceA';
	
	/** Distance B*/
	var DISTANCE_B = 'DistanceB';
	
	/** Distance C*/
	var DISTANCE_C = 'DistanceC';
	
	/** Ural river*/
	var URAL_RIVER = 'UralRiver';
	
	/** Volga river*/
	var VOLGA_RIVER = 'VolgaRiver';
	
	/** Kuban river*/
	var KUBAN_RIVER = 'KubanRiver';
	
	// =================== Weather ====================
	
	/** Sun*/
	var SUN = 'Sun';
	
	/** Cloud*/
	var CLOUD = 'Cloud';
	
	/** Thunderstorm*/
	var THUNDERSTORM = 'Thunderstorm';
	
	// =================== Points ====================
	
	var P452 = 'p452';
	var P674 = 'p674';
	var P949 = 'p949';
	var P1201 = 'p1201';
	var P1497 = 'p1497';
	
	var A_NPS_3A = 'a_nps_3a';
	var A_NPS_4 = 'a_nps_4';
	var A_NPS_4A = 'a_nps_4a';
	var A_NPS_5A = 'a_nps_5a';
	var NPS_2 = 'nps_2';
	var NPS_3 = 'nps_3';
	var NPS_4 = 'nps_4';
	var NPS_5 = 'nps_5';
	var NPS_7 = 'nps_7';
	var NPS_8 = 'nps_8';
	
	var NPS_TENGIZ = 'nps_Tengiz';
	var NPS_ATIRAU = 'nps_Atirau';
	var NPS_ASTRAHANSKAYA = 'nps_Astrahanskaya';
	var NPS_KOMSOMOLSKAYA = 'nps_Komsomolskaya';
	var NPS_KROPOTKINSKAYA = 'nps_Kropotkinskaya';
	var NPS_SEA_TERMINAL = 'nps_SeaTerminal';
	
	var VPU1 = 'vpu1';
	var VPU2 = 'vpu2';
	var VPU3 = 'vpu3';
	
	var OIL_SOURCE_1 = 'oilSource1';
	var OIL_SOURCE_2 = 'oilSource2';
	
	// =================== Marks ====================
	
	/** Distance Line*/
	var DISTANCE_LINE = 'DistanceLine';
	
	var GTSU = 'gtsu';
	var RTSU = 'rtsu';
	
	var ZONE1 = 'zone1';
	var ZONE2 = 'zone2';
	var ZONE3 = 'zone3';
	var ZONE4 = 'zone4';
	
	// =================== Marks ====================
	var SCADA = 'SCADA';
	
}