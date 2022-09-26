# Project build script

# From Quartus 1.2 Introductory example
quartus_map filtref --source=filtref.bdf --family="Cyclone V"
quartus_fit filtref --part=EP3C10F256C8 --pack_register=minimize_area
quartus_asm filtref
quartus_sta filtref
