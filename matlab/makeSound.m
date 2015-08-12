% Clear and close all
close all
clear all

% Read all audio files and extract fs
% Baby sounds
baby_crying_1 = ('baby_signals/baby-crying.wav');
[x_baby_crying_1, fs_baby_crying_1] = audioread(baby_crying_1);
baby_crying_2 = ('baby_signals/baby-crying-01.wav');
[x_baby_crying_2, fs_baby_crying_2] = audioread(baby_crying_2);
baby_talking = ('baby_signals/baby-talking_8khz.wav');
[x_baby_talking, fs_baby_talking] = audioread(baby-talking);
% Noise sounds
noise_bird = ('noise_signals/bird_chirp_ext_8khz');
[x_noise_bird, fs_noise_bird] = audioread(noise_bird);
noise_traffic = ('noise_signals/traffic-noise-01(dobelnsgatan)');
[x_noise_traffic, fs_noise_traffic] = audioread(noise_traffic);
noise_ventilation = ('noise_signals/ventilation_8khz.wav');
[x_noise_ventilation, fs_noise_ventilation] = audioread(noise_ventilation);

