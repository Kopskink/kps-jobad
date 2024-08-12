QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kps-jobad:client:ShowAlert')
AddEventHandler('kps-jobad:client:ShowAlert', function(desc, useSocietyMoney, price)
    local alertResult

    if useSocietyMoney then
        alertResult = lib.alertDialog({
            header = Lang:t("alert.header"),
            content = Lang:t("alert.socbankcontent", {text = desc, cost = price}),
            cancel = true,
        })
    else
        alertResult = lib.alertDialog({
            header = Lang:t("alert.header"),
            content = Lang:t("alert.urbankcontent", {text = desc, cost = price}),
            cancel = true,
        })
    end

    if alertResult == "confirm" then
        TriggerServerEvent('kps-jobad:server:ConfirmPayment', desc, useSocietyMoney, price)
    else
        TriggerServerEvent('kps-jobad:server:CancelPayment')
    end
end)
