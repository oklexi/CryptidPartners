local files = {
	"items/cryptid",
    --"items/partners",
	--"items/cryptposting", :eyes:
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end

SMODS.Atlas{
    key = "modicon",   
    px = 34,
    py = 34,
    path = "icon.png"
}