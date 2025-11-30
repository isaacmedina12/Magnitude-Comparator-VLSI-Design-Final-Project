*Custom Compiler Version W-2024.09-2
*Tue Nov 18 20:33:27 2025


********************************************************************************
* Library          : finalproject
* Cell             : comparator_v1
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.lib '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/tech/hspice/saed32nm.lib' TT
.include '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/lib/stdcell_rvt/hspice/saed32nm_rvt.spf'
.option post
.model n105 nmos level=54
.model p105 pmos level=54

.subckt comparator_v1 a0 a0_in a0_not a1 a1_in a1_not b0 b0_in b0_not b1 b1_in
+ b1_not e g gnd_1 g_not l l_not vdd xnor_out
xm101 e l net163 vdd p105 w=0.48u l=100n nf=1 m=1
xm100 net163 g vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm77 l l_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm75 net155 a1_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm74 net155 b1 vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm73 l_not a0_not net155 vdd p105 w=0.48u l=100n nf=1 m=1
xm72 l_not b0 net155 vdd p105 w=0.48u l=100n nf=1 m=1
xm71 l_not xnor_out net155 vdd p105 w=0.48u l=100n nf=1 m=1
xm65 g g_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm1 net125 b1_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm0 net125 a1 vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm4 g_not b0_not net125 vdd p105 w=0.48u l=100n nf=1 m=1
xm3 g_not a0 net125 vdd p105 w=0.48u l=100n nf=1 m=1
xm2 g_not xnor_out net125 vdd p105 w=0.48u l=100n nf=1 m=1
xm111 xnor_out b1 net247 vdd p105 w=0.48u l=100n nf=1 m=1
xm110 xnor_out b1_not net243 vdd p105 w=0.48u l=100n nf=1 m=1
xm109 net243 a1_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm108 net247 a1 vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm21 b1 b1_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm29 b0 b0_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm28 b0_not b0_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm20 b1_not b1_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm5 a1_not a1_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm14 a0 a0_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm6 a1 a1_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm13 a0_not a0_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm103 e l gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm102 e g gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm76 l l_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm70 net156 a1_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm69 l_not b1 net156 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm68 net158 a0_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm67 net157 b0 net158 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm66 l_not xnor_out net157 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm64 g g_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm12 net121 b1_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm10 g_not a1 net121 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm15 net113 b0_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm11 net109 a0 net113 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm9 g_not xnor_out net109 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm105 net229 b1 gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm104 net233 b1_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm106 xnor_out a1_not net229 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm107 xnor_out a1 net233 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm31 b0 b0_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm23 b1 b1_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm30 b0_not b0_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm22 b1_not b1_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm7 a1_not a1_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm8 a1 a1_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm16 a0_not a0_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm17 a0 a0_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
.ends comparator_v1

.param VDDVAL = 1.05

VDD   vdd   0  DC VDDVAL
* tie ground net in subckt to node 0
Rgnd  gnd_1 0  0


* --- 4-bit binary counter on A1,A0,B1,B0 via *_in pins ---

* LSB: B0_in
Vb0in b0_in 0 PULSE(VDDVAL 0  0 1p 1p 10n 20n)

* Next bit: B1_in 
Vb1in b1_in 0 PULSE(VDDVAL 0  0 1p 1p 20n 40n)

* Next bit: A0_in 
Va0in a0_in 0 PULSE(VDDVAL 0  0 1p 1p 40n 80n)

* MSB: A1_in 
Va1in a1_in 0 PULSE(VDDVAL 0 0 1p 1p 80n 160n)

* --- instantiate the comparator ---
* external nodes a0, a0_not, etc. are just exposed; we don’t need extra sources on them

XUcmp  a0 a0_in a0_not  a1 a1_in a1_not  b0 b0_in b0_not  b1 b1_in b1_not \
       e  g  gnd_1 g_not  l  l_not  vdd  xnor_out  comparator_v1

* --- transient analysis across all 16 input combinations ---
.tran 0.1n 160n

* --- save / probe signals ---
.probe v(a1_in) v(a0_in) v(b1_in) v(b0_in) v(g) v(e) v(l) v(net243) v(net247) v(net229) v(net233)

.end
