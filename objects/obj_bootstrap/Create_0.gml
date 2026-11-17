// already have one from an earlier visit to this room: don't make a second copy
if (instance_number(object_index) > 1) { instance_destroy(); exit; }
randomize();