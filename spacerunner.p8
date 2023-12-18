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
#include bullets/player_bullet.lua
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
00000000000110000001100000011000000000000000000000000000000000000000000000000000000000000000000000000000088008800880088000000000
00000000001d21000016d1000012d100000000000007700000077000000770000097790000077000000000000000000000000000888888888008800800000000
00700700001d62000026d1000026d100000000000097790000099000009779000099990000977900000000000000000000000000888888888000000800000000
00077000001d620002e6d2100026d100000000000009900000099000000990000009900000099000000000000000000000000000888888888000000800000000
0007700001716e2002e71d1002e61710000000000000000000099000000000000000000000000000000000000000000000000000088888800800008000000000
0070070001c12e202eec1d2102e21c10000000000000000000000000000000000000000000000000000000000000000000000000008888000080080000000000
000000000155dd202e255d2102dd5510000000000000000000000000000000000000000000000000000000000000000000000000000880000008800000000000
00000000001992002029920100299100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000009999000000000000000000000000000033003300330033003300330033003307001100d033003300330033003300330000000000000000000000000
000000009977990000000000000000000000000033b33b3333b33b3333b33b3333b33b33061cd1d033b33b3333b33b3333b33b33000000000000000000000000
000000009a77a9000000000000000000000000003bbbbbb33bbbbbb33bbbbbb33bbbbbb301cccd103bbbbbb33bbbbbb33bbbbbb3000000000000000000000000
000000009a77a9000000000000000000000000003b7717b33b7717b33b7717b33b7717b31cc70cd13b7717b33b7717b33b7717b3000000000000000000000000
000000009a77a9000000000000000000000000000b7117b00b7117b00b7117b00b7117b01cc10cd10b7117b00b7117b00b7117b0000000000000000000000000
0000000099aa99000000000000000000000000000037730000377300003773000037730001cccc10003773000037730000377300000000000000000000000000
0000000009aa9000000000000000000000000000030330300303303003033030030330300c1cc110030330300303303003033030000000000000000000000000
000000000099000000000000000000000000000003000030300000030300003003300330c0000001300000030300003003300330000000000000000000000000
0aaaaa00aaaaa00000aaa0000aaaa000aaaaaa00aaaaaa00a0000a00a00000a00000000000022000000220000002200000011000000110000001100000011000
94444400944449000a444a00944449009444440094444490a0000a009a00009000066600002822000028820000228200001cc100001d21000016d1000012d100
4900000090000900990009909000040090000000900000909000090094a0009000666600002882000028820000288200001cc100001d62000026d1000026d100
04aaa0009aaaa4009aaaaa90900000009aaaaa009aaaaa0090000900904a00900066660000288e2002e88e2002e8820001cccc10001d6e0002e6d2100026d100
004449009444400094444490900000009444440094444990900009009004a09000066600027c88202e87c8e20288c7200cc72cc001716e2002e71d1002e61710
0000090090000000900000909000090090000000900004909000090090004a900000000002118820288118820288112028c11c8201c12ee02eec1d2102e21c10
9999940090000000900000904aaaa400999999009000009049999400900004900000000002558d2028d55d8202d8552088d55d880155dd202e255d2102dd5510
44444000400000009000009004444000444444004000004004444000400000400000000000299d0002d99d2000d9920080299208001992002029920100299100
0000000000000000000000000000000000000000000000000000000000000000000000000000000001dddd601ddddd600dddd6000d7777e0077777770d7777e0
00077000000770000007700000c77c000007700000077000000770000007700000977900000770001d7766701d776d60dd76dd60d7d0007e79999999d7e0007e
00c77c000007700000c77c000cccccc000c77c0000977900000990000097790000999900009779001d7000001d700d70dd70dd60d7d0000099900000d7e00000
00cccc00000cc00000cccc0000cccc0000cccc00000990000009900000099000000990000009900001ddd7001ddddd70dd70dd600d7777e0999999900d7777e0
000cc000000cc000000cc00000000000000cc00000000000000990000000000000000000000000000166dd701d677770dddddd7000000d7e0999999900000d7e
00000000000cc00000000000000000000000000000000000000000000000000000000000000000000000dd701d700000d7000d70d7e00d7e00000999d7e00d7e
000000000000000000000000000000000000000000000000000000000000000000000000000000001dddd7701d700000d7000d700d7777e0444449990d7777e0
00000000000000000000000000000000000000000000000000000000000000000000000000000000177777001d700000d7000d70000000009999999000000000
00000000000000000000000000000000000000005000000000000000500000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000099900000000000505055500005000000505550005500000000550005000000000000000000000000000000000000000000000000000
07000000000070000000a99999000000005555222555055005000555555505000550055550000000000000000000000000000000000000000000000000000000
0077000000007000000aaa9aaa990000050522222222500005505588855550000005055000005500000000000000000000000000000000000000000000000000
0000777aa000070000977aa77aa90000005228888882505000555559988550500000000000055550000000000000000000000000000000000000000000000000
000077777a0700000099777777aa90000052899a9982250000555558995585500050000500555500000000000000000000000000000000000000000000000000
0000a777777000000099a777777a9000052289aaaa98250005585555555885000055000005500000000000000000000000000000000000000000000000000000
0000a77777a0000009997777777a9000522889a77aa8225055885999999888500555000005550000000000000000000000000000000000000000000000000000
0009777777700000099a7777777a900002899aa77a98225008855999589555500000055000000000000000000000000000000000000000000000000000000000
077777777a900000099a7777777a990002288aaaaa98225005558998555555500000005000055500000000000000000000000000000000000000000000000000
000aa7777a900000009a777777aa99000528aa999a88250005588895559995000000055500005500000000000000000000000000000000000000000000000000
00000a77a7007000009aaa7777a99900005289998882250000588955888925000050000000500000000000000000000000000000000000000000000000000000
00070000770070000099aaaaa9999000005522222222505000558855222250000055000005555000000000000000000000000000000000000000000000000000
000000007007000000099a9999990000050555222255000055055555525500000055005000055000000000000000000000000000000000000000000000000000
00007000700000000000999999000000005005505500500000000550550550000550000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000050000005000000000000000500000000000000000000000000000000000000000000000000000000000000000000
01dddd60077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d77667007ddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d7000007dd700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01ddd7007ddd77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0166dd7006dddd600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000dd700006ddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1dddd77077776dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777700dddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06666650666666500666650006666650666666506666665066506650665506500000000000000000000000000000000000000000000000000000000000000000
66555550665006506655665066655550665555506650065066506650666506500000000000000000000000000000000000000000000000000000000000000000
66500000665006506650665066550000660000006650065066506650656506500000000000000000000000000000000000000000000000000000000000000000
06666500666666506650665066550000666666506666665066506650656556500000000000000000000000000000000000000000000000000000000000000000
05556650665555506666665066550000665555506500655066506650656656500000000000000000000000000000000000000000000000000000000000000000
00006650655000006500065066655550660000006500655066666650650666500000000000000000000000000000000000000000000000000000000000000000
66666550650000006500065056666650666666506500665006666550650066500000000000000000000000000000000000000000000000000000000000000000
55555500550000005500055005555550555555505500555005555550550055500000000000000000000000000000000000000000000000000000000000000000
0d7777e0d77777e00c7777e00c7777e0c777777ec77777e0c7e00c7ec7e00c7e5555555555555555555555555555555502222220022222200222222002222220
d7e0007ed7e00d7ec7e00c7ec7e00c7ec7e00000c7e00c7ec7e00c7ec7700c7e0578875005788750d562465d0578875022e66e2222e66e2222e66e2222e66e22
d7e00000d7e00d7ec7e00c7ec7e00000c7e00000c7e00c7ec7e00c7ec7c70c7e05624650d562465d05177150d562465d27761772277617722776177227716772
0d7777e0d77777e0c777777ec7e00000c777777ec77777e0c7e00c7ec7ec7c7ed517715d051771500566865005177150261aa172216aa162261aa612261aa162
00000d7ed7e00000c7e00c7ec7e00000c7e00000c7e00c7ec7e00c7ec7e0c77e056686500566865005d24d50056686502ee99ee22ee99ee22ee99ee22ee99ee2
d7e00d7ed7e00000c7e00c7ec7e00c7ec7e00000c7e00c7ec7e00c7ec7e00c7e5d5245d505d24d500505505005d24d5022299222229999222229922222299222
0d7777e0d7e00000c7e00c7e0c7777e0c777777ec7e00c7e0c7777e0c7e0007e5005500505055050050000500505505020999902020000202099990202999920
0000000000000000000000000000000000000000000000000000000000000000dd0000dd0dd00dd005dddd500dd00dd022000022022002202200002202200220
07777777777777700077770007777700077777770200002000000000000000003350053303500530000000000000000000000000000000000000000000000000
7999999999999999077999907799999079999999220000220000000000000000330dd033030dd030005005000350053000000000000000000000000000000000
99900000999009997990099999900999999000002222222200000000000000003b8dd8b3338dd833030dd030030dd03003e33e300e33e330033e333003e333e0
9999999099944999999999999990000099999990282222820000000000000000032dd2300b2dd2b0038dd830338dd833e33e33e333e33e333e33e333e33e333e
09999999999999909999999999900444999999902888888200000000000000003b3553b33b3553b3033dd3300b2dd2b033300333333003333330033333300333
0000099999400000999449999990099999900000287887820000000000000000333dd333333dd33303b55b303b3553b3e3e3333bbe33333ebe3e333be3e3333b
4444499999400000999009999994499099999999080000800000000000000000330550330305503003bddb30333dd3334bbbbeb44bbbebb44bbbbeb44bbbebe4
99999990994000004440044409999900044444440000000000000000000000000000000000000000003553000305503004444440044444400444444004444440
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

