/// @description Insert description here
// You can write your code in this editor
GroundId1 = layer_get_id("Tiles_1")
tilemap1  = layer_tilemap_get_id(GroundId1);
GroundId2 = layer_get_id("Tiles_2");
tilemap2 = layer_tilemap_get_id(GroundId2);

layerID = layer_get_id("Wall_Run");
tiles = layer_tilemap_get_id(layerID);

if (global.boss_level_1 = 1)
{
	global.chips_collected = 0;
	global.face_cards_collected = 0;
}

if (global.boss_level_1 = 0)
{
	if (global.boss_level_2 = 1 && global.playerchips > 0 && global.face_cards > 0 && room = rm_Level2)
	{
		global.chips_collected = 0;
		global.face_cards_collected = 0;
	}
} 