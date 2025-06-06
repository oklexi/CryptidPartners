return {
    descriptions = {
        Partner={
            -- Base game
            pnr_prpl_cash_note={
                name = "Cash Note",
                text = {
                    "{C:gold}+$#1#{}",
                },
            },
            pnr_prpl_snack={
                name = "Snack",
                text = {
                    "Played cards give",
                    "{C:chips}+#1#{} Chips and",
                    "{C:mult}+#2#{} Mult when scored",
                },
            },

            -- Cryptid
            pnr_prpl_happy_house={
                name = "Joyful Home",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult",
                },
            },
            pnr_prpl_code_partner={
                name = "Coding Buddy",
                text = {
                    "Shop stocks an",
                    "extra {C:attention,T:p_cry_code_normal_1}Code Pack{}",
                    "every {C:attention}#2#{C:inactive} [#1#]{} rounds",
                },
            },
        },
    },
    misc = {
        quips = {
            -- Base game
            pnr_prpl_cash_note_1={
                "kaching"
            },
            pnr_prpl_cash_note_2={
                "{C:money}money{}"
            },
            pnr_prpl_snack_1={
                "Munch"
            },
            pnr_prpl_snack_2={
                "Nom Nom Nom"
            },

            -- Cryptid
            pnr_prpl_code_partner_1={
                "print({C:attention}\"Hello World\"{})"
            },
        },
    },
}