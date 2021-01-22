
function [output] = run_spice(sample, num, hspicepath)
% num = size(sample,1);
%% write sweep file and simulate circuit in HSPICE-
% cd(circuitpath);

fp1 = fopen('./sweep_data_mc','w+');
fprintf(fp1,'.DATA data\n');
fprintf(fp1,'voff_pd11 vth0_pd11 ub_pd11 voff_pd12 vth0_pd12 ub_pd12 voff_wl11 vth0_wl11 ub_wl11 voff_wl12 vth0_wl12 ub_wl12 voff_pu11 vth0_pu11 ub_pu11 voff_pu12 vth0_pu12 ub_pu12\n');
fprintf(fp1,'voff_pd21 vth0_pd21 ub_pd21 voff_pd22 vth0_pd22 ub_pd22 voff_wl21 vth0_wl21 ub_wl21 voff_wl22 vth0_wl22 ub_wl22 voff_pu21 vth0_pu21 ub_pu21 voff_pu22 vth0_pu22 ub_pu22\n');
fprintf(fp1,'voff_pd31 vth0_pd31 ub_pd31 voff_pd32 vth0_pd32 ub_pd32 voff_wl31 vth0_wl31 ub_wl31 voff_wl32 vth0_wl32 ub_wl32 voff_pu31 vth0_pu31 ub_pu31 voff_pu32 vth0_pu32 ub_pu32\n');
fprintf(fp1,'voff_pd41 vth0_pd41 ub_pd41 voff_pd42 vth0_pd42 ub_pd42 voff_wl41 vth0_wl41 ub_wl41 voff_wl42 vth0_wl42 ub_wl42 voff_pu41 vth0_pu41 ub_pu41 voff_pu42 vth0_pu42 ub_pu42\n');
fprintf(fp1,'voff_pd51 vth0_pd51 ub_pd51 voff_pd52 vth0_pd52 ub_pd52 voff_wl51 vth0_wl51 ub_wl51 voff_wl52 vth0_wl52 ub_wl52 voff_pu51 vth0_pu51 ub_pu51 voff_pu52 vth0_pu52 ub_pu52\n');
fprintf(fp1,'voff_pd61 vth0_pd61 ub_pd61 voff_pd62 vth0_pd62 ub_pd62 voff_wl61 vth0_wl61 ub_wl61 voff_wl62 vth0_wl62 ub_wl62 voff_pu61 vth0_pu61 ub_pu61 voff_pu62 vth0_pu62 ub_pu62\n');
fprintf(fp1,'voff_pd71 vth0_pd71 ub_pd71 voff_pd72 vth0_pd72 ub_pd72 voff_wl71 vth0_wl71 ub_wl71 voff_wl72 vth0_wl72 ub_wl72 voff_pu71 vth0_pu71 ub_pu71 voff_pu72 vth0_pu72 ub_pu72\n');
fprintf(fp1,'voff_pd81 vth0_pd81 ub_pd81 voff_pd82 vth0_pd82 ub_pd82 voff_wl81 vth0_wl81 ub_wl81 voff_wl82 vth0_wl82 ub_wl82 voff_pu81 vth0_pu81 ub_pu81 voff_pu82 vth0_pu82 ub_pu82\n');
for i=1:num
    for j = 0:7
        fprintf(fp1, '%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n',...
            sample(i,18*j+1), sample(i,18*j+2), sample(i,18*j+3), sample(i,18*j+4), sample(i,18*j+5), sample(i,18*j+6),...
            sample(i,18*j+7), sample(i,18*j+8), sample(i,18*j+9), sample(i,18*j+10), sample(i,18*j+11), sample(i,18*j+12), ...
            sample(i,18*j+13), sample(i,18*j+14), sample(i,18*j+15), sample(i,18*j+16), sample(i,18*j+17), sample(i,18*j+18));
    end
    fprintf(fp1, '\n');
end
fprintf(fp1,'.ENDDATA\n');
fclose(fp1);
dos([hspicepath, ' -i  ./sram6Tcell.sp'])


output = zeros(num,1);
fid = fopen('sram6Tcell.mt0', 'r');
%% skip the lines before alter#
while feof(fid) == 0
    line = fgetl(fid);
    if ~isempty(strfind(line,'alter#'))
        break;
    end
end

%% Get Ratio: ratio is the second string in the second row
cnt = 0;
while ~feof(fid) && cnt<num 
    for i=1:49
        line = fgetl(fid);
    end
    remainder = line;
    [chopped, remainder] = strtok(remainder);
    %[chopped, remainder] = strtok(remainder);
    if (strcmp(chopped,'failed'))
		chopped='1e-6';
    end
    cnt = cnt + 1;
    output(cnt,1) = str2num(chopped);
%   line = fgetl(fid);
end
%R=sort(output,'descend');
fclose(fid);

delete('*.st0');
delete('*.ic0');
delete('*.lis');
delete('*.mt0');
delete('*mc');
cd ..
end