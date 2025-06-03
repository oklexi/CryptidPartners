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
    no_quips = true,
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

Partner_API.Partner{
    key = "code_partner",
    name = "Coding Partner",
    individual_quips = true,
    unlocked = true,
    discovered = true,
    pos = {x = 1, y = 0},
    soul_pos = {x = 2, y = 0},
    loc_txt = {},
    atlas = "Cryptid",
    config = {extra = {related_card = "j_cry_CodeJoker", round = 3, rounds = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.p_cry_code_normal_1
        return { vars = {card.ability.extra.rounds, card.ability.extra.round} }
    end,
    calculate = function(self, card, context)
        if context.partner_setting_blind then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds <= 0 then
                card.ability.extra.rounds = 0
            end
        end
        if context.partner_starting_shop and card.ability.extra.rounds <= 0 then
            card.ability.extra.rounds = card.ability.extra.round
            G.E_MANAGER:add_event(Event({func = function()
                local key = "p_cry_code_normal_"..(math.random(1, 2))
                if next(SMODS.find_card("j_cry_CodeJoker")) then key = "p_cry_code_jumbo_1" end
                local _card = Card(G.shop_booster.T.x+G.shop_booster.T.w/2, G.shop_booster.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                create_shop_card_ui(_card, "Booster", G.shop_booster)
                _card:start_materialize()
                G.shop_booster:emplace(_card)
                if next(SMODS.find_card("j_cry_CodeJoker")) then _card.ability.couponed = true; _card:set_cost() end
            return true end}))
            card_eval_status_text(card, "extra", nil, nil, nil, {message = localize("k_booster"), colour = G.C.PURPLE})
        end
    end,
}

------------------
end -- DONT REMOVE
------------------