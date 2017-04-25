REM things needed to be completed...
rem two other layers of the store
rem random events and items not in the shop
rem saving and loading (list all variables)
rem ultradragon fight
rem special dragon fights
@echo off
title DragonSlayer by greyli
color 0a
set name=You
:startmenu
cls
echo Ready to slay Dragons? (1)
echo Want to read about this game? (2)
echo Don't want to do the tutorial?(9)
echo FULLSCREEN RECOMENDED
echo.
set /p ch=Choose the corresponding number:
if %ch%==1 goto tutorial
if %ch%==2 goto info
if %ch%==9 set /a skip=1
if %ch%==9 goto tutorial
goto startmenu
:info
cls
echo This is a game by greyli
echo It is based on a loop where you slay dragons
echo There is a shop, which as four levels of items
echo And the player can go on adventures and get items!
echo vINDEV
echo.
pause
goto startmenu

:tutorial
set /a larmour=0
set /a marmour=0
set /a mplarmour=0
set /a mstaff=0
set /a carmour=0
set /a magicsword=0
set /a idagger=0
set /a wbow=0
set /a arrows=0
set /a wbow=0
set /a wcbow=0
set /a sdagger=0
set /a tsword=0
set /a potions=1
set /a mhealth=25
set /a health=25
set /a stonesword=1
set armour=none
if %skip%==1 goto adragondefeated
cls
echo Time to slay your first dragon!
timeout 2 >nul
echo Here is the equipment you will need:
timeout 2 >nul
echo.
echo Picked up Stone Sword.

timeout 1 >nul
echo Picked up Health Potion.

timeout 2 >nul
echo.
echo.
pause
cls
echo Here is the first dragon!
timeout 2 >nul
echo It is a very weak dragon, a Common Greenback.
timeout 1 >nul
echo.
echo Press any key when you are ready to fight!
pause >nul

set /a dragonhealth=12
cls
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
echo.
echo Each item has its own command.
timeout 2 >nul
echo %name%r health potion uses the command heal.
timeout 2 >nul
echo %name%r sword uses stone_slice.
echo (every sword will use the same command, just with a diffrent material)
timeout 3 >nul
echo Try it out! (press enter after typing a command)
:aloop
set cmd=prevent
if %dragonhealth%==0 goto adragondefeated
if %dragonhealth% lss 12 echo The Greenback tries to breathe fire but only makes smoke.
set /p cmd=
if %cmd% == heal goto aheal
if %cmd% == stone_slice goto asslice
goto aloop
:asslice
cls
color 0c
echo Dealt 3 Damage!
timeout 1 >nul
color c0
set /a dragonhealth=dragonhealth-3
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
timeout 1 >nul
color 0a
echo The dragon swipes at you but misses.
echo.
pause
cls
goto aloop
:aheal
if %potions%==0 echo %name% don't have any potions!
if %potions%==0 pause
if %potions%==0 cls
if %potions%==0 goto aloop
cls
color a0
echo %name% have healed 6 points!
set /a potions=potions-1
timeout 1 >nul
color 02
set /a health=health+6
echo Health: %health%/%mhealth%
if %health% gtr %mhealth% set health=mhealth
echo.
pause
color 0a
goto aloop
:adragondefeated
set /a slays=1
cls
echo You have gone up one level! Level:1
echo +5 coins
set /a level=1
set /a xp=0
timeout 3 >nul
echo %name% now understand the basics of Dragon slaying.
timeout 2 >nul
echo A couple more tips:
timeout 1 >nul
echo Type shop to go to the shop and purchase items while %name% are not slaying.
timeout 1 >nul
echo.
echo If %name% can get 50 dragon slain (see %name%r stats by typing stats)
echo %name% can go and fight the Ultra-Dragon.
echo.
set /a coins=18
timeout 1 >nulpond
echo Unlike the first Dragon %name% fought, most Dragons fight back.
echo.
timeout 1 >nul
echo Yes or No questions should be answered with 'y' and 'n'
echo.
echo Press any key to begin on %name%r adventure!
set /a xpn=15
pause >nul

:preloop
if %xp% gtr %xpn% goto levelup
cls
if %name%==You echo %name% are in %name%r house, waiting for an adventure.
if not %name%==You echo %name%, you are sitting in your house.
echo Type adventure to go on one and shop to vist one.
set /p cmd=
if %cmd%==adventure goto adventure
if %cmd%==shop goto shop
if %cmd%==stats goto stats
goto preloop
:levelup
set /a level=level+1
set /a xp=xp-xpn
set /a health=mhealth
cls
echo You have gone up a level!
echo Level: %level%
set /a xpn=16*level-slays
echo XP needed to go up one another: %xpn%
set /a cg=15
set /a cg=cg+ 2 * level
echo You get %cg% coins!
set /a coins=coins+cg
echo.
pause
goto preloop

:shop
if %slays% lss 14 goto begshop
if %slays% lss 26 if %slays% gtr 12 goto normalshop
if %slays% gtr 48 goto expertshop
goto intershop
:begshop
cls
echo Welcome to the shop! Buy an item by typing the name in ().
echo Coins: %coins%
echo.
echo 8 coins-Health Potion (potion)
echo.
echo 18 coins/+Max Health Increase-Leather Armour (larmour)
echo.
echo 27 coins-Iron Dagger(idagger)
echo.
echo 35 coins-3 Arrows (3arrows)
echo.
echo 50 coins-5 Health Potions (5potions)
echo.
echo 56 coins/+Max Health Increase-Chainmail Armour(carmour)
echo.
echo 65 coins-Wooden Bow (wbow)
echo.
echo 72 coins-Metal Plated Leather Armour(mplarmour)
echo.
echo 81 coins-8 Health Potions (8potions)
echo.
echo 93 coins/+Max Health Increase-Magic Armour(marmour)
echo.
echo 100 coins-Complete Heal (fheal)
echo.
echo 100 coins-Magic Sword (magicsword)
echo.
echo (Type leave to do so)
set /p pur=
cls
if %pur%==leave goto preloop
if %pur%==wbow if %wbow%==1 goto errorbpur1
if %pur%==wbow if %coins% gtr 64 set /a wbow=1
if %pur%==wbow if %coins% gtr 64 goto bowt
if %pur%==3arrows if %coins% gtr 34 set /a arrows=arrows+3
if %pur%==3arrows if %coins% gtr 34 set /a coins=coins-35
if %pur%==idagger if %idagger%==1 goto errorbpur1
if %pur%==idagger if %coins% gtr 26 set /a idagger=1
if %pur%==idagger if %coins% gtr 26 goto daggert
if %pur%==8potions if %coins% gtr 87 set /a potions=potions+8
if %pur%==8potions if %coins% gtr 87 set /a coins=coins-88
if %pur%==magicsword if %magicsword%==1 goto errorbpur1
if %pur%==magicsword if %coins% gtr 99 set /a magicsword=1
if %pur%==magicsword if %coins% gtr 99 set /a coins=coins-100
if %pur%==larmour if %larmour%==1 goto errorbpur1
if %pur%==carmour if %carmour%==1 goto errorbpur1
if %pur%==marmour if %marmour%==1 goto errorbpur1
if %pur%==mplarmour if %mplarmour%==1 goto errorbpur1
if %pur%==potion if %coins% gtr 7 set /a potions=potions+1
if %pur%==potion if %coins% gtr 7 set /a coins=coins-8
if %pur%==larmour if %coins% gtr 17 set armour=Leather_Armour
if %pur%==larmour if %coins% gtr 17 set /a larmour=1
if %pur%==larmour if %coins% gtr 17 set /a mhealth=mhealth+1
if %pur%==larmour if %coins% gtr 17 set /a coins=coins-18
if %pur%==5potions if %coins% gtr 49 set /a potions=potions+5
if %pur%==5potions if %coins% gtr 49 set /a coins=coins-50
if %pur%==marmour if %coins% gtr 98 set armour=Magic_Armour
if %pur%==marmour if %coins% gtr 98 set /a marmour=1
if %pur%==marmour if %coins% gtr 98 set /a mhealth=mhealth+5
if %pur%==marmour if %coins% gtr 98 set /a coins=coins-99
if %pur%==carmour if %coins% gtr 55 set armour=Chainmail_Armour
if %pur%==carmour if %coins% gtr 55 set /a carmour=1
if %pur%==carmour if %coins% gtr 55 set /a mhealth=mhealth+3
if %pur%==carmour if %coins% gtr 55 set /a coins=coins-56
if %pur%==mplarmour if %coins% gtr 45 set armour=Leather_Metal_Plated_Armour
if %pur%==mplarmour if %coins% gtr 45 set /a mplarmour=1
if %pur%==mplarmour if %coins% gtr 45 set /a mhealth=mhealth+2
if %pur%==mplarmour if %coins% gtr 45 set /a coins=coins-46
if %pur%==fheal if %coins% gtr 99 set /a health=mhealth
if %pur%==fheal if %coins% gtr 99 set /a coins=coins-100
goto shop
:normalshop
cls
echo Welcome to the shop! New items are added as you go adventure.
echo Coins: %coins%
echo.
echo 17 coins-Health Potion (potion)
echo.
echo 45 coins-Steel Dagger(sdagger)
echo.
echo 68 coins/+Max Health Increase-Chainmail Armour(carmour)
echo.
echo 70 coins/+Max Health Increase-Full Health(fhealth)
echo.
echo 70 coins-5 Health Potions (5potions)
echo.
echo 70 coins-3 Arrows (3arrows)
echo.
echo 88 coins-8 Health Potions (8potions)
echo.
echo 100 coins/+Max Health Increase-Magic Armour(marmour)
echo.
echo 100 coins-Wooden Compound Bow (wcbow)
echo.
echo 105 coins-Magic Bow (mbow)
echo.
echo 162 coins-Tungsten Sword (tsword)
echo.
echo 250 coins-Magical Staff(mstaff)
echo.
echo (Type leave to do so)
set /p pur=
cls
if %pur%==fhealth if %coins% gtr 67 set /a health=mhealth
if %pur%==fhealth if %coins% gtr 67 set /a coins=coins-68
if %pur%==leave goto preloop
if %pur%==wcbow if %wcbow%==1 goto errorbpur1
if %pur%==wcbow if %coins% gtr 99 set /a wcbow=1
if %pur%==wcbow if %coins% gtr 99 goto bowt2
if %pur%==3arrows if %coins% gtr 69 set /a arrows=arrows+3
if %pur%==3arrows if %coins% gtr 69 set /a coins=coins-70
if %pur%==sdagger if %sdagger%==1 goto errorbpur1
if %pur%==sdagger if %coins% gtr 44 set /a coins=coins-18
if %pur%==sdagger if %coins% gtr 44 set /a sdagger=1
if %pur%==sdagger if %coins% gtr 44 goto daggert
if %pur%==8potions if %coins% gtr 87 set /a potions=potions+8
if %pur%==8potions if %coins% gtr 87 set /a coins=coins-88
if %pur%==tsword if %tsword%==1 goto errorbpur1
if %pur%==tsword if %coins% gtr 161 set /a tsword=1
if %pur%==tsword if %coins% gtr 161 set /a coins=coins-162
if %pur%==carmour if %carmour%==1 goto errorbpur1
if %pur%==marmour if %marmour%==1 goto errorbpur1
if %pur%==potion if %coins% gtr 16 set /a potions=potions+1
if %pur%==potion if %coins% gtr 16 set /a coins=coins-17
if %pur%==5potions if %coins% gtr 69 set /a potions=potions+5
if %pur%==5potions if %coins% gtr 69 set /a coins=coins-70
if %pur%==marmour if %coins% gtr 99 set armour=Magic_Armour
if %pur%==marmour if %coins% gtr 99 set /a marmour=1
if %pur%==marmour if %coins% gtr 99 set mhealth=mhealth+5
if %pur%==marmour if %coins% gtr 99 set /a coins=coins-99
if %pur%==carmour if %coins% gtr 69 set armour=Chainmail_Armour
if %pur%==carmour if %coins% gtr 69 set /a carmour=1
if %pur%==carmour if %coins% gtr 69 set mhealth=mhealth+3
if %pur%==carmour if %coins% gtr 69 set /a coins=coins-70
if %pur%==mbow if %wcbow%==1 goto errorbpur1
if %pur%==mbow if %coins% gtr 99 set /a wcbow=1
if %pur%==mbow if %coins% gtr 99 goto bowt2
if %pur%==mstaff if %mstaff%==1 goto errorbpur1
if %pur%==mstaff if %coins% gtr 249 set /a coins=coins-250
if %pur%==mstaff if %coins% gtr 249 set /a mstaff=1
if %pur%==mstaff if %coins% gtr 249 goto stafft
goto shop
:stafft
cls
echo The magical staff uses the command spell
echo.
pause.
goto shop
:errorbpur1
cls
echo You already have that item!
echo What would you do with two of it?
echo.
pause
goto shop


:daggert
if %pur%==idagger if %coins% gtr 26 set /a coins=coins-27
cls
echo A dagger has its own command like a sword has material_slice
echo The command for a dagger is:
echo matieral_stab
echo Replace matieral with the matieral of the dagger you have.
echo.
pause
goto shop
:bowt2
cls
set /a coins=coins-100
echo The compound bow uses the command matieral_aim
echo The normal bow uses the command matieral_shoot
echo A wooden compund bow would use wood_aim
echo You must have arrows to use your bow.
echo.
pause
goto shop
:bowt
cls
set /a coins=coins-64f
echo The bow uses the command matieral_shoot
echo A wooden bow would use wood_shoot
echo You must have arrows to use your bow.
echo.
pause
goto shop
:stats
echo Here are stats for %name%:
echo Coins: %coins%
echo Amount of Arrows: %arrows%
echo How many slays: %slays%
echo Current Health:%health%
echo Max Health: %mhealth%
echo Number of Health Potions: %potions%
echo Level: %level%
echo XP: %xp%
echo XP needed: %xpn%
echo.
pause
goto preloop

:adventure
cls
echo Are you sure you want to adventure? (Y/N)
set /p ac=
if /i %ac%==Y goto adloop1
if /i %ac%==N goto preloop
goto adventure

:adloop1
cls
echo You have come across a wild dragon!
timeout 3 >nul
set /a type=0
SET /A type=%RANDOM% %%100
if %slays% lss 30 set /a type=%random% %%75
if %slays% lss 20 set /a type=%random% %%50
set /a cash=type
if %slays% lss 4 set /a type=%random% %%30
if %type% lss 20 set /a dragonhealth=15
if %type% lss 20 set /a dragonattack=2
if %type% lss 20 set type="Common Greenback"
if %type% gtr 19 if %type% lss 33 set /a dragonhealth=24
if %type% gtr 19 if %type% lss 33 set /a dragonattack=5
if %type% gtr 19 if %type% lss 33 set type="Flame Wrangler"
if %type% gtr 90 set /a dragonhealth=90
if %type% gtr 90 set /a dragonattack=15
if %type% gtr 90 set type="Ultra Rare Greenback"
if %type% gtr 32 if %type% lss 46 set /a dragonhealth=30
if %type% gtr 32 if %type% lss 46 set /a dragonattack=6
if %type% gtr 32 if %type% lss 46 set type="American RidgeBack"
if %type% gtr 45 if %type% lss 61 set /a dragonhealth=38
if %type% gtr 45 if %type% lss 61 set /a dragonattack=3
if %type% gtr 45 if %type% lss 61 set type="Night Nadder"
if %type% gtr 60 if %type% lss 71 set /a dragonhealth=45
if %type% gtr 60 if %type% lss 71 set /a dragonattack=14
if %type% gtr 60 if %type% lss 71 set type="Ebanate Baby"
if %type% == 71 set /a dragonhealth=42
if %type% == 71 set /a dragonattack=24
if %type% == 71 set type="Ebante Adult"
if %type% gtr 71 if %type% lss 80 set /a dragonhealth=50
if %type% gtr 71 if %type% lss 80 set /a dragonattack=15
if %type% gtr 71 if %type% lss 80 set type="Mariante Baby"
if %type% gtr 79 if %type% lss 91 set /a dragonhealth=65
if %type% gtr 79 if %type% lss 91 set /a dragonattack=16
if %type% gtr 79 if %type% lss 91 set type="Mariante Adult"
cls
echo You have come across a wild dragon!
set /a stab=0
echo It is a %type%!
echo.
pause
:dloop
if %health% lss 1 goto defeat
cls
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
if %dragonhealth% lss 1 goto dragdefe
if %dragonhealth% lss 15 echo The dragon moves hastily.
if %dragonhealth% gtr 14 echo The dragon has hate in its eyes.
set /p cmd=What do you do?
if %cmd%==stone_slice goto dsslice
if %cmd%==magic_slice goto dmslice
if %cmd%==heal goto dheal
if %cmd%==iron_stab goto distab
if %cmd%==wood_shoot if %arrows% gtr 0 goto dwshoot
if %cmd%==wood_aim if %arrows% gtr 0 goto dwaim
if %cmd%==magic_shoot if %arrows% gtr 0 goto dmshoot
if %cmd%==tungsten_slice goto dtslice
if %cmd%==steel_stab goto dsstab
if %cmd%==plate goto dpu
goto dloop
:dpu
if %plate%==0 goto nw
cls echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
echo You throw your plate at the dragon!
echo It doesn't do much, the hide is too thick.
echo.
pause
goto dloop

:dmshoot
if %mbow%==0 goto nw
cls
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
set /a shoot=%random% %%2
if %shoot%==1 set /a shoot=16
if %shoot%==1 color 0c
if %shoot%==0 set /a shoot=0
if %shoot%==0 echo You have missed the shot!
echo %name% deal %shoot% damage!
timeout 1 >nul
set /a dragonhealth=dragonhealth-shoot
color 0a
echo.
pause
goto dloop2
:defeat
if %coins% gtr 45 goto cdefe
cls
color ca
echo You have died!
timeout 2 >nul
color a0
echo.
echo.
pause
color 0a
goto startmenu
:cdefe
cls
color ca
echo You are in vital condition!
timeout 1 >nul
echo The doctors need a payment of all your coins!
timeout 2 >nul
echo Do you do it? (Y/N)
set /p ch=
if /i %ch%==Y set coins=0
if /i %ch%==Y set /a health=mhealth
if /i %ch%==Y goto preloop
if /i %ch%==N goto startmenu
goto cdefe

:dwaim
if %wcbow%==0 goto nw
cls
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
echo %name% deal 11 damage!
timeout 1 >nul
set /a dragonhealth=dragonhealth-11
color 0a
echo.
pause
goto dloop2

:dwshoot
if %wbow%==0 goto nw
cls
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
set /a shoot=%random% %%2
if %shoot%==1 set /a shoot=8
if %shoot%==1 color 0c
if %shoot%==0 set /a shoot=0
if %shoot%==0 echo You have missed the shot!
echo %name% deal %shoot% damage!
timeout 1 >nul
set /a dragonhealth=dragonhealth-shoot
color 0a
echo.
pause
goto dloop2
:dsslice
cls
color 0c
echo Dealt 3 Damage!
timeout 1 >nul
color c0
set /a dragonhealth=dragonhealth-3
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
timeout 1 >nul
color 0a
echo.
pause
cls
goto dloop2
:nw
echo You do not have that Weapon!
echo.
pause
goto dloop
:dtslice
if %tsword%==0 goto nw
cls
color 0c
set /a dm=3 * level - 6
echo Dealt %dm% Damage!
timeout 1 >nul
color c0
set /a dragonhealth=dragonhealth-dm
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
timeout 1 >nul
color 0a
echo.
pause
cls
goto dloop2
:dheal
if %potions%==0 echo %name% don't have any potions!
if %potions%==0 pause
if %potions%==0 cls
if %potions%==0 goto dloop
cls
color a0
echo %name% have healed 6 points!
set /a potions=potions-1
timeout 1 >nul
color 02
set /a health=health+6
echo Health: %health%/%mhealth%
if %health% gtr %mhealth% set health=mhealth
echo.
pause
color 0a
goto dloop

:dmslice
if %magicsword%==0 goto nw
cls
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%

color 0c
set /a r=%random% %%9
if %r% lss 5 set /a r=r+5
echo Dealt %r% Damage!
timeout 1 >nul
color c0
set /a dragonhealth=dragonhealth-%r%
timeout 1 >nul
color 0a
pause
cls
goto dloop2

:dloop2
cls
if %dragonhealth% lss 1 goto dragdefe
set /a stab=0
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
set /a r=%random% %%5
if %r% gtr 4 set /a r=1+dragonattack
if %r% lss 3 set /a r=dragonattack-r
if %r% lss 0 set /a r=1
if %r% lss 6 echo The dragon has swung its tail at %name%!
if %r% lss 14 if %r% gtr 5 echo The dragon breathes fire at you!
if %r% gtr 13 echo The dragon bites you!
echo it deals %r% damage!
set /a health=health-r
echo.
pause
goto dloop

:distab
if %idagger%==0 goto nw
cls
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
color 0c
if %stab%==0 set /a dm=2
if %stab%==1 set /a dm=3
echo Dealt %dm% damage!
timeout 1 >nul
color c0
set /a dragonhealth=dragonhealth-dm
if %stab%==1 color 0a
if %stab%==1 goto dloop2
set /a stab=stab+1
timeout 1 >nul
color 0a
pause
cls
goto dloop

:dsstab
if %sdagger%==0 goto nw
cls
echo Health: %health%/%mhealth%  Dragon Health: %dragonhealth%
set /a dam=%random% %%9
color 0c
echo Dealt %dam% damage!
timeout 1 >nul
color c0
set /a dragonhealth=dragonhealth-dam
if %stab%==1 color 0a
if %stab%==1 goto dloop2
set /a stab=stab+1
timeout 1 >nul
color 0a
pause
cls
goto dloop
:dragdefe
cls
echo You have slayed the dragon!
echo.
timeout 1 >nul
set /a slays=slays+1
set /a rand=%random% %%5
set /a tc=cash+rand
if %tc% lss 13 set /a tc=tc+12
set /a coins=tc+coins
echo The %type% has dropped %tc% coins
timeout 1 >nul
set /a xpt=xp+rand * rand + 10
set /a xp=xp+rand * rand + 10
echo Gained %xpt% XP!
echo Automatic +8 Health Bonus
timeout 2 >nul
color a0
echo.
echo %name% have healed 8 points!
timeout 1 >nul
color 02
set /a health=health+8
if %health% gtr %mhealth% set /a health=mhealth
echo Health: %health%/%mhealth%
color 0a
echo.
echo.
echo Do you want to continue on your adventure? (Y/N)
:asdf
set /p ac=
if /i %ac%==Y goto randevent
if /i %ac%==N goto preloop
goto asdf
:randevent
cls
echo While travelling, you come across a
timeout 3 >nul
set /a event=%random% %%5
rem if %event%==1 goto riddle
rem if %event%==2 goto casino
if %event%==3 goto robber
if %event%==4 goto marmour
if %event%==5 goto uli
:casino
:marmour
echo treasure box! Upon opening it,
echo you find a set of armour that you cannot
echo identify. Do you put it on? (Y/N)
set /p ch=
if /i %ch%==Y goto maye
if /i %ch%==N goto rec
goto marmour
:maye
set /a mac=%random% %%5
if %mac% gtr 2 goto maw
cls
echo Upon putting on the armour, you feel
echo it tightening, making it stuck to your
echo body! It takes away %mac% away from your
echo maximum health.
set /a mhealth=mhealth-mac
if %health% gtr %mhealth% set /a health=mhealth
echo.
pause
goto rec
:maw
cls
echo You put on the armour. A wealth
echo of knowledge drops over you , and
echo it is armour of Darkness!
echo You get an additional %mac% for your
set /a mhealth=mhealth+mac
echo maximum health. Max Health:%mhealth%
echo.
pause
goto rec
:uli
echo You found a 
echo mysterious item!
timeout 3 >nul
echo Upon closer inspection,
echo it is only a plate.
timeout 1 >nul
echo.
echo Picked up plate.
set /a plate=1
echo.
echo The command for it is: plate
echo.
pause
goto rec
:robber
cls
echo robber!
echo 1-Fight the robber
echo 2-Run away
set /p ch=
if %ch%==1 goto frobber
if %ch%==2 goto erobber
goto robber
:erobber
cls
echo You successfully escape the robber!
echo.
pause
goto rec
:frobber
cls 
set /a rc=%random% %%4
if %rc% gtr 2 goto rl
echo You beat the robber!
echo You he leaves behind 10 coins
set /a coins=coins+10
echo Coins: %coins%
echo.
pause
goto rec

:rl
echo You attempt to fight the robber and lose!
echo He has taken all of your coins.
set /a coins=0
echo.
pause
goto preloop
:rec
cls
echo Do you want to continue your adventure? (Y/N)
set /p nev=
if /i %nev%==N goto preloop
if /i %nev%==Y goto xddd
goto rec
:xddd
set /a nev=%random% %%5
if %nev% lss 4 goto adloop1
goto randevent