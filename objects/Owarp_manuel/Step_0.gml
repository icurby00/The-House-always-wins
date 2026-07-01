/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,Oplayer)) && keyboard_check_pressed(vk_enter)
{
	if room_exists(target_room)
	{
	 Oplayer.x = target_x;
	 Oplayer.y = target_y;
	room_goto(target_room);
	
	}
}