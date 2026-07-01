if (y + sprite_height/2) < other.y
{
	instance_destroy(other);
}
else if (! y + sprite_height/2) < other.y 
{
	with(Oplayer)
	{
	var near = instance_nearest(other.x, other.y, Ocheckpoint);

		other.x = near.x;
		other.y = near.y-10;
	}
}