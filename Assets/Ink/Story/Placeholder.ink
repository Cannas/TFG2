INCLUDE Eleden
INCLUDE Letach
INCLUDE Ulque
INCLUDE Cracya
INCLUDE Variables

LIST marketplace_Itens_Forzag = Wheat, Salt, Pepper, Potato
LIST marketplace_Itens_Qt = Wheat = 4, Salt = 4, Pepper = 3, Potato = 2
VAR wheat_Qt_Forzag = 4
VAR salt_Qt_Forzag = 4
VAR pepper_Qt_Forzag = 3
VAR potato_Qt_Forzag = 2

VAR wheat_Price_Forzag = 2
VAR salt_Price_Forzag = 2
VAR pepper_Price_Forzag = 3
VAR potato_Price_Forzag = 5

->  city_center_Forzag

==city_center_Forzag==
{weekdays}, {months} {days}st of Year {years}

City Center
+ [Go to the Marketplace] -> marketplace_Forzag
+ [Go to the City Hall] -> city_hall_Forzag
+ [Check Inventory] -> check_invent
+ [Travel] -> travel_list_Forzag

==marketplace_Forzag==
{weekdays}, {months} {days}st of Year {years}

Marketplace placeholder
To Buy
{marketplace_Itens_Forzag(1)} - {wheat_Qt_Forzag} Units - {wheat_Price_Forzag} Coins
{marketplace_Itens_Forzag(2)} - {salt_Qt_Forzag} Units - {salt_Price_Forzag} Coins
{marketplace_Itens_Forzag(3)} - {pepper_Qt_Forzag} Units - {pepper_Price_Forzag} Coins
{marketplace_Itens_Forzag(4)} - {potato_Qt_Forzag} Units - {potato_Price_Forzag} Coins

You have {money_Player} Coins

+ {money_Player >= wheat_Price_Forzag && wheat_Qt_Forzag > 0} [Buy Wheat] 
~wheat_Qt_Forzag -= 1
~invent_Wheat += 1
~money_Player -= wheat_Price_Forzag
->marketplace_Forzag
+ {money_Player >= salt_Price_Forzag && salt_Qt_Forzag > 0} [Buy Salt] 
~salt_Qt_Forzag -= 1
~invent_Salt += 1
~money_Player -= salt_Price_Forzag
->marketplace_Forzag
+ {money_Player >= pepper_Price_Forzag && pepper_Qt_Forzag > 0} [Buy Pepper] 
~pepper_Qt_Forzag -= 1
~invent_Pepper += 1
~money_Player -= pepper_Price_Forzag
->marketplace_Forzag
+ {money_Player >= potato_Price_Forzag && potato_Qt_Forzag > 0} [Buy Potato]
~potato_Qt_Forzag -= 1
~invent_Potato += 1
~money_Player -= potato_Price_Forzag
->marketplace_Forzag
+ Sell Items -> sell_Forzag
+ [Leave] ->city_center_Forzag

==sell_Forzag==
{invent_Wheat > 0}Wheat - Sell for {price_WheatForzag}
{invent_Salt > 0}Salt - Sell for {price_SaltForzag}
{invent_Pepper > 0}Pepper - Sell for {price_PepperForzag}
{invent_Potato > 0}Potato - Sell for {price_PotatoForzag}

+{invent_Wheat > 0}[Sell Wheat]
~invent_Wheat -= 1
~money_Player += price_WheatForzag
~wheat_Qt_Forzag += 1
->sell_Forzag

+{invent_Salt > 0}[Sell Salt]
~invent_Salt -= 1
~money_Player += price_SaltForzag
~salt_Qt_Forzag += 1
->sell_Forzag

+{invent_Pepper > 0}[Sell Pepper]
~invent_Pepper -= 1
~money_Player += price_PepperForzag
~pepper_Qt_Forzag += 1
->sell_Forzag

+{invent_Potato > 0}[Sell Potato]
~invent_Potato -= 1
~money_Player += price_PotatoForzag
~potato_Qt_Forzag += 1
->sell_Forzag

+[Stop Selling]
->marketplace_Forzag

->city_center_Forzag

==city_hall_Forzag==
{weekdays}, {months} {days}st of Year {years}

City Hall placeholder
->city_center_Forzag


You have {money_Player} coins
->city_center_Forzag

==travel_list_Forzag==
{weekdays}, {months} {days}st of Year {years}

Traveling placeholder
+ [Go to Eleden] -> traveling_Eleden
+ [Go to Letach] -> traveling_Letach
+ [Go to Ulque] -> traveling_Ulque
+ [Go to Cracya] -> traveling_Cracya

==traveling_Forzag==
Traveling
~days += 3
~weekdays += 3
->city_center_Forzag


    -> END