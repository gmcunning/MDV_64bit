#!/usr/bin/env bash

# simple script to run the FIP process chain for the MDV 64-bit research

# this is a usage statement
general_usage="usage: run_fip.sh [debug|opt] [lrose|cvs] [hrrr|wrf-rr]"

# argument #1 is build type
if [ -z "$1" ]; then
  echo "$general_usage"
  echo "Need to supply build type. Options: [debug|opt]"
  echo "Need to supply MDV source. Options: [lrose|cvs]"
  echo "Need to supply model type. Options: [hrrr|wrf-rr]"
  exit 1
fi

build_debug="debug"
build_opt="opt"
if [ "$1" = "debug" ]; then
  build_type=$build_debug
elif [ "$1" = "opt" ]; then
  build_type=$build_opt
else
  echo "$general_usage"
  echo "Build type is wrong. Options: [debug|opt]"
  exit 1
fi

#argument #2 is MDV source
if [ -z "$2" ]; then
  echo "$general_usage"
  echo "Need to supply MDV source. Options: [lrose|cvs]"
  echo "Need to supply model type. Options: [hrrr|wrf-rr]"
  exit 1
fi

mdv_source_lrose="lrose-core"
mdv_source_cvs="cvs-ral"
if [ "$2" = "lrose" ]; then
  mdv_source=$mdv_source_lrose
elif [ "$2" = "cvs" ]; then
  mdv_source=$mdv_source_cvs
else
  echo "$general_usage"
  echo "MDV source is wrong. Options: [lrose|cvs]"
  exit 1
fi

#argument #3 is model type
if [ -z "$3" ]; then
  echo "$general_usage"
  echo "Need to supply model type. Options: [hrrr|wrf-rr]"
  exit 1
fi

model_type_hrrr="hrrr"
model_type_wrfrr="wrf-rr"
if [ "$3" = "hrrr" ]; then
  model_type=$model_type_hrrr
elif [ "$3" = "wrf-rr" ]; then
  model_type=$model_type_wrfrr
else
  echo "$general_usage"
  echo model type is $3
  echo "Model type is wrong. Options: [hrrr|wrf-rr]"
  exit 1
fi


base_data_dir=/d1/cunning/data/64-bit_mdv/fip/$model_type/$mdv_source/$build_type
model_mdv_dir=$base_data_dir/mdv/model
pres_model_mdv_dir=$base_data_dir/mdv/model_pres
derv_model_mdv_dir=$base_data_dir/mdv/derived_model_pres
fip_pres_mdv_dir=$base_data_dir/mdv/fip_pres
fip_flt_mdv_dir=$base_data_dir/mdv/fip_flight
fip_cat_mdv_dir=$base_data_dir/mdv/fip_ice_cat

param_dir=$HOME/git/MDV_64bit/research/fip/params

export BASE_DATA_DIR=$base_data_dir
export MODEL_MDV_DIR=$model_mdv_dir
export PRES_MODEL_MDV_DIR=$pres_model_mdv_dir
export DERV_MODEL_MDV_DIR=$derv_model_mdv_dir
export FIP_PRES_MDV_DIR=$fip_pres_mdv_dir
export FIP_FLT_MDV_DIR=$fip_flt_mdv_dir
export FIP_CAT_MDV_DIR=$fip_cat_mdv_dir

if [ $mdv_source = $mdv_source_lrose ]; then
  rel_path=20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc
else
  rel_path=20201117/g_140000/f_00010800.mdv
fi


if [ $model_type = $model_type_hrrr ]; then
  g2m_infile=/d1/cunning/data/64-bit_mdv/raw/20201117_i14_f003_HRRR-NCEP_wrfnat.grb2
  topo_file=/d1/cunning/data/64-bit_mdv/static/HRRR_topo.mdv
else
  g2m_infile=/d1/cunning/data/64-bit_mdv/raw/20201117_i14_f003_WRF-RR-NCO.grb2
  topo_file=/d1/cunning/data/64-bit_mdv/static/WRF-RR130_topo.mdv
fi
export TOPO_FILE=$topo_file

g2m_param=$HOME/git/MDV_64bit/research/fip/params/Grib2toMdv.test
g2m_app=$RAP_BIN_DIR/Grib2toMdv

h2p_infile=$model_mdv_dir/$rel_path
h2p_param=$param_dir/Hybrid2Pressure.test
h2p_app=$RAP_BIN_DIR/Hybrid2Pressure

mdm_infile=$pres_model_mdv_dir/$rel_path
mdm_param=$param_dir/MdvDeriveModel.test
mdm_app=$RAP_BIN_DIR/MdvDeriveModel

fa_infile=$derv_model_mdv_dir/$rel_path
fa_param=$param_dir/fip_algo.test
fa_app=$RAP_BIN_DIR/fip_algo

p2f_infile=$fip_pres_mdv_dir/$rel_path
p2f_param=$param_dir/pressure2flight.test
p2f_app=$RAP_BIN_DIR/pressure2flight

ic_infile=$fip_flt_mdv_dir/$rel_path
ic_param=$param_dir/IcingCategory.test
ic_app=$RAP_BIN_DIR/IcingCategory

m2g_infile=$fip_cat_mdv_dir/$rel_path
m2g_parm=$param_dir/MdvtoGrib2.test
m2g_app=$RAP_BIN_DIR/MdvtoGrib2

m2n_infile=$fip_pres_mdv_dir/$rel_path
m2n_param=$param_dir/Mdv2NetCDF.test
m2n_app=$RAP_BIN_DIR/Mdv2NetCDF

# run Grib2toMdv
$g2m_app -params "$g2m_param" -f $g2m_infile

# run Hybrid2Pressure
$h2p_app -params "$h2p_param" -if $h2p_infile

# run MdvDeriveModel
$mdm_app -params "$mdm_param" -if $mdm_infile

# run fip_algo
$fa_app  -params "$fa_param" -if $fa_infile

# run pressure2flight
$p2f_app -params "$p2f_param" -if $p2f_infile

# run IcingCategory
$ic_app -params "$ic_param" -if $ic_infile

# run MdvtoGrib2
$m2g_app -params "$m2g_parm" -file $m2g_infile

# run Mdv2NetCDF if mdv source is ral-cvs
if [ $mdv_source = $mdv_source_cvs ]; then
  echo $m2n_app -params "$m2n_param" -f $m2n_infile

  $m2n_app -params "$m2n_param" -f $m2n_infile
fi
