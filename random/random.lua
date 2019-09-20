--[[------------------------------------
RandomLua v0.3.1
Pure Lua Pseudo-Random Numbers Generator
Under the MIT license.
copyright(c) 2011 linux-man
--]]------------------------------------

--[[
https://github.com/linux-man/randomlua/
Mersenne Twister algorithm adapted to Defold by Niclas Åberg 2019.
--]]

local math_floor = math.floor

local function normalize(n) --keep numbers at (positive) 32 bits
	return n % 0x80000000
end

local function bit_and(a, b)
	local r = 0
	local m = 0
	for m = 0, 31 do
		if (a % 2 == 1) and (b % 2 == 1) then r = r + 2^m end
		if a % 2 ~= 0 then a = a - 1 end
		if b % 2 ~= 0 then b = b - 1 end
		a = a / 2 b = b / 2
	end
	return normalize(r)
end

local function bit_or(a, b)
	local r = 0
	local m = 0
	for m = 0, 31 do
		if (a % 2 == 1) or (b % 2 == 1) then r = r + 2^m end
		if a % 2 ~= 0 then a = a - 1 end
		if b % 2 ~= 0 then b = b - 1 end
		a = a / 2 b = b / 2
	end
	return normalize(r)
end

local function bit_xor(a, b)
	local r = 0
	local m = 0
	for m = 0, 31 do
		if a % 2 ~= b % 2 then r = r + 2^m end
		if a % 2 ~= 0 then a = a - 1 end
		if b % 2 ~= 0 then b = b - 1 end
		a = a / 2 b = b / 2
	end
	return normalize(r)
end

local function seed()
	return normalize(os.time())
end

M = {}

local mt
local index

function M.random_seed(self,s)

	mt = {}
	index = 0
	if not s then s = seed() end
	mt[0] = normalize(s)
	for i = 1, 623 do
		mt[i] = normalize(0x6c078965 * bit_xor(mt[i-1], math_floor(mt[i-1] / 0x40000000)) + i)
	end
	
end

function M.random(self,a, b)

	if not(mt) then
		self.random_seed(os.time())
	end
	
	local y
	if index == 0 then
		for i = 0, 623 do
			--y = bit_or(math_floor(mt[i] / 0x80000000) * 0x80000000, mt[(i + 1) % 624] % 0x80000000)
			y = mt[(i + 1) % 624] % 0x80000000
			mt[i] = bit_xor(mt[(i + 397) % 624], math_floor(y / 2))
			if y % 2 ~= 0 then mt[i] = bit_xor(mt[i], 0x9908b0df) end
		end
	end
	y = mt[index]
	y = bit_xor(y, math_floor(y / 0x800))
	y = bit_xor(y, bit_and(normalize(y * 0x80), 0x9d2c5680))
	y = bit_xor(y, bit_and(normalize(y * 0x8000), 0xefc60000))
	y = bit_xor(y, math_floor(y / 0x40000))
	index = (index + 1) % 624
	if not a then return y / 0x80000000
	elseif not b then
		if a == 0 then return y
		else return 1 + (y % a)
		end
	else
		return a + (y % (b - a + 1))
	end
	
end

return M
