//@arg x 
//@arg y
var posX = argument0;
var posY = argument1;

var mFloor = instance_create_layer( posX, posY, "Instances", o_meat );
mFloor.image_xscale = 1;
mFloor.image_yscale = 1;
var mBlock = instance_create_layer( posX, posY, "Instances", o_block );
mBlock.image_xscale = 3;
mBlock.image_yscale = 1;