#! /bin/bash

# rerun this script if you change the projection

#source ../projection_info.sh
source "$(dirname "$0")/../projection_info.sh"

# Check if we are handling a custom margin
if [[ "$1" == "Custom" ]]; then
    MARGIN_NAME=$2
    MARGIN_FOLDER=$3
    OUTPUT_FILE="${MARGIN_FOLDER}/${MARGIN_NAME}.gmt"
    INPUT_FILE="${MARGIN_FOLDER}/${MARGIN_NAME}.shp"

    # Ensure the input shapefile exists
    if [[ ! -f "${INPUT_FILE}" ]]; then
        echo "Error: Missing shapefile ${INPUT_FILE}. Cannot convert to GMT."
        exit 1
    fi

    # Convert the shapefile to GMT format
    echo "Converting ${INPUT_FILE} to ${OUTPUT_FILE}..."
    ogr2ogr -f "GMT" -t_srs "${wkt_string}" "${OUTPUT_FILE}" "${INPUT_FILE}"

    if [[ $? -ne 0 ]]; then
        echo "Error: Conversion of ${INPUT_FILE} to ${OUTPUT_FILE} failed."
        exit 1
    fi

    echo "Conversion complete: ${OUTPUT_FILE}"
else
    # Handle predefined margins
    for margin in LGM modern_mod modern; do
        echo "Converting ${margin}.shp to ${margin}.gmt..."
        ogr2ogr -f "GMT" -t_srs "${wkt_string}" "${margin}.gmt" "${margin}.shp"
        
        if [[ $? -ne 0 ]]; then
            echo "Error: Conversion of ${margin}.shp to ${margin}.gmt failed."
            exit 1
        fi
    done
fi
