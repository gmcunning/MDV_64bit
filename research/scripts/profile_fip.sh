#!/usr/bin/env bash

# simple script to run the FIP process chain for the MDV 64-bit research

function run_it {



g2m_infile=/d1/cunning/data/64-bit_mdv/fip/raw/20201103_i15_f003_HRRR-NCEP_wrfnat.grb2
g2m_param=/home/cunning/git/MDV_64bit/research/fip/params/Grib2toMdv.hrrr-nat_ncep
g2m_app=/home/cunning/cvs/apps/ingest/src/Grib2toMdv/Grib2toMdv

h2p_infie=/d1/cunning/data/64-bit_mdv/fip/mdv/hrrr_nat/20201103/g_150000/20201103_g_150000_f_00010800.mdv.cf.nc
h2p_param=/home/cunning/git/MDV_64bit/research/fip/params/Hybrid2Pressure.hrrr
h2p_app=/home/cunning/cvs/apps/rucApps/src/Hybrid2Pressure/Hybrid2Pressure

m2m_infile=/d1/cunning/data/64-bit_mdv/fip/mdv/hrrr_pres/20201103/g_150000/20201103_g_150000_f_00010800.mdv.cf.nc
m2m_param=/home/cunning/git/MDV_64bit/research/fip/params/MdvDeriveModel.hrrr
m2m_app=/home/cunning/git/ral-ifi-apps/MdvDeriveModel/MdvDeriveModel

fa_infile=/d1/cunning/data/64-bit_mdv/fip/mdv/derived_hrrr_pres/20201103/g_150000/20201103_g_150000_f_00010800.mdv.cf.nc
fa_param=/home/cunning/git/MDV_64bit/research/fip/params/fip_algo.hrrr
fa_app=/home/cunning/git/ral-ifi-apps/fip_algo/fip_algo

p2f_infile=/d1/cunning/data/64-bit_mdv/fip/mdv/fip_hrrr_pres/20201103/g_150000/20201103_g_150000_f_00010800.mdv.cf.nc
p2f_param=/home/cunning/git/MDV_64bit/research/fip/params/pressure2flight.hrrr
p2f_app=/home/cunning/git/ral-ifi-apps/pressure2flight/pressure2flight

ic_infile=/d1/cunning/data/64-bit_mdv/fip/mdv/fip_hrrr_flight/20201103/g_150000/20201103_g_150000_f_00010800.mdv.cf.nc
ic_param=/home/cunning/git/MDV_64bit/research/fip/params/IcingCategory.hrrr.grib2
ic_app=/home/cunning/git/ral-ifi-apps/IcingCategory/IcingCategory

m2g_infile=/d1/cunning/data/64-bit_mdv/fip/mdv/fip_hrrr_ice_cat/20201103/g_150000/20201103_g_150000_f_00010800.mdv.cf.nc
m2g_parm=/home/cunning/git/MDV_64bit/research/fip/params/MdvtoGrib2.fip_hrrr
m2g_app=/home/cunning/cvs/apps/mdv_utils/src/MdvtoGrib2/MdvtoGrib2

# run Grib2toMdv
echo profiling for Grib2toMdv
valgrind --tool=callgrind --log-file=callgrind_Grib2toMdv.debug.log  $g2m_app -params $g2m_param -f $g2m_infile >& /dev/null

# run Hybrid2Pressure
echo profiling for Hybrid2Pressure
valgrind --tool=callgrind --log-file=callgrind_Hybrid2Pressure.debug.log  $h2p_app -params $h2p_param -if $h2p_infie >& /dev/null

# run MdvDeriveModel
echo profiling for MdvDeriveModel
valgrind --tool=callgrind --log-file=callgrind_MdvDeriveModel.debug.log  $m2m_app -params $m2m_param -if $m2m_infile >& /dev/null

# run fip_algo
echo profiling for fip_algo
valgrind --tool=callgrind --log-file=callgrind_fip_algo.debug.log  $fa_app  -params $fa_param -if $fa_infile >& /dev/null

# run pressure2flight
echo profiling for pressure2flight
valgrind --tool=callgrind --log-file=callgrind_pressure2flight.debug.log  $p2f_app -params $p2f_param -if $p2f_infile >& /dev/null

# run IcingCategory
echo profiling for IcingCategory
valgrind --tool=callgrind --log-file=callgrind_IcingCategory.debug.log  $ic_app -params $ic_param -if $ic_infile >& /dev/null

# run MdvtoGrib2
echo profiling for MdvtoGrib2
valgrind --tool=callgrind --log-file=callgrind_MdvtoGrib2.debug.log   $m2g_app -params $m2g_parm -file $m2g_infile >& /dev/null


}

run_it

