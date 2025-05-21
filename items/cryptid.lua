------------------------------------------------------------------
if next(SMODS.find_mod('Cryptid')) and Cryptid then -- DONT REMOVE
------------------------------------------------------------------

-- Atlas
SMODS.Atlas{
    key = "Cryptid",
    px = 46,
    py = 58,
    path = "Cryptid.png"
}

-- Happy House
Partner_API.Partner{
    key = "happy_house",
    name = "Happy House Partner",
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    loc_txt = {},
    atlas = "Cryptid",
    config = { extra = { related_card = "j_cry_happyhouse", emult = 1.14 } },
    loc_vars = function(self, info_queue, card)
        local benefits = 1
        if next(SMODS.find_card("j_cry_happyhouse")) then
            benefits = 1.7543859649
        end
        return { vars = {card.ability.extra.emult*benefits} }
    end,
    calculate = function(self, card, context)
        if context.partner_main then
            local benefits = 1
            if next(SMODS.find_card("j_cry_happyhouse")) then
                benefits = 1.754385964912280701754385964912280701754385964912280701754
            end
            return {
                emult = card.ability.extra.emult*benefits,
            }
        end
    end,
}

------------------
end -- DONT REMOVE
------------------