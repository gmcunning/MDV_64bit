#!/usr/bin/env bash

MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.model -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/model/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/opt/mdv/model/20201117/g_140000/f_00010800.mdv  -out /d1/cunning/data/64-bit_mdv/fip/compare/g2m_test1.nc  -reportFile  /d1/cunning/data/64-bit_mdv/fip/compare/g2m_test_1.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.model -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/model/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/model/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/g2m_test2.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/g2m_test_2.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.model -file1 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/model/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/opt/mdv/model/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/g2m_test3.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/g2m_test_3.txt
#
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.model -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/model_pres/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/opt/mdv/model_pres/20201117/g_140000/f_00010800.mdv  -out /d1/cunning/data/64-bit_mdv/fip/compare/h2p_test1.nc  -reportFile  /d1/cunning/data/64-bit_mdv/fip/compare/h2p_test_1.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.model -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/model_pres/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/model_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/h2p_test2.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/h2p_test_2.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.model -file1 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/model_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/opt/mdv/model_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/h2p_test3.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/h2p_test_3.txt
#
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.derived_model -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/derived_model_pres/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/opt/mdv/derived_model_pres/20201117/g_140000/f_00010800.mdv  -out /d1/cunning/data/64-bit_mdv/fip/compare/mdm_test1.nc  -reportFile  /d1/cunning/data/64-bit_mdv/fip/compare/mdm_test_1.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.derived_model -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/derived_model_pres/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/derived_model_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/mdm_test2.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/mdm_test_2.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.derived_model -file1 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/derived_model_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/opt/mdv/derived_model_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/mdm_test3.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/mdm_test_3.txt
#
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.fip -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/fip_pres/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/opt/mdv/fip_pres/20201117/g_140000/f_00010800.mdv  -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_pres_test1.nc  -reportFile  /d1/cunning/data/64-bit_mdv/fip/compare/fip_pres_test_1.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.fip -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/fip_pres/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/fip_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_pres_test2.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/fip_pres_test_2.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.fip -file1 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/fip_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/opt/mdv/fip_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_pres_test3.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/fip_pres_test_3.txt
#
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.fip -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/fip_flight/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/opt/mdv/fip_flight/20201117/g_140000/f_00010800.mdv  -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_flt_test1.nc  -reportFile  /d1/cunning/data/64-bit_mdv/fip/compare/fip_flt_test_1.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.fip -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/fip_flight/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/fip_flight/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_flt_test2.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/fip_flt_test_2.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.fip -file1 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/fip_flight/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/opt/mdv/fip_flight/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_flt_test3.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/fip_flt_test_3.txt
#
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.ice_cat -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/fip_ice_cat/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/opt/mdv/fip_ice_cat/20201117/g_140000/f_00010800.mdv  -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_ice_cat_test1.nc  -reportFile  /d1/cunning/data/64-bit_mdv/fip/compare/fip_ice_cat_test_1.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.ice_cat -file1  /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/fip_ice_cat/20201117/g_140000/f_00010800.mdv  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/fip_ice_cat/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_ice_cat_test2.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/fip_ice_cat_test_2.txt
MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.ice_cat -file1 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/fip_ice_cat/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc  -file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/opt/mdv/fip_ice_cat/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc -out /d1/cunning/data/64-bit_mdv/fip/compare/fip_ice_cat_test3.nc -reportFile /d1/cunning/data/64-bit_mdv/fip/compare/fip_ice_cat_test_3.txt
