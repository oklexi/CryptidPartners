SMODS.Atlas{
    key = "Partners",
    px = 46,
    py = 58,
    path = "Partners.png"
}

-- Astronomer
Partner_API.Partner{
    key = "astronomer",
    name = "Astronomer Partner",
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    loc_txt = {},
    atlas = "Partners",
    config = { extra = { related_card = "j_cry_happyhouse", emult = 1.14 } },
    loc_vars = function(self, info_queue, card)
        return { vars = {""..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odd} }
    end,
    calculate = function(self, card, context)
        if context.partner_pre_discard and pseudorandom("astronomer_pnr") < G.GAME.probabilities.normal/card.ability.extra.odd then
            local benefits = 1
            if next(SMODS.find_card("j_astronomer")) then benefits = 2 end
            local text, disp_text = G.FUNCS.get_poker_hand_info(context.full_hand)
            card_eval_status_text(card, "extra", nil, nil, nil, {message = localize("k_upgrade_ex")})
            update_hand_text({sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3}, {handname = localize(text, "poker_hands"), chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level = G.GAME.hands[text].level})
            level_up_hand(card, text, nil, card.ability.extra.upgrade_mod*benefits)
            update_hand_text({sound = "button", volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = "", level = ""})
        end
    end,
}