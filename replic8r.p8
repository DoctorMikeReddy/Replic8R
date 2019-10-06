pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- game loop

function _init()
 pico8=false
 ld45=false
 mj38=false
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
 if ox>m.x and ox<m.x+40 and
    oy>m.y and oy<m.y+32 then
   ox=rnd(112)+8
   oy=rnd(112)+8
 end
 pal(7,col1)
 spr(5,ox,oy,2,2)
 pal()
end

function draw_mj38()
 if ox>m.x and ox<m.x+40 and
    oy>m.y and oy<m.y+32 then
   ox=rnd(112)+8
   oy=rnd(112)+8
 end
 pal(7,col1)
 spr(1,ox,oy,2,2)
 pal()
end

function draw_ld45()
 if ox>m.x and ox<m.x+40 and
    oy>m.y and oy<m.y+32 then
   ox=rnd(112)+8
   oy=rnd(112)+8
 end
 pal(7,col1)
 spr(3,ox,oy,2,2)
 pal()
end
-->8
-- main menu

function init_menu()
 m={}
 m.x=8
 cx=m.x
 m.y=40
 m.options={"start","credits",
            "exit"}
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
   if m.options[m.sel]=="credits" then
    init_credits()
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
 draw_options()
 if (pico8==true) draw_pico8()
 if (ld45==true) draw_ld45()
 if (mj38==true) draw_mj38()
end
-->8
-- credits menu

function init_credits()
 m.sel=1
 m.options={"pico-8","mj38","ld45"}
 m.amt=0
 for i in all(m.options) do
  m.amt+=1
 end
 sub_mode=1
 menu_timer=0
end

function update_credits()
 if (btnp(0))init_menu()
 if btnp(1) and
 menu_timer>1 then
  if m.options[m.sel]=="pico-8" then
   pico8=true
   mj38=false
   ld45=false
  elseif m.options[m.sel]=="mj38" then
   pico8=false
   mj38=true
   ld45=false
  elseif m.options[m.sel]=="ld45" then
   pico8=false
   mj38=false
   ld45=true
  end
  ox=rnd(112)+8
  oy=rnd(112)+8
 end
end
-->8
-- start menu
-->8
-- exit menu


__gfx__
00000000099999999990000008880000999000000000000000880000000000000000000000000000000000000000000000000000000000000000000000000000
00000000997999999999000008880000999990000000000000880000000000000000000000000000000000000000000000000000000000000000000000000000
00700700999999999999080808880000990999000000000099776600000000000000000000000000000000000000000000000000000000000000000000000000
00077000099999999990088808880000990099900000000099776600000000000000000000000000000000000000000000000000000000000000000000000000
0007700070000000000700800888000099000990000000aa777777ee000000000000000000000000000000000000000000000000000000000000000000000000
0070070000707777070000000888800099009990000000aa777777ee000000000000000000000000000000000000000000000000000000000000000000000000
000000007000000000070000088888889909990000000000bb77ff00000000000000000000000000000000000000000000000000000000000000000000000000
000000007080000008070000008888889999900000000000bb77ff00000000000000000000000000000000000000000000000000000000000000000000000000
00000000708888888807000000088888999000000000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000
00000000708878878807000000000aa00aaaaa000000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000
0000000070877887780700000000aaa00a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007088888888070000000aa0a00a0000007770000000000777000000000000000000000000000000000000000000000000000000000000000000000000
00000000708887788807000000aa00a00aaaaa007070700000000707000000000000000000000000000000000000000000000000000000000000000000000000
0000000070088888800700000aa000a000000a007770007707770777000000000000000000000000000000000000000000000000000000000000000000000000
0000000007000000007000000aaaaaaa00000a007000707007070707000000000000000000000000000000000000000000000000000000000000000000000000
000000000077777777000000000000a00aaaaa007000707707770777000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000200001805010050180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00030000155401e540185000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
00030000115500d550085500050005500025000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
