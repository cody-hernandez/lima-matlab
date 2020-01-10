% lima.m
% rf link margin tool
% https://github.com/cody-hernandez
close all;
clear;
clc;

%% get configuration file
lima_config_file = uigetfile('*.xlsx','Link Margin Config File');

%% check if uplink sheet is present
[~,worksheets] = xlsfinfo(lima_config_file);
uplink_check = ismember('Uplink',worksheets);

%% read uplink table if present
if uplink_check == 1
    table_uplink = readtable(lima_config_file,'Sheet','Uplink');
    num_rf_uplinks = height(table_uplink);
else
    num_rf_uplinks = 0;
end

%% read mandatory tables
table_antennas = readtable(lima_config_file,'Sheet','Antennas');
table_downlinks = readtable(lima_config_file,'Sheet','Downlinks');
table_parameters = readtable(lima_config_file,'Sheet','Parameters');

%% exit if parameters table is incorrect
if height(table_parameters) ~= 1
    disp('Parameters table should have exactly one row.');
    return;
end

%% read table properties
num_gnd_antennas = height(table_downlinks);
num_rf_downlinks = height(table_antennas);

%% set constants
const_c = 299792458;
const_k = 1.380649e-23;

%% iterate trajectory data
for i = 1:num_gnd_antennas
    for j = 3:5
        if j == 3
            trajectory_name = 'High Short';
        else if j == 4
            trajectory_name = 'Nominal';
        else if j == 5
            trajectory_name = 'Low Long';
        else
            return;
    end
end

%% find trajectory maximums

%% iterate downlink margins
for i = 1:num_rf_downlinks
end

%% iterate uplink margins
if num_rf_uplinks > 0
    for i = 1:num_rf_uplinks
    end
end

%% end of script
msgbox('Script complete!','EOS');
