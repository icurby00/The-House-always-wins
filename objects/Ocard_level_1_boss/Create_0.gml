/// @description Insert description here
// You can write your code in this editor
vsp = 0;
hsp = 0;
walkspd = 7;
grv = 0.5;
dir = 1;

GroundId1 = layer_get_id("Tiles_1")
tilemap1  = layer_tilemap_get_id(GroundId1);
GroundId2 = layer_get_id("Tiles_2");
tilemap2 = layer_tilemap_get_id(GroundId2);