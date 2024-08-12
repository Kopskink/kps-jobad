local Translations = {
	adhelp = {
        help = 'Advertise your company with catchy sentences!',
		desc = 'Ad text',
	},
    alert = {
        header = '**COST OF ADVERTISING!**',
        socbankcontent = 'Advertising with content: \n\n**%{text}** \n\n Requires **$%{cost}** from your organization\'s bank account.',
        urbankcontent = 'Advertising with content: \n\n**%{text}** \n\n Requires **$%{cost}** from your bank account.',
    },
    payment = {
        explanation = 'Advertising payment.', 
        socbankpoor = 'Your organization\'s bank account does not have the appropriate amount of money to cover the cost of advertising.',
        urbankpoor = 'Your bank account does not have the appropriate amount of money to cover the cost of advertising.',
        cancel = '**You had second thoughts...**',
        adcompany = 'Los Santos Advertisement Company',
        descr = 'Payment in the amount of $%{cost} to advertise the organization.',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
