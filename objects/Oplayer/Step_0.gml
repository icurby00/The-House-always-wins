/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case playerstate.movement:
	{
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		key_jump =  keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));


		var move = key_right - key_left;

				hsp = move * walkspd;
				vsp = vsp + grv;

		if move != 0 
		{
			facing_dir = move;
			image_xscale = facing_dir;
			direction = point_direction(x, y, x + move, y);
		}


		if (place_meeting(x,y+1, [tilemap1, tilemap2, Olocked_door]) && (key_jump))
			{
				vsp = -10;
				grv = 0.3;
			}
		canjump -= 1;
		if (tilemap_get_at_pixel(tiles,x,y))
		{
			can_wall_run = true;
				if (can_wall_run)
				{
					state = playerstate.wall_run;
				}
		}
		//Horizontal Collison
			if (place_meeting(x+hsp,y,[tilemap1, tilemap2, Olocked_door]))
			{
				while (!place_meeting(x+sign(hsp),y,[tilemap1, tilemap2, Olocked_door]))
				{
					x = x + sign(hsp);
				}
					hsp = 0;
			}
			x = x + hsp;


			//Vertical Collison
			if (place_meeting(x,y+vsp,[tilemap1, tilemap2, Olocked_door]))
			{
				while (!place_meeting(x,y+sign(vsp),[tilemap1, tilemap2, Olocked_door]))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}
			y = y + vsp;
	
	
		if keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
		{
			buffer_counter = buffer_max;
		}
		if buffer_counter > 0				 //if buffer greater than zero
		{
			buffer_counter -= 1;			 //count the buffer down
			if  canjump > 0
			{
				vsp = -12;					 //launch upwards at -5 vertical speed
				buffer_counter = 0;	         //reset the buffer
			}
		}

		if (hsp != 0 ) image_xscale = sign(hsp);
		if (hsp == 0 && vsp == 0)
			{
				sprite_index = spr_player_right_stationary;
				idle = true;
				idle_cooldown--;
				if (idle = true && idle_cooldown <= 0)
				{
					state = playerstate.idle;
				}
			} else
			{
				sprite_index = spr_player_right;
			}
	
	} break;
	case playerstate.idle:
	{
		image_speed = 1;
		sprite_index = spr_player_right_idle;
			if (image_speed > 0)
			{
				if (image_index >= image_number - 1) || keyboard_check(vk_left) || keyboard_check(ord("A")) || keyboard_check(vk_right) || keyboard_check(ord("D")) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"))
				{
					state = playerstate.movement;
					idle = false;
					idle_cooldown = 30;
				}
			}
		//Horizontal Collison
			if (place_meeting(x+hsp,y,[tilemap1, tilemap2]))
			{
				while (!place_meeting(x+sign(hsp),y,[tilemap1, tilemap2]))
				{
					x = x + sign(hsp);
				}
					hsp = 0;
			}
			x = x + hsp;


			//Vertical Collison
			if (place_meeting(x,y+vsp,[tilemap1, tilemap2]))
			{
				while (!place_meeting(x,y+sign(vsp),[tilemap1, tilemap2,]))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}
			y = y + vsp;
	}break;
	case playerstate.wall_run:
	{
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
		key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
		var move = key_right - key_left;
		var wall_run_spd = key_down - key_up;
		hsp = move * wall_spd;
		vsp = wall_run_spd * wall_spd;
		if move != 0
			{
				facing_dir = move;
				image_xscale = facing_dir;
				direction = point_direction(x, y, x + move, y);
			}
		
		
		//Horizontal Collison
			if (place_meeting(x+hsp,y,[tilemap1, tilemap2]))
			{
				while (!place_meeting(x+sign(hsp),y,[tilemap1, tilemap2]))
				{
					x = x + sign(hsp);
				}
					hsp = 0;
			}
			x = x + hsp;


			//Vertical Collison
			if (place_meeting(x,y+vsp,[tilemap1, tilemap2]))
			{
				while (!place_meeting(x,y+sign(vsp),[tilemap1, tilemap2,]))
				{
					y = y + sign(vsp);
				}
				vsp = 0;
			}
			y = y + vsp;
		if (!tilemap_get_at_pixel(tiles, x, y))
		{
			state = playerstate.movement;
		}
	}

	
}
