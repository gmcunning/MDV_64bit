#!/usr/bin/env bash

# simple script to run the FIP process chain for the MDV 64-bit research
exec_dir=/home/cunning/exec/bin
param_dir=/home/cunning/git/MDV_64bit/research/cip/params
data_dir=/d1/cunning/data/64-bit_mdv/cip

g2m_m_infile=$data_dir/raw/20201117_i14_f003_HRRR-NCEP_wrfnat.grb2
g2m_m_param=$param_dir/Grib2toMdv.hrrr-nat_ncep
g2m_app=$exec_dir/Grib2toMdv

h2p_infie=$data_dir/mdv/model/hrrr_nat/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc
h2p_param=$param_dir/Hybrid2Pressure.hrrr
h2p_app=$exec_dir/Hybrid2Pressure

m2m_infile=$data_dir/mdv/model/hrrr_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc
m2m_param=$param_dir/MdvDeriveModel.hrrr
m2m_app=$exec_dir/MdvDeriveModel

gn2m_vis_infile=$data_dir/raw/OR_ABI-L1b-RadF-M6C02_G16_s20203221650149_e20203221659457_c20203221659506.nc
gn2m_vis_param=$param_dir/GoesRnetCDF2Mdv.vis
gn2m_app=$exec_dir/GoesRnetCDF2Mdv

gn2m_lwir_infile=$data_dir/raw/OR_ABI-L1b-RadF-M6C14_G16_s20203221650149_e20203221659457_c20203221659538.nc
gn2m_lwir_param=$param_dir/GoesRnetCDF2Mdv.lwir
gn2m_app=$exec_dir/GoesRnetCDF2Mdv

gn2m_swir_infile=$data_dir/raw/OR_ABI-L1b-RadF-M6C07_G16_s20203221650149_e20203221659469_c20203221659523.nc
gn2m_swir_param=$param_dir/GoesRnetCDF2Mdv.swir
gn2m_app=$exec_dir/GoesRnetCDF2Mdv

mcbn_param=$param_dir/MdvCombine.sat
mcbn_app=$exec_dir/MdvCombine

sd_infile=$data_dir/mdv/satellite/cmbn/20201117/20201117_165015.mdv.cf.nc
sd_param=$param_dir/satDerive.conus
sd_app=$exec_dir/satDerive

g2m_r_infile=$data_dir/raw/MRMS_170640.grib2
g2m_r_param=$param_dir/Grib2toMdv.hrrr.mrms.full

mc2s_infile="$data_dir/raw/20201117_1600.metar.csv $data_dir/raw/20201117_1700.metar.csv"
mc2s_param=$param_dir/MetarCsv2Spdb.hrrr.cip-spdb.full
mc2s_app=$exec_dir/MetarCsv2Spdb

mm_param=$param_dir/MetarMapper.hrrr.cip-spdb.full
mm_app=$exec_dir/MetarMapper

cmm_infile=$data_dir/mdv/model/hrrr_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc
cmm_param=$param_dir/createModelMetars.hrrr.cip
cmm_app=$exec_dir/createModelMetars

mb_param=$param_dir/MdvBlender.hrrr.cip.full
mb_app=$exec_dir/MdvBlender

pc2s_infile="$data_dir/raw/20201117_1600.pirep.csv $data_dir/raw/20201117_1700.pirep.csv"
pc2s_param=$param_dir/PirepCsv2Spdb.hrrr.cip.full
pc2s_app=$exec_dir/PirepCsv2Spdb

pm_param=$param_dir/PirepMapper.hrrr.cip-spdb.full
pm_app=$exec_dir/PirepMapper

ls_infile="$data_dir/raw/2020111716.nldn $data_dir/raw/2020111717.nldn"
ls_param=$param_dir/Ltg2Spdb.nldn-bin
ls_app=$exec_dir/Ltg2Spdb

ls2m_param=$param_dir/LtgSpdb2Mdv.hrrr.cip.full
ls2m_app=$exec_dir/LtgSpdb2Mdv

ca_param=$param_dir/CipAlgo.hrrr.tiled
ca_app=$exec_dir/CipAlgo

p2f_infile=$data_dir/mdv/cip/pressure/20201117/20201117_171500.mdv.cf.nc
p2f_param=$param_dir/pressure2flight.hrrr
p2f_app=$exec_dir/pressure2flight

ic_infile=$data_dir/mdv/cip/flight/20201117/20201117_171500.mdv.cf.nc
ic_param=$param_dir/IcingCategory.hrrr.grib2
ic_app=$exec_dir/IcingCategory

m2g_infile=$data_dir/mdv/cip_hrrr_ice_cat/20201117/20201117_171500.mdv.cf.nc
m2g_parm=$param_dir/MdvtoGrib2.cip_hrrr
m2g_app=$exec_dir/MdvtoGrib2

# remove output files before starting
/bin/rm -r $data_dir/grib2
/bin/rm -r $data_dir/mdv
/bin/rm -r $data_dir/spdb


# run Grib2toMdv for the model
$g2m_app -params $g2m_m_param -f $g2m_m_infile

# run Hybrid2Pressure
$h2p_app -params $h2p_param -if $h2p_infie

# run MdvDeriveModel
$m2m_app -params $m2m_param -if $m2m_infile

# run creatModelMetars
$cmm_app -params $cmm_param -if $cmm_infile

# run GoesRnetCDF2Mdv
$gn2m_app -params $gn2m_vis_param -f $gn2m_vis_infile
$gn2m_app -params $gn2m_lwir_param -f $gn2m_lwir_infile
$gn2m_app -params $gn2m_swir_param -f $gn2m_swir_infile

# run MdvCombine
$mcbn_app -params $mcbn_param -start "2020 11 17 16 45 00" -end "2020 11 17 17 15 00"

# run satDerive
$sd_app -params $sd_param -if $sd_infile

# run Grib2toMdv for the radar
$g2m_app -params $g2m_r_param -f $g2m_r_infile

# run MetarCsv2Spdb
$mc2s_app -params $mc2s_param -f $mc2s_infile

# run MetarMapper
$mm_app -params $mm_param -start_time "2020 11 17 16 00 00" -end_time "2020 11 17 17 00 00"

# run MdvBlender
$mb_app -params $mb_param -start "2020 11 17 16 50 00" -end "2020 11 17 17 10 00"

# run PirepCsv2Spdb
$pc2s_app -params $pc2s_param -f $pc2s_infile

# run PireprMapper
$pm_app -params $pm_param -run_time "2020 11 17 17 00 00"

# run Ltg2Spdb
$ls_app -params $ls_param -f $ls_infile

# run LtgSpdb2Mdv
$ls2m_app -params $ls2m_param  -start "2020 11 17 16 30 00" -end "2020 11 17 17 00 00"

# run CipAlgo
$ca_app -params $ca_param -run_time "2020 11 17 17 15 00"

# run pressure2flight
$p2f_app -params $p2f_param -if $p2f_infile


# run IcingCategory
$ic_app -params $ic_param -if $ic_infile


# run MdvtoGrib2
$m2g_app -params $m2g_parm -file $m2g_infile
