Config = Config or {}

Config.SocietyMoneyBank = 'Renewed-Banking' -- string ** to use society money this script has been set up currently to only use Renewed-Banking
Config.ChatMessageColor = 6 -- number ** this depends on the chat script that you use, chat addmessage event can be found at: server/main.lua:34 and server/main.lua:47

Config.AdPayment = {
    enable = true, -- boolean ** enable or disable the payment system for the sending the ad
    usesocietymoney = true, -- boolean ** true = uses society money to cover the price of the ad ** false = uses the persons personal bank account's money who sent the ad
    price = 3000, -- number ** price to send the ad
}