midwest-topo.json: midwest-geo.json
	if [ -a midwest-topo.json ] ; \
	then rm midwest-topo.json ; \
	fi;
	topojson -o midwest-topo.json -p state=STATE,county=COUNTY,fips=FIPS midwest-geo.json

midwest-geo.json:
	#Extract county shapes for Illinois, Indiana, Iowa, Michigan, Minnesota, and Wisconsin
	#The FIPS codes are indexed here: http://www.census.gov/geo/reference/ansi_statetables.html
	if [ -a midwest-geo.json ] ; \
	then rm midwest-geo.json ; \
	fi;
	ogr2ogr \
	  -f GeoJSON \
	  -where "STATE IN ('IL', 'IN', 'IA', 'MI', 'MN', 'WI')" \
	  midwest-geo.json \
	  countyp010_nt00795/countyp010.shp


