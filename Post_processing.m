%% Post-process AMPL results

% Read the csv file
results=importdata('results.csv');

% Extract variable x and total cost optimal values
x_opt=results.data(1:length(AIRPORTS));
total_cost=results.data(end);

figure
hold on;
plot(REGIONS(:,2),REGIONS(:,3),'d')
% Plot covered zones
for a=1:length(AIRPORTS)
    if x_opt(a)==1
        % Plot airports
        plot(AIRPORTS(a,1),AIRPORTS(a,2),'o')
        % Build coverage vector
        coverage=[];
        for m=1:length(REGIONS)
            if (T(m,a))==1
                coverage=[coverage; REGIONS(m,2:3)];
            end
        end
            if size(coverage)~=0
            plot(coverage(:,1),coverage(:,2),'*')
            end
    end
end

% Visualize only zones in the selected limits
xlim([Wmin Wmax]);
ylim([Hmin Hmax]);
title('Coverage after optimization')
legend('Land Zones','Airports','Covered Zones')
xlabel('Longitude');
ylabel('Latitude');

% Print airports with station installed at optimality
disp('The stations are installed in the following airports:');
for i=1:length(AIRPORTS)
    if x_opt(i)==1
        disp(AIRPORTS_labels{i});
    end
end

% Print cost with station installed at optimality
disp('The cost at optimality is:');
disp(total_cost)

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
title('Coverage at optimality on the map');

% Optionally, add other geographic features (e.g., coastlines, land areas)
hold on;

% Plot covered zones
for a = 1:length(AIRPORTS)
    coverage = [];
    if x_opt(a)==1
    for m = 1:length(REGIONS)
        if (T(m,a)) == 1
            coverage = [coverage; REGIONS(m,2:3)];
        end
    end
    if ~isempty(coverage)
        geoscatter(coverage(:,2), coverage(:,1), '*');
    end
    end
end

% Plot airports
for a = 1:length(AIRPORTS)
    if x_opt(a)==1
        geoscatter(AIRPORTS(a,2), AIRPORTS(a,1), 'ko', 'filled');
    end
end

% Optionally, adjust map display properties
geobasemap('streets');