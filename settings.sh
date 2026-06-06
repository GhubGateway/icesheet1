#! /bin/bash
echo "settings.sh: $@"

######################################################
# choose the margin you want to use
######################################################

margin_folder=ice_margins

# Modern margin
#scenario=modern

# Modified modern margin
#scenario=modern_mod

# Last Glacial Maximum margin
#scenario=LGM

scenario=$1
echo "scenario: "${scenario}

# Determine margin and margin_shp based on the scenario
if [[ "${scenario}" == "Custom" ]]; then
    margin_folder="uploaded_margins"
    margin_name=$(basename $(find ${margin_folder} -name "*.shp" | head -n 1) .shp)
    margin="${margin_folder}/${margin_name}.gmt"
    margin_shp="${margin_folder}/${margin_name}.shp"
    #echo "margin_name in settings.sh is:"${margin_name}
    #echo "margin in settings.sh is:"${margin}
    #echo "margin_shp in settings.sh is:"${margin_shp}
else
    margin_folder="ice_margins"
    margin=${scenario}.gmt
    margin_shp=${scenario}.shp
    #margin="${margin_folder}/${scenario}.gmt"
    #margin_shp="${margin_folder}/${scenario}.shp"
    #echo "margin in settings.sh is:"${margin}
    #echo "margin_shp in settings.sh is:"${margin_shp}
fi



######################################################
# Topography parameters
######################################################

topo_folder=topo

# Modern topography for Greenland
topo=Greenland.bin
topo_netcdf=Greenland.nc
topo_param=elev_parameters.txt

#Bedmachine ice thickness

bedmachine_thickness=bedmachine_ice_thickness.nc

######################################################
# Basal Shear Stress parameters
######################################################

shear_stress_folder=shear_stress

shear_stress_model=$2
echo "shear_stress_model: "${shear_stress_model}

if [[ $shear_stress_model == "Bedmachine" ]]; then
    # bedmachine derived shear stress model
    shear_stress=bedmachine_shear_stress.bin
    shear_stress_netcdf=bedmachine_shear_stress.nc
    shear_stress_param=bedmachine_ss_parameters.txt
    domain_file=""
else
    # Shear stress model from Gowan et al 2021
    shear_stress=shear_stress.bin
    shear_stress_netcdf=shear_stress.nc
    shear_stress_param=ss_parameters.txt
    domain_file=shear_stress_domains.shp
fi

######################################################
# Settings for ICESHEET
######################################################

# In meters, minimum distance between flowlines in ICESHEET calculation.
# Recommended to be at maximum the grid spacing (which is 5 km in the example here)
#icesheet_spacing=5000
icesheet_spacing=$3
echo "icesheet_spacing: "${icesheet_spacing}

# In m, the elevation contour interval used in ICESHEET
#icesheet_interval=20
icesheet_interval=$4
echo "icesheet_interval: "${icesheet_interval}

calc_ice_thickness=ice_thickness.nc

