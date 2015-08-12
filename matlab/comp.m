Nstrength = 0;
x_BC20=(1:xL_baby_talking)+Nstrength*x_noise_bird(1:xL_baby_talking);
Nstrength = 1;
x_BC21=x_baby_talking(1:xL_baby_talking)+Nstrength*x_noise_bird(1:xL_baby_talking);
x_BC22=x_baby_talking(1:xL_baby_talking)+Nstrength*x_noise_bird(1:xL_baby_talking)+Nstrength*x_noise_traffic(1:xL_baby_talking)+Nstrength*x_noise_ventilation(1:xL_baby_talking)+Nstrength*x_noise_amb_lib(1:xL_baby_talking)+Nstrength*x_noise_traff_inter(1:xL_baby_talking);
Nstrength = 3;
x_BC23=x_baby_talking(1:xL_baby_talking)+Nstrength*x_noise_bird(1:xL_baby_talking)+Nstrength*x_noise_traffic(1:xL_baby_talking)+Nstrength*x_noise_ventilation(1:xL_baby_talking)+Nstrength*x_noise_amb_lib(1:xL_baby_talking)+Nstrength*x_noise_traff_inter(1:xL_baby_talking);
