pico-8 cartridge // http://www.pico-8.com
version 41
__lua__

-- config
#include conf.lua

-- screens
#include screens/start.lua
#include screens/levels.lua
#include screens/game.lua
#include screens/win.lua
#include screens/over.lua

-- levels
#include levels/levels.lua

-- entities
#include player/player.lua
#include bullets/bullets.lua
#include enemies/base.lua
#include enemies/builder.lua
#include enemies/green.lua
#include enemies/red.lua
#include enemies/spinner.lua
#include enemies/boss.lua

-- other
#include background/starfield.lua
#include particals/particals.lua
#include collision/collision.lua

-- tools
#include vec2d/vec2d.lua
#include anim/anim.lua

-- main
#include main.lua

__gfx__
00000000000220000002200000022000000000000000000000000000000000000000000000000000000000000000000000000000088008800880088000000000
000000000028220000288200002282000000000000077000000770000007700000c77c0000077000000000000000000000000000888888888008800800000000
007007000028820000288200002882000000000000c77c000007700000c77c000cccccc000c77c00000000000000000000000000888888888000000800000000
0007700000288e2002e88e2002e882000000000000cccc00000cc00000cccc0000cccc0000cccc00000000000000000000000000888888888000000800000000
00077000027c88202e87c8e20288c72000000000000cc000000cc000000cc00000000000000cc000000000000000000000000000088888800800008000000000
007007000211882028811882028811200000000000000000000cc000000000000000000000000000000000000000000000000000008888000080080000000000
0000000002558d2028d55d8202d85520000000000000000000000000000000000000000000000000000000000000000000000000000880000008800000000000
0000000000299d0002d99d2000d99200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000999900000ee000000000000000000000330033003300330033003300330033000000000000000000000000000000000088088000880880000000000
000000009977990006666000000000000000000033b33b3333b33b3333b33b3333b33b3300000000000000000000000000000000888888808008008000000000
000000009a77a900e6556e0000000000000000003bbbbbb33bbbbbb33bbbbbb33bbbbbb300000000000000000000000000000000888888808000008000000000
000000009a77a900e6556e0000000000000000003b7717b33b7717b33b7717b33b7717b300000000000000000000000000000000888888808000008000000000
000000009a77a9000666600000000000000000000b7117b00b7117b00b7117b00b7117b000000000000000000000000000000000088888000800080000000000
0000000099aa990000ee000000000000000000000037730000377300003773000037730000000000000000000000000000000000008880000088800000000000
0000000009aa90000000000000000000000000000303303003033030030330300303303000000000000000000000000000000000000000000000000000000000
00000000009900000000000000000000000000000300003030000003030000300330033000000000000000000000000000000000000000000000000000000000
066666d0666666d006666d00066666d0666666d0666666d066d066d0600006d0066666d066d066d0666666d0666666d0066666d006666d006d0006d000000000
66ddddd066d006d066dd66d0666dddd066ddddd066d006d066d066d0660006d066ddd6d066d066d066ddddd066d006d0666dddd066dd66d066d066d000000000
66d0000066d006d066d066d066d000006600000066d006d066d066d0666006d06dd006d066d066d06600000066d006d066dd000066d066d0666666d000000000
06666d00666666d066d066d066d0000066666d00666666d066d066d06d6d06d06d0006d066d066d0666666d0666666d066d666d066d066d06d66d6d000000000
0ddd66d066ddddd0666666d066d0000066dddd006d006dd066d066d06d66d6d06d0006d066d066d066ddddd06d006dd066dd06d0666666d06dddd6d000000000
000066d06dd000006d0006d0666d0000660000006d006dd0666666d06d0666d06d0006d006666dd0660000006d006dd0666dd6d06d0006d06d0006d000000000
66666dd06d0000006d0006d0d66666d0666666d06d0066d006666dd06d0066d0666666d00066dd00666666d06d0066d0d66666d06d0006d06d0006d000000000
dddddd00dd000000dd000dd00dddddd0ddddddd0dd00ddd00dddddd0dd00ddd0ddddddd000ddd000ddddddd0dd00ddd00dddddd0dd000dd0dd000dd000000000
66dd06d066d0000000000000000000000000000000000000000000006dd006d0600006d000000000000000000000000000000000000000000000000000000000
666d06d066d00000000000000000000000000000000000000000000066dd06d0600006d000000000000000000000000000000000000000000000000000000000
6d6d06d066d000000000000000000000000000000000000000000000666d06d0666606d000000000000000000000000000000000000000000000000000000000
6d6dd6d066d0000000000000000000000000000000000000000000006d6dd6d0600606d000000000000000000000000000000000000000000000000000000000
6d66d6d066d0000000000000000000000000000000000000000000006d66d6d0600606d000000000000000000000000000000000000000000000000000000000
6d0666d066ddddd000000000000000000000000000000000000000006dd666d0600606d000000000000000000000000000000000000000000000000000000000
6d0666d0666666d000000000000000000000000000000000000000006ddd66d0600666d000000000000000000000000000000000000000000000000000000000
dd00ddd0ddddddd00000000000000000000000000000000000000000dd00ddd0dd000dd000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000070000020000200200002002000020020000205555555555555555555555555555555502222220022222200222222002222220
000bb000000bb0000007700000077000022ff220022ff220022ff220022ff2200578875005788750d562465d0578875022e66e2222e66e2222e66e2222e66e22
0066660000666600606666066066660602ffff2002ffff2002ffff2002ffff2005624650d562465d05177150d562465d27761772277617722776177227716772
0566665065666656b566665bb566665b0077d7000077d700007d77000077d700d517715d051771500566865005177150261aa172216aa162261aa612261aa162
65637656b563765b056376500563765008577580085775800857758008577580056686500566865005d24d50056686502ee99ee22ee99ee22ee99ee22ee99ee2
b063360b006336000063360000633600080550800805508008055080080550805d5245d505d24d500505505005d24d5022299222229999222229922222299222
006336000063360000633600006336000c0000c007c007c007c00c7007c007c05005500505055050050000500505505020999902020000202099990202999920
0006600000066000000660000006600000c7c7000007c0000077cc000007c000dd0000dd0dd00dd005dddd500dd00dd022000022022002202200002202200220
00ff880000ff88000000000000000000200000020200002000000000000000003350053303500530000000000000000000000000000000000000000000000000
0888888008888880000000000000000022000022220000220000000000000000330dd033030dd030005005000350053000000000000000000000000000000000
06555560076665500000000000000000222222222222222200000000000000003b8dd8b3338dd833030dd030030dd03003e33e300e33e330033e333003e333e0
6566665576555565000000000000000028222282282222820000000000000000032dd2300b2dd2b0038dd830338dd833e33e33e333e33e333e33e333e33e333e
57655576555776550000000000000000288888822888888200000000000000003b3553b33b3553b3033dd3300b2dd2b033300333333003333330033333300333
0655766005765550000000000000000028788782287887820000000000000000333dd333333dd33303b55b303b3553b3e3e3333bbe33333ebe3e333be3e3333b
0057650000655700000000000000000028888882080000800000000000000000330550330305503003bddb30333dd3334bbbbeb44bbbebb44bbbbeb44bbbebe4
00065000000570000000000000000000080000800000000000000000000000000000000000000000003553000305503004444440044444400444444004444440
0066600000666000006660000068600000888000002222000022220000222200002222000cccccc00c0000c00000000000000000000000000000000000000000
055556000555560005585600058886000882880002eeee2002eeee2002eeee2002eeee20c0c0c0ccc000000c0000000000000000000000000000000000000000
55555560555855605588856058828860882228802ee77ee22ee77ee22eeeeee22ee77ee2c022220ccc2c2c0cc022220c00222200000000000000000000000000
55555550558885505882885088222880822222802ee77ee22ee77ee22ee77ee22ee77ee2cc2cac0cc02aa20cc0cac2ccc02aa20c000000000000000000000000
15555550155855501588855018828850882228802eeeeee22eeeeee22eeeeee22eeeeee2c02aa20cc0cac2ccc02aa20ccc2cac0c000000000000000000000000
01555500015555000158550001888500088288002222222222222222222222222222222200222200c022220ccc2c2c0cc022220c000000000000000000000000
0011100000111000001110000018100000888000202020200202020220202020020202020000000000000000c000000cc0c0c0cc000000000000000000000000
00000000000000000000000000000000000000002000200002000200002000200002000200000000000000000c0000c00cccccc0000000000000000000000000
000880000009900000089000000890000000000001111110011111100000000000d89d0000189100001891000019810000005500000050000005000000550000
706666050766665000676600006656000000000001cccc1001cccc10000000000d5115d000d515000011110000515d0000055000000550000005500000055000
1661c6610161661000666600001666000000000001cccc1001cccc1000000000d51aa15d0151a11000155100011a151005555550055555500555555005555550
7066660507666650006766000066560000000000017cc710017cc71000000000d51aa15d0d51a15000d55d00051a15d022222222222222222222222222222222
0076650000766500007665000076650000000000017cc710017cc710000000006d5005d6065005d0006dd6000d50056026060602260606022666666226060602
000750000007500000075000000750000000000001111110011111100000000066d00d60006d0d600066660006d0d60020000002206060622222222020606062
00075000000750000007500000075000000000001100001101100110000000000760067000660600000660000060660020606062222222200000000022222220
00060000000600000006000000060000000000001100001101100110000000000070070000070700000770000070700022222220000000000000000000000000
0007033000700000007d330003330333000000000022220000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d3300000d33000028833003bb3bb3000000000888882000000000000000000000000000000000000000000000000000000000000000000000000000000000
0778827000288330071ffd1000884200002882000888882000288200000000000000000000000000000000000000000000000000000000000000000000000000
071ffd10077ffd700778827008ee8e800333e33308ee8e80088ee883000000000000000000000000000000000000000000000000000000000000000000000000
00288200071882100028820008ee8e8003bb4bb308ee8e8008eeee83000000000000000000000000000000000000000000000000000000000000000000000000
07d882d00028820007d882d00888882008eeee800088420008eeee80000000000000000000000000000000000000000000000000000000000000000000000000
0028820007d882d000dffd0008888820088ee88003bb3bb3088ee880000000000000000000000000000000000000000000000000000000000000000000000000
00dffd0000dffd000000000000222200002882000333033300288200000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000149aa94100000000012222100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00019777aa921000000029aaaa920000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d09a77a949920d00d0497777aa920d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0619aaa9422441600619a77944294160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07149a922249417006149a9442244160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07d249aaa9942d7006d249aa99442d60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
067d22444422d760077d22244222d770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d666224422666d00d776249942677d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
066d51499415d66001d1529749251d10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0041519749151400066151944a151660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a001944a100a0000400149a4100400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000049a400090000a0000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100003855034550315502d550295502655023550205501c5501855014550115500e5500c5500a5500855007550055500355001550000000000000000000000000000000000000000000000000000000000000
000200003865030650266501e65018650156500f6500b6500c65011650166501b63020610256002860013500105000f5000e50009500025000050004500015000000000000005000000000000000000000000000
000300003c350163502d3101c3300f3500a340133301f300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
000100000d6301d650006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001925219252000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000e750305002a5501c7500a750117502b5502d7000c7502e500175500c750077501175024550097000d75012700155500b55001550067500d750065500c550237500e5500775016500047500a5500c550
001000000103331000000000000001033000000000019000010330000000000310000203331000000003100003033300000000000000020330000000000000000403300000000000000004033000000000000000
001000001c56200000157420d550000003056000040147522254000000145501d75000000000000050000000115200b53003550000000c5300f54019750015520c5000f500197000150000000000000000000000
011000000e5530000000000000000f5530000000000000000e5530000000000000000f553000000f600000000e553092000000000000105530000009200000000e5530000000000000000f553000000000000000
001000002573000000025300932003600000001d740096201270006102051320113200000000000000000000065501b730147200f7001b700137500d740087300372000000057330950008140000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
790800003e55239552385523755236552335522f5422a542275422554222542205421c5421854217542155221352212522105220d5220b5220a51208512075120651204512045000350002500025000250002500
__music__
03 14154344
03 16171844

