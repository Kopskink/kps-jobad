QBCore = exports['qb-core']:GetCoreObject()

lib.addCommand('jobad', {
    help = Lang:t("adhelp.help"),
    params = {
        {
            name = 'desc',
            type = 'longString',
            help = Lang:t("adhelp.desc"),
        },
    },
    restricted = false
}, function(source, args, raw)
    if args.desc == nil then
        print('Error: args.desc is nil')
        return
    end

    TriggerClientEvent('kps-jobad:client:ShowAlert', source, args.desc, Config.AdPayment.usesocietymoney, Config.AdPayment.price)
end)

RegisterNetEvent('kps-jobad:server:ConfirmPayment')
AddEventHandler('kps-jobad:server:ConfirmPayment', function(desc, useSocietyMoney, price)
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local playerbalance = xPlayer.PlayerData.money.bank

    if useSocietyMoney then
        if Config.SocietyMoneyBank == 'Renewed-Banking' then
            local societyAccount = exports['Renewed-Banking']:getAccountMoney(xPlayer.PlayerData.job.name)
            
            if societyAccount >= price then
                Lang:t("payment.descr")
                exports['Renewed-Banking']:handleTransaction(
                    xPlayer.PlayerData.job.name, 
                    Lang:t("payment.explanation"), 
                    price, 
                    Lang:t("payment.descr", {cost = price}), 
                    Lang:t("payment.adcompany"), 
                    xPlayer.PlayerData.job.label .. ': ' .. xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname, 
                    'withdraw'
                )
                exports['Renewed-Banking']:removeAccountMoney(xPlayer.PlayerData.job.name, price)
                TriggerClientEvent("chatMessage", -1, xPlayer.PlayerData.job.label, Config.ChatMessageColor, desc)
            else
                lib.notify(source, {
                    description = Lang:t("payment.socbankpoor"),
                })
            end
        else
            print('[KPS-JOBAD]: A not compatible Banking System set inside the Config.')
            print('[KPS-JOBAD]: Your Config.SocietyMoneyBank has been set as: ' .. Config.SocietyMoneyBank .. '. Currently this script only works with Renewed-Banking!')
        end
    else
        if playerbalance >= price then
            xPlayer.Functions.RemoveMoney('bank', price, Lang:t("payment.explanation"))
            TriggerClientEvent("chatMessage", -1, xPlayer.PlayerData.job.label, Config.ChatMessageColor, desc)
        else
            lib.notify(source, {
                description = Lang:t("payment.urbankpoor"),
            })
        end
    end
end)

RegisterNetEvent('kps-jobad:server:CancelPayment')
AddEventHandler('kps-jobad:server:CancelPayment', function()
    local source = source
    lib.notify(source, {
        description = Lang:t("payment.cancel"),
    })
end)
