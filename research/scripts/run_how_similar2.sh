#!/usr/bin/env bash


MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/fip/params/MdvHowSimilar.fip \
-file1 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/cvs-ral/debug/mdv/fip_pres/20201117/g_140000/f_00010800.mdv \
-file2 /d1/cunning/data/64-bit_mdv/fip/wrf-rr/lrose-core/debug/mdv/fip_pres/20201117/g_140000/20201117_g_140000_f_00010800.mdv.cf.nc \
-out /d1/cunning/data/64-bit_mdv/fip/compare/fip_pres_test999.nc \
-reportFile /d1/cunning/data/64-bit_mdv/fip/compare/fip_pres_test_999.txt

MdvHowSimilar -params /home/cunning/git/MDV_64bit/research/ipaf/params/MdvHowSimilar.fip \
-file1 /d1/cunning/data/64-bit_mdv/ipaf/wrfrr-ak/cvs-ral/debug/mdv/fip_pres/20210224/g_150000/f_00010800.mdv  \
-file2 /d1/cunning/data/64-bit_mdv/ipaf/wrfrr-ak/lrose-core/debug/mdv/fip_pres/20210224/g_150000/20210224_g_150000_f_00010800.mdv.cf.nc \
-out /d1/cunning/data/64-bit_mdv/ipaf/compare/fip_pres_test999.nc \
-reportFile /d1/cunning/data/64-bit_mdv/ipaf/compare/fip_pres_test_999.txt




