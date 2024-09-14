%% INITIALIZE

clear all;
close all;
clc;

%% AIRPORTS

% Coordinates of the airports (longitude, latitude)
AIRPORTS = [
    19.7205, 41.4144; % TIA
    44.4260, 40.1477; % EVN
    15.4396, 46.9885; % GRZ
    11.3432, 47.2604; % INN
    14.3347, 46.6375; % KLU
    14.2861, 48.2236; % LNZ
    13.0054, 47.7932; % SZG
    16.5690, 48.1103; % VIE
    50.0865, 40.4670; % GYD
     4.4000, 51.2167; % ANR
     4.4844, 50.9019; % BRU
     4.4538, 50.4592; % CRL
     2.8833, 51.2167; % OST
    27.4395, 53.9026; % MSQ
    18.3564, 43.8211; % SJJ
    18.7244, 44.5431; % TZL
    27.5159, 42.5690; % BOJ
    23.3219, 42.6977; % SOF
    27.9116, 43.2140; % VAR
    33.6240, 34.8753; % LCA
    32.4833, 34.7166; % PFO
    18.3020, 42.5616; % DBV
    14.5647, 45.2172; % RJK
    13.8487, 44.8847; % PUY
    16.2974, 43.5381; % SPU
    16.0755, 45.7423; % ZAG
    15.3465, 44.1044; % ZAD
     9.8491, 57.0926; % AAL
    10.6198, 56.3028; % AAR
     9.1516, 55.7408; % BLL
    12.6561, 55.6170; % CPH
    -7.2743, 62.0695; % FAE
    24.8324, 59.4131; % TLL
    24.9633, 60.3172; % HEL
    24.8555, 67.6794; % KTT
    25.3547, 64.9333; % OUL
    25.8408, 66.5635; % RVN
    23.8325, 61.4155; % TMP
    22.2701, 60.5219; % TKU
    21.7139, 63.0500; % VAA
     8.8050, 41.9192; % AJA
     9.4839, 42.5510; % BIA
     0.5825, 44.8374; % EGC
    -1.5201, 43.4681; % BIQ
    -0.7156, 44.8290; % BOD
    -4.4137, 48.4438; % BES
     9.1667, 41.5667; % FSC
     3.0783, 50.5702; % LIL
     5.0801, 45.7253; % LYS
     5.2161, 43.4392; % MRS
     3.9781, 43.6081; % MPL
    -1.6091, 47.1530; % NTE
     7.2152, 43.6581; % NCE
     2.1125, 49.4536; % BVA
     2.5479, 49.0097; % CDG
     2.3578, 48.7264; % ORY
    -1.6722, 48.0731; % RNS
    55.4320, -20.8914; % RUN
     7.6308, 48.5383; % SXB
     6.1514, 43.1006; % TLN
     1.3700, 43.6303; % TLS
    42.6890, 42.2178; % KUT
    44.8271, 41.7152; % TBS
     9.2824, 48.7402; % FMM
    10.0124, 53.6306; % HAM
    13.2877, 52.5596; % BER
     8.7858, 53.1006; % BRE
     6.9659, 50.9375; % CGN
     7.5833, 51.4504; % DTM
    13.7114, 51.3385; % DRS
     6.7823, 51.2388; % DUS
     8.6821, 50.1109; % FRA
     7.2639, 49.9467; % HHN
     9.3862, 47.7164; % FDH
     9.7385, 52.3757; % HAJ
     7.8866, 48.5584; % FKB
    12.3800, 51.3400; % LEJ
    11.5833, 48.3333; % MUC
     7.4554, 52.0869; % FMO
    11.0787, 49.4530; % NUE
     8.6493, 52.1208; % PAD
     9.1815, 48.7785; % STR
     6.3950, 51.2095; % NRN
    20.7878, 37.0684; % PVK
    23.9495, 37.9356; % ATH
    25.1861, 35.3406; % HER
    20.2904, 38.2493; % EFL
    24.1457, 35.5419; % CHQ
    19.9114, 39.6006; % CFU
    25.4340, 36.4006; % KGS
    21.2658, 39.1464; % MJT
    25.4497, 37.4320; % JMK
    28.2170, 36.4344; % RHO
    22.9915, 40.5722; % SKG
    26.9693, 36.7894; % SMI
    25.4818, 36.4058; % JTR
    26.4115, 39.1211; % JSI
    20.5104, 37.9339; % ZTH
    -8.4924, 51.8850; % ORK
    -6.2594, 53.9942; % DUB
    -8.6040, 54.1742; % NOC
    -8.6328, 56.2354; % KIR
    -8.8664, 52.6793; % SNN
   -22.6058, 63.9850; % KEF
     8.2076, 40.5716; % AHO
    13.2377, 43.6134; % AOI
    16.8515, 41.1173; % BRI
     9.7076, 45.6910; % BGY
    11.2874, 44.5462; % BLQ
    15.7750, 41.6914; % BDS
     9.0505, 39.2236; % CAG
    15.0160, 37.7404; % CTA
    19.2850, 39.7133; % CIY
    11.2500, 43.7687; % FLR
    15.6300, 38.0936; % GOA
    16.2633, 38.7317; % SUF
     9.2796, 45.6273; % LIN
     8.7235, 45.6303; % MXP
    14.2681, 40.8522; % NAP
     9.5214, 40.6413; % OLB
    13.3615, 38.1157; % PMO
    12.3911, 43.1106; % PEG
    11.8869, 42.4661; % PSR
    10.4019, 43.7106; % PSA
    12.4528, 41.9308; % CIA
    12.2500, 41.8050; % FCO
     7.6661, 45.0703; % TRN
    12.5706, 37.9104; % TPS
    12.2415, 45.6371; % TSF
    13.7681, 45.8234; % TRS
    12.3155, 45.4408; % VCE
    10.9916, 45.4386; % VRN
    76.1190, 52.4449; % ALA
     0.3828, 51.4915; % TSE
    20.4633, 44.8186; % PRN
    24.1240, 56.9704; % RIX
    88.1512, 54.7440; % KUN
    25.2794, 54.6892; % VNO
     6.1300, 49.6117; % LUX
    21.4530, 41.9981; % SKP
    14.5132, 35.8852; % MLA
    13.6136, 46.0953; % RMO
    19.2630, 42.4410; % TGD
    18.7556, 42.5433; % TIV
    15.4239, 66.0980; % AES
     5.3220, 60.3913; % BGO
    14.4280, 67.2782; % BOO
     5.3286, 60.4767; % HAU
    10.7500, 60.4583; % KRS
    11.0667, 60.1211; % OSL
    10.2700, 59.0844; % TRF
     5.2325, 58.8975; % SVG
    18.7906, 69.6833; % TOS
    10.3925, 63.4308; % TRD
     4.7639, 52.3086; % AMS
     5.3744, 51.4500; % EIN
     5.8833, 51.1833; % MST
     4.4204, 51.9225; % RTM
    17.0389, 51.0975; % WRO
    19.9458, 50.0667; % KRK
    18.6460, 54.3725; % GDN
    19.0333, 50.2333; % KTW
    16.9692, 51.7811; % POZ
    14.5667, 53.7167; % SZZ
    21.0122, 52.2298; % WAW
    20.6398, 52.4246; % WMI
    -7.9276, 37.0146; % FAO
    -9.1350, 38.7742; % LIS
   -16.9244, 32.6667; % FNC
   -25.6667, 37.7333; % PDL
    -8.6416, 41.2340; % OPO
    -2.0975, 57.1870; % ABZ
    -5.8728, 54.6050; % BHD
    -5.9300, 54.5970; % BFS
    -1.7634, 52.5094; % BHX
    -2.7171, 51.3790; % BRS
    -3.3431, 51.4775; % CWL
    -1.3260, 52.8314; % EMA
    -3.1883, 55.9533; % EDI
    -3.4333, 50.7314; % EXT
    -4.2644, 55.8617; % GLA
    -4.6106, 55.5172; % PIK
    -2.2121, 49.2884; % JER
    -1.6608, 53.8664; % LBA
    -3.0000, 53.3833; % LPL
    -0.0542, 51.5061; % LCY
    -0.1905, 51.1464; % LGW
    -0.4543, 51.4700; % LHR
    -0.4220, 51.8748; % LTN
    0.7160, 51.5603;  % SEN
    0.2325, 51.8890;  % STN
   -2.2721, 53.3652;  % MAN
   -1.6177, 54.9715;  % NCL
   -1.4041, 50.9090;  % SOU
   16.6072, 49.1950;  % BRQ
   14.4208, 50.0878;  % PRG
   26.1025, 44.4268;  % OTP
   23.6236, 46.7712;  % CLJ
   27.5897, 47.1811;  % IAS
   24.3344, 45.8625;  % SBZ
   21.2087, 45.7480;  % TSR
   39.1911, 45.0458;  % KRR
   37.9024, 55.4120;  % DME
   37.4140, 55.9674;  % SVO
   37.2631, 55.6119;  % VKO
   30.3141, 59.9386;  % LED
   40.5930, 44.2290;  % AER
   20.4633, 44.8186;  % BEG
   19.8318, 45.2661;  % INI
   17.1078, 48.1517;  % BTS
   12.7312, 49.0504;  % KSC
   14.5147, 46.0494;  % LJU
   -0.4825, 38.2239;  % ALC
   -0.5921, 38.7419;  % LEI
   -6.0450, 43.5356;  % OVD
    2.0833, 41.2977;  % BCN
   -1.7911, 43.3083;  % BIO
  -13.5998, 28.9465;  % FUE
    3.1667, 41.9000;  % GRO
  -15.3862, 27.9308;  % LPA
   -3.6067, 37.1883;  % GRX
    1.4319, 38.9083;  % IBZ
   -6.3489, 36.8622;  % XRY
  -13.5894, 28.7478;  % SPC
  -13.5998, 28.9465;  % ACE
   -3.7033, 40.4167;  % MAD
   -4.4203, 36.6769;  % AGP
    4.2394, 39.8510;  % MAH
    2.7019, 39.5678;  % PMI
   -0.0428, 38.9642;  % RMU
    2.8488, 43.1578;  % REU
   -1.7870, 43.3386;  % SDR
   -0.8630, 42.8844;  % SCQ
    -0.8810, 41.6488; % ZAZ
    -5.9820, 37.3880; % SVQ
   -16.2517, 28.5510; % TFN
   -16.7376, 28.0970; % TFS
    -0.4818, 39.4892; % VLC
    12.2967, 57.7110; % GOT
    13.3744, 55.5300; % MMX
    18.0686, 59.3293; % ARN
    18.0649, 59.3326; % BMA
    16.5830, 58.7850; % NYO
     7.5964, 47.5913; % BSL
     6.1083, 46.2333; % GVA
     8.5490, 47.4640; % ZRH
    29.0296, 40.1219; % ADA
    32.8597, 39.9334; % ESB
    30.7075, 36.8767; % AYT
    28.7833, 37.1766; % DLM
    28.7519, 41.2753; % IST
    29.3094, 40.9762; % SAW
    27.8556, 37.3792; % BJV
    27.1620, 38.2921; % ADB
    41.1022, 40.9569; % TZX
    44.6333, 43.8333; % HRK
    30.5216, 50.4486; % KBP
    30.5234, 50.4501; % IEV
    23.9121, 50.5531; % LWO
    30.7222, 46.2283; % ODS
    19.0402, 47.4979; % BUD
    21.6268, 47.5384; % DEB
];

% Corresponding IATA codes
AIRPORTS_labels = {
    'TIA', 'EVN', 'GRZ', 'INN', 'KLU', 'LNZ', 'SZG', 'VIE', 'GYD', 'ANR',...  
    'BRU', 'CRL', 'OST', 'MSQ', 'SJJ', 'TZL', 'BOJ', 'SOF', 'VAR', 'LCA',...  
    'PFO', 'DBV', 'RJK', 'PUY', 'SPU', 'ZAG', 'ZAD', 'AAL', 'AAR', 'BLL',...  
    'CPH', 'FAE', 'TLL', 'HEL', 'KTT', 'OUL', 'RVN', 'TMP', 'TKU', 'VAA',...  
    'AJA', 'BIA', 'EGC', 'BIQ', 'BOD', 'BES', 'FSC', 'LIL', 'LYS', 'MRS',...  
    'MPL', 'NTE', 'NCE', 'BVA', 'CDG', 'ORY', 'RNS', 'RUN', 'SXB', 'TLN',...  
    'TLS', 'KUT', 'TBS', 'FMM', 'HAM', 'BER', 'BRE', 'CGN', 'DTM', 'DRS',...  
    'DUS', 'FRA', 'HHN', 'FDH', 'HAJ', 'FKB', 'LEJ', 'MUC', 'FMO', 'NUE',...  
    'PAD', 'STR', 'NRN', 'PVK', 'ATH', 'HER', 'EFL', 'CHQ', 'CFU', 'KGS',...  
    'MJT', 'JMK', 'RHO', 'SKG', 'SMI', 'JTR', 'JSI', 'ZTH', 'ORK', 'DUB',...  
    'NOC', 'KIR', 'SNN', 'KEF', 'AHO', 'AOI', 'BRI', 'BGY', 'BLQ', 'BDS',...  
    'CAG', 'CTA', 'CIY', 'FLR', 'GOA', 'SUF', 'LIN', 'MXP', 'NAP', 'OLB',...  
    'PMO', 'PEG', 'PSR', 'PSA', 'CIA', 'FCO', 'TRN', 'TPS', 'TSF', 'TRS',...  
    'VCE', 'VRN', 'ALA', 'TSE', 'PRN', 'RIX', 'KUN', 'VNO', 'LUX', 'SKP',... 
    'MLA', 'RMO', 'TGD', 'TIV', 'AES', 'BGO', 'BOO', 'HAU', 'KRS', 'OSL',...  
    'TRF', 'SVG', 'TOS', 'TRD', 'AMS', 'EIN', 'MST', 'RTM', 'WRO', 'KRK',...  
    'GDN', 'KTW', 'POZ', 'SZZ', 'WAW', 'WMI', 'FAO', 'LIS', 'FNC', 'PDL',...  
    'OPO', 'ABZ', 'BHD', 'BFS', 'BHX', 'BRS', 'CWL', 'EMA', 'EDI', 'EXT',...  
    'GLA', 'PIK', 'JER', 'LBA', 'LPL', 'LCY', 'LGW', 'LHR', 'LTN', 'SEN',...  
    'STN', 'MAN', 'NCL', 'SOU', 'BRQ', 'PRG', 'OTP', 'CLJ', 'IAS', 'SBZ',...  
    'TSR', 'KRR', 'DME', 'SVO', 'VKO', 'LED', 'AER', 'BEG', 'INI', 'BTS',...  
    'KSC', 'LJU', 'ALC', 'LEI', 'OVD', 'BCN', 'BIO', 'FUE', 'GRO', 'LPA',...  
    'GRX', 'IBZ', 'XRY', 'SPC', 'ACE', 'MAD', 'AGP', 'MAH', 'PMI', 'RMU',...  
    'REU', 'SDR', 'SCQ', 'ZAZ', 'SVQ', 'TFN', 'TFS', 'VLC', 'GOT', 'MMX',...  
    'ARN', 'BMA', 'NYO', 'BSL', 'GVA', 'ZRH', 'ADA', 'ESB', 'AYT', 'DLM',...  
    'IST', 'SAW', 'BJV', 'ADB', 'TZX', 'HRK', 'KBP', 'IEV', 'LWO', 'ODS',... 
    'BUD', 'DEB'
};

%% Sort alphabetically the airports (AMPL will do this)

% Sort labels alphabetically and get sorting indices
[AIRPORTS_labels, alpha_index] = sort(AIRPORTS_labels);

% Reorder data based on sorting indices
AIRPORTS = AIRPORTS(alpha_index, :);

% Display sorted labels and corresponding data
disp('Sorted Labels:');
disp(AIRPORTS_labels);

disp('Sorted Data:');
disp(AIRPORTS);

%% REGIONS

% Divide in regions
w=0.1; % Regions width (longitude span)
h=0.1; % Regions height (latitude span)
Wmin=-10; % Region minimum longitude
Wmax=30; % Region maximum longitude
Hmin=40; % Region minimum latitude
Hmax=60; % Region maximum latitude

totalREGIONS=[]; 

i=0;
for y=Hmin:h:Hmax

    for x=Wmin:w:Wmax

        i=i+1;

        totalREGIONS=[totalREGIONS; i x y];

    end

end

%% Keep LAND ZONES

% Load the built-in coastline data
coast = load('coastlines');

% Check if each coordinate is on land
results = arrayfun(@(lat, lon) checkLand(lat, lon, coast), totalREGIONS(:,3), totalREGIONS(:,2));

REGIONS=[];

for i=1:length(results)

    if results(i)==1

        REGIONS=[REGIONS; totalREGIONS(i,:)];

    end

end

% Plot the land zones
figure (1)
plot(REGIONS(:,2),REGIONS(:,3),'d')

%% See if regions are covered by airports -> matrix [airport,zones]

d_coverage=500/111; % 500 km coverage of a SBAS station

T=false(length(REGIONS),length(AIRPORTS));

for n=1:length(AIRPORTS)

    x_A=AIRPORTS(n,:);
    
    for m=1:length(REGIONS)

        % Compute the coordinates of the 4 vertexes of the zones
        x1=[REGIONS(m,2)-w/2 REGIONS(m,3)-h/2];
        x2=[REGIONS(m,2)+w/2 REGIONS(m,3)-h/2];
        x3=[REGIONS(m,2)+w/2 REGIONS(m,3)+h/2];
        x4=[REGIONS(m,2)-w/2 REGIONS(m,3)+h/2];

        % Compute the distances from the airport
        d1=sqrt((x_A(1)-x1(1))^2+(x_A(2)-x1(2))^2);
        d2=sqrt((x_A(1)-x2(1))^2+(x_A(2)-x2(2))^2);
        d3=sqrt((x_A(1)-x3(1))^2+(x_A(2)-x3(2))^2);
        d4=sqrt((x_A(1)-x4(1))^2+(x_A(2)-x4(2))^2);

        % Assign the matrix value (1 if covered, 0 otherwise)
        if max([d1 d2 d3 d4])<=d_coverage
            T(m,n)=true;
        end
    end
end

%% Plot the coverage

figure(1)
hold on

% Plot airports
plot(AIRPORTS(:,1),AIRPORTS(:,2),'o')

% Plot covered zones
for a=1:length(AIRPORTS)
potential_coverage=[];
for m=1:length(REGIONS)
    if (T(m,a))==1
        potential_coverage=[potential_coverage; REGIONS(m,2:3)];
    end
end
    if size(potential_coverage)~=0
    figure(1)
    plot(potential_coverage(:,1),potential_coverage(:,2),'*')
    end
end

% Visualize only zones in the selected limits
xlim([Wmin Wmax]);
ylim([Hmin Hmax]);
title('Busiest airports in Europe SBAS coverage')
legend('Land Zones','Airports','Covered Zones')
xlabel('Longitude');
ylabel('Latitude');

%% Define costs 

% Unitary cost of a station
u_cost=1; 
% Same cost for every station
costs=u_cost.*ones(size(AIRPORTS,1));

%% Export the AMPL formulation

% Open the text file
fileID = fopen('SBAS.dat', 'w');

% Write the regions set
fprintf(fileID, 'set REGIONS:= \n');
for i = 1:size(REGIONS)
            fprintf(fileID, '%d ',i);
end
fprintf(fileID, ';');
fprintf(fileID, '\n');

% Write the airports set
fprintf(fileID, 'set AIRPORTS:= \n');
for i = 1:size(AIRPORTS_labels,2)
            fprintf(fileID, '%s ', AIRPORTS_labels{i});
end
fprintf(fileID, ';');
fprintf(fileID, '\n');

% Write the numerical AMPL matrix
fprintf(fileID, 'param T : ');

% Write the combined matrix to the file
for i = 1:size(AIRPORTS_labels,2)
            fprintf(fileID, '%s ', AIRPORTS_labels{i});
end
fprintf(fileID, ':=');
fprintf(fileID, '\n');
for i = 1:size(T,1)
    % Print the column with the zone index
    fprintf(fileID, '%d ',i);
    % Print the row with the T matrix content
    for j = 1:size(T, 2)
            fprintf(fileID, '%d ', T(i,j));
    end
    if i==size(T,1)
        fprintf(fileID, ';');
    end
    fprintf(fileID, '\n');
end
fprintf(fileID, '\n');

% Write the costs vector
fprintf(fileID, 'param costs:= \n');
for i = 1:size(costs)
            fprintf(fileID, '%s ', AIRPORTS_labels{i});
            fprintf(fileID, '%d ', costs(i));
            if i==size(costs)
                fprintf(fileID, ';');
            end
            fprintf(fileID, '\n');
end

% Close the file
fclose(fileID);

%% Plot map

% Define latitude and longitude limits
latlim = [Hmin, Hmax]; % Latitude limits
lonlim = [Wmin, Wmax]; % Longitude limits

% Create a figure
figure;

% Plot the map with the specified limits
geoplot([], []);

% Set the geographic limits of the map
geolimits(latlim, lonlim);

% Add a title to the map
title('Potential coverage on the map');

% Optionally, add other geographic features (e.g., coastlines, land areas)
hold on;

% Plot covered zones
for a = 1:length(AIRPORTS)
    potential_coverage = [];
    for m = 1:length(REGIONS)
        if (T(m,a)) == 1
            potential_coverage = [potential_coverage; REGIONS(m,2:3)];
        end
    end
    if ~isempty(potential_coverage)
        geoscatter(potential_coverage(:,2), potential_coverage(:,1), '*');
    end
end

% Plot airports
geoscatter(AIRPORTS(:,2), AIRPORTS(:,1), 'ko', 'filled');

% Optionally, adjust map display properties
geobasemap('streets');