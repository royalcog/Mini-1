dark_alpha = (dark_alpha < dark_target)
    ? min(dark_alpha + dark_speed, dark_target)
    : max(dark_alpha - dark_speed, dark_target);

// finished fading back in -> clean up
if (dark_target == 0 && dark_alpha <= 0) instance_destroy();