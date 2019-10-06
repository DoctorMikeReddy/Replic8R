pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- game loop

function _init()
 pico8=false
 ld45=false
 mj38=false
 usw=false
 gamestate="main menu"
 pals={{7,0},{15,1},{6,5},
			   {10,8},{7,3},{7,2}}
 palnum=1
 init_menu()
end

function _update()
 update_menu()
end

function _draw()
 draw_menu()
end

-- utilities

function lerp(startv,endv,per)
 return(startv+per*(endv-startv))
end

function update_cursor()
 if (btnp(2)) m.sel-=1 cx=m.x sfx(0)
 if (btnp(3)) m.sel+=1 cx=m.x sfx(0)
 if (btnp(1)) cx=m.x sfx(1)
 if (btnp(0)) sfx(2)
 if (m.sel>m.amt) m.sel=1
 if (m.sel<=0) m.sel=m.amt
 
 cx=lerp(cx,m.x+5,0.5)
end

function draw_options()
 for i=1, m.amt do
  oset=i*8
  if i==m.sel then
   rectfill(cx,m.y+oset-1,cx+36,m.y+oset+5,col1)
   print(m.options[i],cx+1,m.y+oset,col2)
  else
   print(m.options[i],m.x,m.y+oset,col1)
  end
 end
end

function draw_pico8()
 m.footer1="    1"
 m.footer2="    2"
 m.footer3="    3"
 m.footer4="    4"
 ox=2
 oy=104
 pal(7,col1)
 spr(5,ox,oy,2,2)
 pal()
end

function draw_mj38()
 m.footer1="    1"
 m.footer2="    2"
 m.footer3="    3"
 m.footer4="    4"
 ox=2
 oy=104
 pal(7,col1)
 spr(1,ox,oy,2,2)
 pal()
end

function draw_ld45()
 m.footer1="    1"
 m.footer2="    2"
 m.footer3="    3"
 m.footer4="    4"
 ox=2
 oy=104
 pal(7,col1)
 spr(3,ox,oy,2,2)
 pal()
end

function draw_usw()
 m.footer1="    1"
 m.footer2="    2"
 m.footer3="    3"
 m.footer4="    4"
 ox=2
 oy=104
 pal(7,col1)
 spr(7,ox,oy,2,2)
 pal()
end
-->8
-- main menu

function init_menu()
 m={}
 m.header="replic-8-r - an ai nightmare"
 m.footer1=
 "a game for both mini jam #38 +"
 m.footer2=
 "and ludum dare #45 with themes"
 m.footer3=
 "'food', 'start from nothing' +"
 m.footer4=
 "limit of only arrows for input"
 m.x=8
 cx=m.x
 m.y=40
 m.options={"credits",
            "ml phase",
            "ai deploy"}
 m.amt=0
 for i in all(m.options) do
  m.amt+=1
 end
 m.sel=1
 sub_mode=0
 menu_timer=0
end

function update_menu()
 update_cursor()
 if sub_mode==0 then
  if btnp(1) and
  menu_timer>1 then
   if m.options[m.sel]==
    "credits" then
    init_credits()
   elseif m.options[m.sel]==
    "ml phase" then
    init_tutorial()
   elseif m.options[m.sel]==
    "ai deploy" then
    init_playgame()
   end
  end
 end
 
  if (sub_mode==1) update_credits()
 
 col1=pals[palnum][1]
 col2=pals[palnum][2]
 menu_timer+=1
end

function draw_menu()
 cls(col2)
 rect(0,0,127,127,6)
 rect(0,0,127,20,6)
 print(m.header,10,9,6)
 draw_options()
 if (pico8==true) draw_pico8()
 if (ld45==true) draw_ld45()
 if (mj38==true) draw_mj38()
 if (usw==true) draw_usw()
 --rect(0,0,127,127,6)
 rect(0,96,127,20,6)
 print(m.footer1,4,99,6)
 print(m.footer2,4,106,6)
 print(m.footer3,4,113,6)
 print(m.footer4,4,120,6)
end
-->8
-- credits menu

function init_credits()
 m.header="credits - who/what to blame"
 m.footer1=
 "an ai menu nightmare in pico-8"
 m.footer2=
 "for the ludum dare #45 and the"
 m.footer3=
 "mini game jam #38 october jams"
 m.footer4=
 "by doctor mike reddy {c} 2019."
 
 m.sel=1
 m.options={"pico-8","mj38","ld45","usw"}
 m.amt=0
 for i in all(m.options) do
  m.amt+=1
 end
 sub_mode=1
 menu_timer=0
end

function update_credits()
 if (btnp(0)) then
  pico8=false
  mj38=false
  ld45=false
  usw=false
  init_menu()
 end
 if btnp(1) and
 menu_timer>1 then
  if m.options[m.sel]=="pico-8" then
   pico8=true
   mj38=false
   ld45=false
   usw=false
  elseif m.options[m.sel]=="mj38" then
   pico8=false
   mj38=true
   ld45=false
   usw=false
  elseif m.options[m.sel]=="ld45" then
   pico8=false
   mj38=false
   ld45=true
   usw=false
  elseif m.options[m.sel]=="usw" then
   pico8=false
   mj38=false
   ld45=false
   usw=true
  end
 end
end
-->8
-- machine learning menu
-->8
-- deployment menu


__gfx__
00000000099999999990000008880000999000000000000000880000888888888888888800000000000000000000000000000000000000000000000000000000
00000000997999999999000008880000999990000000000000880000877778777887778800000000000000000000000000000000000000000000000000000000
00700700999999999999080808880000990999000000000099776600878878787787888800000000000000000000000000000000000000000000000000000000
00077000099999999990088808880000990099900000000099776600877778788787888800000000000000000000000000000000000000000000000000000000
0007700070000000000700800888000099000990000000aa777777ee878888787787888800000000000000000000000000000000000000000000000000000000
0070070000707777070000000888800099009990000000aa777777ee878888777887778800000000000000000000000000000000000000000000000000000000
000000007000000000070000088888889909990000000000bb77ff00888888888888888800000000000000000000000000000000000000000000000000000000
000000007080000008070000008888889999900000000000bb77ff00878787778788878800000000000000000000000000000000000000000000000000000000
00000000708888888807000000088888999000000000000000cc0000878787888788878800000000000000000000000000000000000000000000000000000000
00000000708878878807000000000aa00aaaaa000000000000cc0000878787778787878800000000000000000000000000000000000000000000000000000000
0000000070877887780700000000aaa00a0000000000000000000000878788878778778800000000000000000000000000000000000000000000000000000000
000000007088888888070000000aa0a00a0000007770000000000777877787778788878000000000000000000000000000000000000000000000000000000000
00000000708887788807000000aa00a00aaaaa007070700000000707888888888888888000000000000000000000000000000000000000000000000000000000
0000000070088888800700000aa000a000000a007770007707770777888888888888880000000000000000000000000000000000000000000000000000000000
0000000007000000007000000aaaaaaa00000a007000707007070707888888888888800000000000000000000000000000000000000000000000000000000000
000000000077777777000000000000a00aaaaa007000707707770777888888888880000000000000000000000000000000000000000000000000000000000000
33333333337ff3333300453333888933339499933301003333454433330011333333333333544533330005333300053333333333333333333333333333333333
33333333377fff3330144433398fff93394fff33301f7f33345ff733301000333300013334ffff33305005033004443333333333333333333333333333333333
3333333337fdfd3330504033384cfc833445f5333f50f033345cfc3330040133311faf333440f033000ff7533051413333333333333333333333333333333333
333333333ffffff33044444338fffa93359ffff3306ffff3356ffff33050403330f0f03335f7fff30010f0033044444333333333333333333333333333333333
33333333335ff63330540033385fff833359ff333356f6333356ff3330444433314aff333359f63300fffa053354453333333333333333333333333333333333
33333333331000330310053338900143334005333350053333100133390445333316f53333400533505fff013310003333333333333333333333333333333333
333333333111110337111103318914033a99994336cccc23360ccc2333200133334005333e888843100f91003111110333333333333333335555555533333333
333333333e8886433a6799533cccc61339999a533cccca133cc0ca133e8882433a99994338888a230ddff2103cccc61333333333333333335555555533333333
3333333338888843399976533300013333000533334554333cdc0c1338888a233333333333aaa933322df6133333333333333333333333335b88864533333333
3333333338011043390110533015443330077733340fff333c01105338288223334454333aafff933212d2133333333333333333333333335888884533333333
33333333380000433900005330a6a63330597933351cfc333a00005f3a0110933454f7533a9cfc933d122213333333333333333333333333b801104b33333333
333333333f0000f3340000433044444330777773304ffff33f000053340000533540f0333afff9a33fd222f3333333333333333333333333f500015f33333333
3333333333010033330100333354453333577633335450333301003333010033356ffff3a95fff9a33d212333333333333333333333333366010001633333333
33333333330100333301003333100033331000333310043333010033330100333356f63333300133332211333333333333333333333333366016601633333333
35555553330100333301003331111103311111033111110333010033330100333340053331111103332211333333333333333333333333366003300633333333
3555555333001003330010033a9996133a9996433e88864333001003330010033a9999433c6ccc13332221133333333333333333333333330003300133333333
5b888645389999333899993338999933389999338399994338999943389999433899994333333333ddddddd33333333333333333c33133c33333333333333333
5888884533bf103333b1103338011033b3011043b30110833801108f38011043380110f3330001333222223333333333333333333c131c333333333333333333
b801104b33000033330f00333b0000f3f30000f3f30000ef3b00002e33b000e333b00033311f7f3332244d33333333333333333331c1c1333333333333333333
f500015f33010033330100333f01003333010033330103333f01033333f000f3330f003330f0f0333250403333333333333333331a1c1a133333333333333333
601000163301003331010033100100333330133333001333330103333001003333010003314af63330444433333333333333333331c1c1333333333333333333
6016601630033003100300330001003333301333300003333000133330010033300330033316f5333004453333333333333333333c131c333333333333333333
60033006301330030033003303330033330103333000003330001333300033333013003333288233302001333333333333333333c33133c33333333333333333
0003300130013000033300033333000333001033300000133030003333001333300100133a9999433eddd2233333333333333333333333333333333333333333
33333333333333c33333333c3505555535333333dfffffff33333333333333333333333336cccc5333311333353333333533333333cccc33666666663f333334
3333333333333ccc333d63cc31011111ccc33353ddffffff376333333333c333333333333656655333311333ccc33353ccc3335333311333d000001d39333f38
333333333333cc3c333d6cc3350555551c153888ddd2222276663876333cc333333333333601105333cccc331c153ccc1c15388833d76d33d070060d39333c38
33333333c111c111366dd6633505555531999484ddd222223251331331cccc13333333333f0000f3331cc13331ccc1c131999484367c1763d100000d3343fc33
33333333cc3cc3333ddcddd33101111151494113ddd222223332113311cc1c11333333333301003331311313551c1513514941133d61c6d3d006010d43c38333
333333333ccc333333cc63333505555533313515ddd22222333387631cc11cc1333333333301003333311333333135153331351533d76533dd2002dd83c3873f
3333333333c333333ccd63333505555533515333ddffffff333331333c1111c3333333333301003333311333335153333351533333311333d222222d8333393c
3333333333333333cc3333333101111133333333dfffffff3333333333311333333333333300100333333333333333333333333333cccc33222222223333393c
3333333333333333333333333333333333333333333333333333333300501010d0d0101050501010000000003330100333301003333010033330100333301003
3300000033000000330000000000000033000000000000000000000000552d25d0dd656d50552825000000003301f7f33301f7f33301f7f33301f7f33301f7f3
30009999300cc0c03009a9a99a0000a9300ddd0dd0c09909606060690100101001001010010010102002002033f50f0333f50f0333f50f0333f50f0333f50f03
300900003000000d3099900000900900302d2d00000099006000606012110101d6dd050d52550505000000003306ffff3306ffff3306ffff3306ffff3306ffff
3009088030aa0a00309a988000a00a00300ddd0d0ee09909000000000100101001001010010010100000000033356f6333356f6333356f6333356f63f3f56f63
300900003000000d309990000090090030000000000099000000000000552d25d0dd656d5055282500000000333500533335005333350053f3f500533f350053
309a900c30990900309a900c0009900030000000000099090000000000501010d0d010105050101000000000336cccc2336cccc2336cccc23fdcccc23afcccc2
309a90b03000000d309990b00000000030000000000099000000000000550505d0dd050d505505050000000033cccca133cccca133cccf913afccca13cdccca1
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333cdccc1333cdccc133ccadc13ccdccc133cdccc1
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333c01103133ca1101333011013330110133301101
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333a0000393330f009333000093330000933300009
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333f00003f3330000f3330000f3330000f3330000f
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333301003333301003333010033330100333301003
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333301000333301003333010033330100333301003
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333301000333301003333010033330100333301003
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333300100033310000333100003331000033310000
33333333222222222222222222222222222222222522252225222522252225221000555505005500d0d01010d0d0101033333333333333333333333333333333
33333333ddd2dddd5552555555525555555255555252525252525252525252525000588855565550d0dd656dd0dd656d33333333333333333333333333333333
33333333000d000011151111111511111115111152525252525252525252525265055666551d1155010010100100101033333333333333333333333333333333
33333333222022221111111111111111111111112222222222222222222222228505580005656551d6dd050dd6dd050d33333333333333333333333333333333
33333333222222221115111111151111111511112252225222522252225222526505566655d1d155010010100100101033333333333333333333333333333333
33333333dd2ddddd55525555555255555552555525252525252525252525252555015500555d5551d0dd656dd0dd656d33333333333333333333333333333333
3333333300d000002222222222222222222222222525252525252525252525255000155515115510d0d01010d0d0101033333333333333333333333333333333
33333333220222222222222222222222222222222222222222222222222222221000000101001100d0dd050dd0dd050d33333333333333333333333333333333
33333333111111112222222222222222222222222522252225222522252225221000555505005500d0d01010d0d0101033333333333333333333333333333333
33333333111111115552555555525555555255555252525252525252525252525000588855565550d0dd656dd0dd656d33333333333333333333333333333333
333333331111111111151111111511111115111152525252525252525252525265055666551d1155010010100100101033333333333333333333333333333333
33333333111111111111111111111111111111112222222222222222222222228505580005656551d6dd050dd6dd050d33333333333333333333333333333333
33333333111111111115111111151111111511112252225222522252225222526505566655d1d155010010100100101033333333333333333333333333333333
333333331111111155525555555255555552555525252525252525252525252555015500555d5551d0dd656dd0dd656d33333333333333333333333333333333
33333333111111112222222222222222222222222525252525252525252525255000155515115510d0d01010d0d0101033333333333333333333333333333333
33333333111111112222222222222222222222222222222222222222222222221000000101001100d0dd050dd0dd050d33333333333333333333333333333333
33333333333333333333337733333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333337633333883333333333315133333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333777663333c7d3333333333176713333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333652525333367d3333333333576775333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333336666666333dd88e3333c7d36333656736767753333333333333333333333333c6666666666666633333333333333333333333333333333333333333
333336667c7767673333dd8e333767d36633165d367677d53333333333333333333336667c776767767677c76663333333333333333333333333333333333333
3336776777c777773333d522333767d356666116367677d53333333333333333333677677777777777777c777677633333333333333333333333333333333333
336777777777776c33332522333767d65555555d367677d633333333333333333367777577777767767777777777763333333333333333333333333333333333
66c7c7157777721533333228333677d5333365673676c7d3333333333333333366c7c7761577721551277775777c7c6ddddddddd65133333333333337ddddddd
617777761515577733333252333677d3333336793d7277d3333333333333333361777777c71557777775555767777716222222227dd133333333333362222222
5d222227c7c7755533333328331677d3333335793328223333333333333333335d22222777c7755555577777722222d5dddd51dd6dd5333333333333cddddddd
5d62d2d22222676733333328336677d333333679338e883333333333333333335d62d2d222226767767e7777777777777775dd165ddc33333333333377777777
355ddddd2d2d255533333355336677d3333333673328ee333333333333333333355ddddd2d2d255556666666666666666665dd565d5333333333333366666666
3335222dddd5dddd33333545337677d3333333263332883333333333333333333335222dddd5dddd87c7c77777777777775ddd125c3333333333333377777777
333333322255d5d533346566337677d333333325333322333333333333333333333333322255d5d58777777777777777775cdc33333333333333333377777777
333333333333555533557677337677d333333333333333333333333333333333333333333333555533333ddddddddddd775553333333333333333333dddddddd
33338833333333253676c7d3377677d333333333336663333dd33333333333333333333333333333333333366666d666ddd67622333333333333333333333333
33367733333333263deeeed3777655d33333333336777633666638663333333333333333333333333333333356777d6657676765333333333333333333333333
3336c733333333673388ee335555d5d33333333336777633355d335333333333333333333333333333333333567777d657777765333333333333333333333333
33e6773333333677332888335ddcdd5333333333336663333333553333333333333333333333333323333333226767d665767622333333333333333333333333
3376c733333335673322883335dddd23333333338315138333338663333333333333333333333333d22253333336565d65656333333333333333333333333333
337677d33333367733322233335dd233333333336315136333333533333333333333333333333333ddddd5533333331115333333333333333333333333333333
367677d33333656733332233332c23333333333365555563333333333333333333333333333333332d2d26d53333333333333333333333333333333333333333
367677d6333316773333333333222333333333336333336333333333333333333333333333333333722222d53333333333333333333333333333333333333333
367677d66333656777777215333677d5333333333333333333333333512777773333333333333333677777163333333333333333333333333333333333333333
367677d56633165d15155777336677d3333333333333333333333333777551513333333333333333517c7c663333333333333333333333333333333333333333
367655d55666611cc6c6dec7336677d333333333333333333333333355577c7c3333333333333333000000000000000000000000000000006666513333333333
3655dd535555555d2222eeee33556623333333333333333333333333767622223333333333333333000000000000000000000000000000007775dd1333333333
35dddd53333333332d2d88ee366666663333333333333333333333335552d2d23333333333333333000000000000000000000000000000006665dd5333333333
31cdc13333333333ddd528887c776767333333333333333333333333dddd5ddd333333333333333300000000000000000000000000000000775ddd1333333333
33151333333333332255228877c777773333333333333333333333335d5d5522333333333333333300000000000000000000000000000000775cdc3333333333
3333333333333333333335557777776c333333333333333333333333555533333333333333333333000000000000000000000000000000007755533333333333
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333333333333333333330000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333333333333333333330000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333333333333333333330000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333333333333333333330000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333333333333333333330000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333333333333333333330000000000000000
__sfx__
000200001805010050180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00030000155401e540185000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
00030000115500d550085500050005500025000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
__music__
00 01424344

