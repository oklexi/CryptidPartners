-- main partners

SMODS.Atlas{
    key = "Partner",
    px = 46,
    py = 58,
    path = "Partners.png"
}

-- Happy House
Partner_API.Partner{
    key = "happy_house",
    name = "Happy House Partner",
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    loc_txt = {},
    atlas = "Partner",
    config = { extra = { related_card = "j_cry_happyhouse", x_mult = 1.14 } },
    loc_vars = function(self, info_queue, card)
        local benefits = 1
        if next(SMODS.find_card("j_cry_happyhouse")) then
            benefits = 3.5087719298
        end
        return { vars = {card.ability.extra.x_mult*benefits} }
    end,
    calculate = function(self, card, context)
        if context.partner_main then
            local benefits = 1
            if next(SMODS.find_card("j_cry_happyhouse")) then
                benefits = 3.5087719298
            end
            return {
                xmult = card.ability.extra.x_mult*benefits,
            }
        end
    end,
}