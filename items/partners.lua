SMODS.Atlas{
    key = "Partners",
    px = 46,
    py = 58,
    path = "Partners.png"
}

Partner_API.Partner{
    key = "cash_note",
    name = "Cash Note Partner",
    individual_quips = true,
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    loc_txt = {},
    atlas = "Partners",
    config = { extra = { dollars = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.dollars) } }
	end,
    calculate = function(self, card, context)
        if context.partner_main then
			ease_dollars(lenient_bignum(card.ability.extra.dollars))
			return { message = "$" .. number_format(lenient_bignum(card.ability.extra.dollars)), colour = G.C.MONEY }
        end
    end,
}

Partner_API.Partner{
    key = "snack",
    name = "Snack Partner",
    individual_quips = true,
    unlocked = true,
    discovered = true,
    pos = {x = 1, y = 0},
    loc_txt = {},
    atlas = "Partners",
    config = { extra = { chips = 7, mult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                card = card
            }
        end
    end,
}