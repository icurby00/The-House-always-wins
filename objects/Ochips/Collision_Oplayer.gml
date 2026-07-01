/// @description Insert description here
// You can write your code in this editor
global.chips_collected = global.chips_collected + 1;
if room = rm_Level1
{
global.chips_per_level_1 = global.chips_per_level_1 - 1;
}
else if room = rm_Level2
{
global.chips_per_level_2 = global.chips_per_level_2 - 1;
}
instance_destroy();