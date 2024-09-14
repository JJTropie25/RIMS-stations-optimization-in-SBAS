% Create a function to check if a coordinate is on land using the coastline data
function isLand = checkLand(lat, lon, coastlines)
    % Use inpolygon to determine if the point is within the coastline polygons
    isLand = inpolygon(lon, lat, coastlines.coastlon, coastlines.coastlat);
end